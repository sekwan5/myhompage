package user;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public UserDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String DB_URL = "jdbc:mysql://localhost:3306/hompage?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
			String DB_USER = "root";
			String DB_PASSWORD= "0000";
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	

public int login(String userID, String userPassword) {
	String sql = "select userPassword from user where userID = ?";
	try {
		pstmt = conn.prepareStatement(sql); //sql�������� ��� ��Ų��
		pstmt.setString(1, userID); //ù��° '?'�� �Ű������� �޾ƿ� 'userID'�� ����
		rs = pstmt.executeQuery(); //������ ������ ����� rs�� ����
		if(rs.next()) {
			if(rs.getString(1).equals(userPassword)) {
				return 1; //�α��� ����
			}else
				return 0; //��й�ȣ Ʋ��
		}
		return -1; //���̵� ����
	}catch (Exception e) {
		e.printStackTrace();
	}
	return -2; //����
}


public int join(User user) {
	  String sql = "insert into user values(?, ?, ?, ?, ?)";
	  try {
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, user.getUserID());
	    pstmt.setString(2, user.getUserPassword());
	    pstmt.setString(3, user.getUserName());
	    pstmt.setString(4, user.getUserGender());
	    pstmt.setString(5, user.getUserEmail());
	    return pstmt.executeUpdate(); //1
	  }catch (Exception e) {
	 	e.printStackTrace();
	  }
	  return -1;
	}


public User getInfo(String userID) {
	User us = null;
	String sql = "select * from user where userID = ?";
	try {
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, userID); 
		rs = pstmt.executeQuery(); 
		
		if(rs.next()) {
			us = new User();
			us.setUserID(rs.getString("userID"));
			us.setUserPassword(rs.getString("userPassword"));
			us.setUserName(rs.getString("userName"));
			us.setUserGender(rs.getString("userGender"));
			us.setUserEmail(rs.getString("userEmail"));
		}
	}catch (Exception e) {
		e.printStackTrace();
	}
	return us;
}


public int updateUser(String userID) {
	User us = null;
	String sql = "select userPassword from user where userID = ?";
	try {
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, userID); 
		rs = pstmt.executeQuery(); 
		
		if(rs.next()) {
			us = new User();
			if(us.getUserPassword().equals(rs.getString("userPassword"))) {
				sql = "update user set userName=?, userGender=?, userEail=?"+
						"where userID=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, us.getUserID());
				pstmt.executeUpdate();
				System.out.println("ȸ��������������");
				return 1;
			}else{
				return 0;
			}
		}else{ //DB�� ���� ȸ��
			return -1;			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally{
		
	}
	return -2;
	
}
}
