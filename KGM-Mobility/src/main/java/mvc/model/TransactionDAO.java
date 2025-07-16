package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mvc.database.DBConnection;

public class TransactionDAO {

	public boolean insertAccount(TransactionDTO transaction) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO transaction (accountNumber, password, name, type, transactionTime, money, bank, otherAccount) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, transaction.getAccountNumber());
            pstmt.setString(2, transaction.getPassword());
            pstmt.setString(3, transaction.getName());
            pstmt.setString(4, transaction.getType());
            pstmt.setString(5, transaction.getTransactionTime());
            pstmt.setInt(6, transaction.getMoney());
            pstmt.setString(7, transaction.getBank());
            pstmt.setString(8, transaction.getOtherAccount());
           
            
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
	
	
	 public List<TransactionDTO> getAllTransactions() {
	        List<TransactionDTO> transactionList = new ArrayList<>();
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;

	        try {
	            conn = DBConnection.getConnection();
	            String sql = "SELECT * FROM transaction";
	            pstmt = conn.prepareStatement(sql);
	            rs = pstmt.executeQuery();

	            while (rs.next()) {
	                TransactionDTO transaction = new TransactionDTO();
	                // 거래내역 정보 설정
	                transaction.setAccountNumber(rs.getString("accountNumber"));
	                transaction.setPassword(rs.getString("password"));
	                transaction.setName(rs.getString("name"));
	                transaction.setType(rs.getString("type"));
	                transaction.setBank(rs.getString("bank"));
	                transaction.setMoney(rs.getInt("money"));
	                transaction.setOtherAccount(rs.getString("otherAccount"));
	                transaction.setTransactionTime(rs.getString("transactionTime"));
	                // 리스트에 추가
	                transactionList.add(transaction);
	            }
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (pstmt != null) pstmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	        return transactionList;
	    }
	}
	
