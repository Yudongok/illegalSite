package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mvc.database.DBConnection;

public class LoginDAO {

	public LoginDAO() {
	}
	private static LoginDAO instance;
		
		public static LoginDAO getInstance() {
			if(instance == null)
				instance = new LoginDAO();
			return instance;
		}
		
		public String getId(String id) {
			String DB_id = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT id FROM users WHERE id = ?";
			
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					DB_id = rs.getString("id");
				}
			}catch (Exception e) {
				System.out.println("예외가 발생했습니다." + e.getMessage());
				e.printStackTrace();
			}finally {
				try{
					if(rs != null)
						rs.close();
					if(pstmt != null)
						pstmt.close();
					if(conn != null)
						conn.close();
				}catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}
			}
			return DB_id;
		}
		
		public String getPasswd(String id, String passwd) {
			String DB_pw = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT passwd FROM users WHERE id = ?";
			
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					DB_pw = rs.getString("passwd");
					return DB_pw;
				}
			}catch (Exception e) {
				System.out.println("예외가 발생했습니다." + e.getMessage());
				e.printStackTrace();
			}finally {
				try{
					if(rs != null)
						rs.close();
					if(pstmt != null)
						pstmt.close();
					if(conn != null)
						conn.close();
				}catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}
			}
			return DB_pw;
		}
		
		public int getBalance(String id) {
			int DB_balance = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT balance FROM users WHERE id = ?";
			
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					DB_balance = rs.getInt("balance");
					return DB_balance;
				}
			}catch (Exception e) {
				System.out.println("예외가 발생했습니다." + e.getMessage());
				e.printStackTrace();
			}finally {
				try{
					if(rs != null)
						rs.close();
					if(pstmt != null)
						pstmt.close();
					if(conn != null)
						conn.close();
				}catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}
			}
			return 0;
		}
		
		public String getName(String id) {
			String DB_name = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT name FROM users WHERE id = ?";
			
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					DB_name = rs.getString("name");
					return DB_name;
				}
			}catch (Exception e) {
				System.out.println("예외가 발생했습니다." + e.getMessage());
				e.printStackTrace();
			}finally {
				try{
					if(rs != null)
						rs.close();
					if(pstmt != null)
						pstmt.close();
					if(conn != null)
						conn.close();
				}catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}
			}
			return null;
		}

}
