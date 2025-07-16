package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mvc.database.DBConnection;

public class AccountDAO {
	public boolean insertAccount(AccountDTO account) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO account (id, accountNumber, password, name, gender, address, bank, place, money, registDay) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, account.getId());
            pstmt.setString(2, account.getAccountNumber());
            pstmt.setString(3, account.getPassword());
            pstmt.setString(4, account.getName());
            pstmt.setString(5, account.getGender());
            pstmt.setString(6, account.getAddress());
            pstmt.setString(7, account.getBank());
            pstmt.setString(8, account.getPlace());
            pstmt.setInt(9, account.getMoney());
            pstmt.setString(10, account.getRegistDay());
            
            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
	
	//이 부분 추가
	public int getBalance(String accountNumber) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int balance = -1;

	    try {
	        conn = DBConnection.getConnection();
	        String sql = "SELECT money FROM account WHERE accountNumber = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, accountNumber);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            balance = rs.getInt("money");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try { if (rs != null) rs.close(); } catch (Exception e) {}
	        try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
	        try { if (conn != null) conn.close(); } catch (Exception e) {}
	    }

	    return balance;
	}
	
	public boolean updateBalance(String accountNumber, int newBalance) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    try {
	        conn = DBConnection.getConnection();
	        String sql = "UPDATE account SET money = ? WHERE accountNumber = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, newBalance);
	        pstmt.setString(2, accountNumber);
	        int rows = pstmt.executeUpdate();
	        return rows > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
	        try { if (conn != null) conn.close(); } catch (Exception e) {}
	    }
	}
	
	public AccountDTO getAccount(String accountNumber) {
	    AccountDTO account = null;
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        conn = DBConnection.getConnection();
	        String sql = "SELECT * FROM account WHERE accountNumber = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, accountNumber);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            account = new AccountDTO();
	            account.setAccountNumber(rs.getString("accountNumber"));
	            account.setAccountNumber(rs.getString("otherAccount"));
	            account.setPassword(rs.getString("password"));
	            account.setBank(rs.getString("bank"));
	            // 필요한 필드 더 추가
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try { if (rs != null) rs.close(); } catch (SQLException e) {}
	        try { if (pstmt != null) pstmt.close(); } catch (SQLException e) {}
	        try { if (conn != null) conn.close(); } catch (SQLException e) {}
	    }

	    return account;
	}
	
	
}


