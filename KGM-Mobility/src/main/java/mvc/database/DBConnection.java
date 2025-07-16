/*
 * package mvc.database;
 * 
 * import java.sql.Connection; import java.sql.SQLException; import
 * java.sql.DriverManager;
 * 
 * public class DBConnection { public static Connection getConnection()throws
 * SQLException, ClassNotFoundException {
 * 
 * Connection conn = null;
 * 
 * String url = "jdbc:mysql://localhost:3306/testdb"; // 이부분을 자기 데이터베이스 명으로
 * 수정한다. String user = "root"; String password = "1234";
 * 
 * Class.forName("com.mysql.jdbc.Driver"); conn =
 * DriverManager.getConnection(url, user, password);
 * 
 * return conn; } }
 */

package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection()throws SQLException, ClassNotFoundException{
       
       Connection conn=null;
       
       String url;
		
		
		String user = "gg551098"; String password = "rhdwjddn1!";
		 
		 
		
		/* String user = "root"; String password = "1234"; */
		 
       
       boolean isWindows = System.getProperty("os.name").toLowerCase().startsWith("windows");
        
        if(isWindows) url = "jdbc:mysql://localhost:3306/testdb";
        
        else url = "jdbc:mysql://localhost:3306/gg551098db?serverTimezone=UTC&characterEncoding=utf8";
        
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(url, user, password);
        
        return conn;
    }
}
