package filter;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;

public class LogFileFilter implements Filter {
    
    PrintWriter writer;

    public void init(FilterConfig config) throws ServletException {
        // String filename=config.getInitParameter("filename");
        
        String filename;
        boolean isWindows = System.getProperty("os.name").toLowerCase().startsWith("windows");
        if(isWindows) filename = "C://logs/KJWPRJ.log";
        else filename = System.getProperty("catalina.base") + "/webapps/uploads/gg551098/KJWPRJ.log";
        
        if (filename == null)
            throw new ServletException("로그 파일은 이름을 찾을 수 없습니다.");
        
        try {
            writer = new PrintWriter(new OutputStreamWriter(new FileOutputStream(filename, true), StandardCharsets.UTF_8), true);
         // 한글 깨짐 현상 해결  utf-8 BOM (Byte Order Mark) 코드
            writer.printf("\uFEFF");   
        } catch (IOException e) {
            throw new ServletException("로그 파일을 열 수 없습니다.", e);
        }
    }
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        writer.println(" 접속한 클라이언트 IP : " + request.getRemoteAddr());
        long start = System.currentTimeMillis();
        writer.println(" 접근한 URL 경로 " + getURLPath(request));
        writer.println(" 요청 처리 시작 시각 : " + getCurrentTime());

//      chain.doFilter(request, response);
        try {
            chain.doFilter(request, response); // 이걸 반드시 try 안에서 실행
        } catch (Exception e) {
            writer.println(" 예외 발생: " + e.getMessage());
            e.printStackTrace(writer); // 로그파일에 예외 스택트레이스 기록
            throw e instanceof ServletException ? (ServletException) e : new ServletException(e); // 예외 다시 던져야 error-page 작동함
        }

        long end = System.currentTimeMillis();
        writer.println(" 요청 처리 종료 시각 : " + getCurrentTime());
        writer.println(" 요청 처리 소요 시간 : " + (end - start) + "ms ");

        writer.println("===================================");
    }
    
    public void destroy() {
        writer.close();
    }
    
    private String getURLPath(ServletRequest request) {
        HttpServletRequest req;
        String currentPath = "";
        String queryString = "";
        if (request instanceof HttpServletRequest) {
            req = (HttpServletRequest) request;
            currentPath = req.getRequestURI();
            queryString = req.getQueryString();
            queryString = queryString == null ? "" : "?" + queryString;
        }
        return currentPath + queryString;
    }
    
    private String getCurrentTime() {
        DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        return formatter.format(calendar.getTime());
    }
}
