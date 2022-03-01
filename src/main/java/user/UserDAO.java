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
		pstmt = conn.prepareStatement(sql); //sql쿼리문을 대기 시킨다
		pstmt.setString(1, userID); //첫번째 '?'에 매개변수로 받아온 'userID'를 대입
		rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
		if(rs.next()) {
			if(rs.getString(1).equals(userPassword)) {
				return 1; //로그인 성공
			}else
				return 0; //비밀번호 틀림
		}
		return -1; //아이디 없음
	}catch (Exception e) {
		e.printStackTrace();
	}
	return -2; //오류
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
				System.out.println("회원정보수정성공");
				return 1;
			}else{
				return 0;
			}
		}else{ //DB에 없는 회원
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
