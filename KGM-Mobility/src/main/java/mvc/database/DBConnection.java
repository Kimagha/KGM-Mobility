
package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection()throws SQLException, ClassNotFoundException{
       
       Connection conn=null;
       
       String url;
		
		
		String user = "아이디"; String password = "비밀번호"; 
		 
		 
		
		/* String user = "root"; String password = "1234"; */ 
		 
       
       boolean isWindows = System.getProperty("os.name").toLowerCase().startsWith("windows");
        
        if(isWindows) url = "jdbc:mysql://localhost:3306/testdb";
        
        else url = "jdbc:mysql://localhost:3306/아아디db?serverTimezone=UTC&characterEncoding=utf8";
        
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(url, user, password);
        
        return conn;
    }
}
