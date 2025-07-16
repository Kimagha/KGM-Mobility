package mvc.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.model.AccountDAO;
import mvc.model.AccountDTO;
import mvc.model.TransactionDAO;
import mvc.model.TransactionDTO;


@WebServlet({"/NewAccount.do", "/Withdraw.do", "/Transfer.do", "/Send.do","/Transaction.do"})
public class BankingControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = requestURI.substring(contextPath.length());
        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding("utf-8");

        if (command.equals("/NewAccount.do")) {
            NewAccount(request, response);
        } else if (command.equals("/Withdraw.do")) {
            Withdraw(request, response);
        } else if (command.equals("/Transfer.do")) {
            Transfer(request, response);
        } else if (command.equals("/Send.do")) {
            Send(request, response);
        } else if (command.equals("/Transaction.do")) {
            Transaction(request, response);
        }
        
    }

    private void Transaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	// 세션을 통해 로그인된 사용자의 ID를 가져옴
	    String loggedInUserId = (String) request.getSession().getAttribute("userId");

	    // 로그인되지 않은 경우 로그인 페이지로 이동
	    if (loggedInUserId == null) {
	        response.sendRedirect("login.jsp"); // 로그인 페이지로 이동하도록 설정
	        return;
	    }
    	
    	// TransactionDAO를 사용하여 모든 거래내역을 가져옴
        TransactionDAO transactionDAO = new TransactionDAO();
        List<TransactionDTO> transactionList = transactionDAO.getAllTransactions();

        // JSP로 전달
        request.setAttribute("transactionList", transactionList);
        RequestDispatcher rd = request.getRequestDispatcher("./Transaction.jsp");
        rd.forward(request, response);
    }

    
    
    private void Send(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	// 세션을 통해 로그인된 사용자의 ID를 가져옴
	    String loggedInUserId = (String) request.getSession().getAttribute("userId");

	    // 로그인되지 않은 경우 로그인 페이지로 이동
	    if (loggedInUserId == null) {
	        response.sendRedirect("login.jsp"); // 로그인 페이지로 이동하도록 설정
	        return;
	    }
	    
	    // 등록 버튼을 누른 시간을 현재 시간으로 설정

        Date currentDate = new Date();

        
        String accountNumber = request.getParameter("accountNumber");
        String otherAccount = request.getParameter("otherAccount");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String bank = request.getParameter("bank");
        String type = request.getParameter("type");
        int money = Integer.parseInt(request.getParameter("money"));
        
        
        // 2. 잔액 체크 후 송금 가능 여부 확인
        AccountDAO accountDAO = new AccountDAO();
        int senderBalance = accountDAO.getBalance(accountNumber);
        AccountDTO account = accountDAO.getAccount(accountNumber);

        if (senderBalance < money) {
            response.sendRedirect("Send.jsp?error=lowbalance");
            return;
        }
        
		/*
		 * if (account == null) { response.sendRedirect("Send.jsp?error=" +
		 * URLEncoder.encode("계좌없음", "UTF-8")); return; }
		 * 
		 * if (account == null || account.getPassword() == null || account.getBank() ==
		 * null || !account.getPassword().equals(password) ||
		 * !account.getBank().equals(bank)) { response.sendRedirect("Send.jsp?error=" +
		 * URLEncoder.encode("정보불일치", "UTF-8")); return; }
		 */
	    
	    
		/*
		 * if (!account.getPassword().equals(password) ||
		 * !account.getBank().equals(bank)) { response.sendRedirect("Send.jsp?error=" +
		 * URLEncoder.encode("정보불일치", "UTF-8")); return; }
		 */
        

        // 출금/입금 처리
        accountDAO.updateBalance(accountNumber, senderBalance - money);       // 출금
        int receiverBalance = accountDAO.getBalance(otherAccount);
        accountDAO.updateBalance(otherAccount, receiverBalance + money);     // 입금
        
        
        String transactionTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        
        
        
        TransactionDTO transaction = new TransactionDTO();
        transaction.setAccountNumber(accountNumber);
        transaction.setOtherAccount(otherAccount);
        transaction.setPassword(password);
        transaction.setName(name);
        transaction.setType(type);
        transaction.setBank(bank);
        transaction.setMoney(money);
        transaction.setTransactionTime(transactionTime);
        
        
        TransactionDAO transactionDAO = new TransactionDAO();
        boolean success = transactionDAO.insertAccount(transaction);

        if (success) {
	        response.sendRedirect("./Transaction.jsp"); // ✅ redirect 사용
	    } else {
            
            response.sendRedirect("Send.jsp?error=1");
        }
        
        
	}

	

	private void Transfer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션을 통해 로그인된 사용자의 ID를 가져옴
	    String loggedInUserId = (String) request.getSession().getAttribute("userId");

	    // 로그인되지 않은 경우 로그인 페이지로 이동
	    if (loggedInUserId == null) {
	        response.sendRedirect("login.jsp"); // 로그인 페이지로 이동하도록 설정
	        return;
	    }
	    
	    // 등록 버튼을 누른 시간을 현재 시간으로 설정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentDate = new Date();
        String transactionTime = dateFormat.format(currentDate);
        
        String accountNumber = request.getParameter("accountNumber");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String bank = request.getParameter("bank");
        String type = request.getParameter("type");
        int money = Integer.parseInt(request.getParameter("money"));
        
        
        AccountDAO accountDAO = new AccountDAO();
	    AccountDTO account = accountDAO.getAccount(accountNumber);
        
        if (money <= 0) {
			/* response.sendRedirect("Transfer.jsp?error=금액오류"); */
        	response.sendRedirect("Transfer.jsp?error=" + URLEncoder.encode("금액오류", "UTF-8"));
            return;
        }
        
		/*
		 * if (account == null) { response.sendRedirect("Transfer.jsp?error=" +
		 * URLEncoder.encode("계좌없음", "UTF-8")); return; }
		 * 
		 * if (account == null || account.getPassword() == null || account.getBank() ==
		 * null || !account.getPassword().equals(password) ||
		 * !account.getBank().equals(bank)) {
		 * response.sendRedirect("Transfer.jsp?error=" + URLEncoder.encode("정보불일치",
		 * "UTF-8")); return; }
		 */
	    
		/*
		 * if (!account.getPassword().equals(password) ||
		 * !account.getBank().equals(bank)) {
		 * response.sendRedirect("Transfer.jsp?error=" + URLEncoder.encode("정보불일치",
		 * "UTF-8")); return; }
		 */
        
        
        // ✅ 잔액 반영 추가
       
        int currentBalance = accountDAO.getBalance(accountNumber);
        accountDAO.updateBalance(accountNumber, currentBalance + money); // 입금이므로 +money
		
        TransactionDTO transaction = new TransactionDTO();
        transaction.setAccountNumber(accountNumber);
        transaction.setPassword(password);
        transaction.setName(name);
        transaction.setType(type);
        transaction.setBank(bank);
        transaction.setMoney(money);
        transaction.setTransactionTime(transactionTime);
        transaction.setOtherAccount("");
        
        
        TransactionDAO transactionDAO = new TransactionDAO();
        boolean success = transactionDAO.insertAccount(transaction);

        if (success) {
	        response.sendRedirect("./Transaction.jsp"); // ✅ redirect 사용
	    } else {
            
            response.sendRedirect("Transfer.jsp?error=1");
        }
        
        
	}

	private void Withdraw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String loggedInUserId = (String) request.getSession().getAttribute("userId");
	    if (loggedInUserId == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }

	    String accountNumber = request.getParameter("accountNumber");
	    String password = request.getParameter("password");
	    String name = request.getParameter("name");
	    String bank = request.getParameter("bank");
	    String type = request.getParameter("type");
	    int money = Integer.parseInt(request.getParameter("money"));

	    AccountDAO accountDAO = new AccountDAO();
	    AccountDTO account = accountDAO.getAccount(accountNumber);
	    int currentBalance = accountDAO.getBalance(accountNumber);

	    if (currentBalance < money) {
	    	response.sendRedirect("Withdraw.jsp?error=" + URLEncoder.encode("잔액부족", "UTF-8"));
	        return;
	    }
	    
		/*
		 * if (account == null) { response.sendRedirect("Withdraw.jsp?error=" +
		 * URLEncoder.encode("계좌없음", "UTF-8")); return; }
		 * 
		 * if (account == null || account.getPassword() == null || account.getBank() ==
		 * null || !account.getPassword().equals(password) ||
		 * !account.getBank().equals(bank)) {
		 * response.sendRedirect("Withdraw.jsp?error=" + URLEncoder.encode("정보불일치",
		 * "UTF-8")); return; }
		 */

	    // 출금 반영
	    accountDAO.updateBalance(accountNumber, currentBalance - money);

	    // 거래내역 저장
	    String transactionTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

	    TransactionDTO transaction = new TransactionDTO();
	    transaction.setAccountNumber(accountNumber);
	    transaction.setPassword(password);
	    transaction.setName(name);
	    transaction.setType(type);
	    transaction.setBank(bank);
	    transaction.setMoney(money);
	    transaction.setTransactionTime(transactionTime);
	    transaction.setOtherAccount("");

	    TransactionDAO transactionDAO = new TransactionDAO();	    
	    boolean success = transactionDAO.insertAccount(transaction);

	    if (success) {
	        response.sendRedirect("./Transaction.jsp"); // ✅ redirect 사용
	    } else {
	        response.sendRedirect("Withdraw.jsp?error=1");
	    }
	}
	
	

	private void NewAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		// 세션을 통해 로그인된 사용자의 ID를 가져옴
	    String loggedInUserId = (String) request.getSession().getAttribute("userId");

	    // 로그인되지 않은 경우 로그인 페이지로 이동
	    if (loggedInUserId == null) {
	        response.sendRedirect("login.jsp"); // 로그인 페이지로 이동하도록 설정
	        return;
	    }
	    
	    // 등록 버튼을 누른 시간을 현재 시간으로 설정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentDate = new Date();
        String registDay = dateFormat.format(currentDate);
		
		String accountNumber = request.getParameter("accountNumber");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String bank = request.getParameter("bank");
        String place = request.getParameter("place");
        int money = Integer.parseInt(request.getParameter("money"));
        
        AccountDTO account = new AccountDTO();
        account.setId(loggedInUserId); // 로그인된 사용자의 ID 설정
        account.setAccountNumber(accountNumber);
        account.setPassword(password);
        account.setName(name);
        account.setGender(gender);
        account.setAddress(address);
        account.setBank(bank);
        account.setPlace(place);
        account.setMoney(money);
        account.setRegistDay(registDay); // registDay 설정
        
        AccountDAO accountDAO = new AccountDAO();
        boolean success = accountDAO.insertAccount(account);

        
        if (success) {
            response.sendRedirect("./bank.jsp?success=" + accountNumber);
        } else {
            // Handle error if insertion fails
            response.sendRedirect("NewAccount.jsp?error=1");
        }
    }
}
