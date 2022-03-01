package recipebbs;


import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class RecipebbsDAO {
	private Connection conn;
	private ResultSet rs;
	
public RecipebbsDAO(){
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://localhost:3306/hompage";
		String DB_USER = "root";
		String DB_PASSWORD= "0000";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	}catch (Exception e) {
		e.printStackTrace();
	}
}

//작성일자 메소드
	public String getDate() {
		String sql = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	
	//게시글 번호 부여 메소드
	public int getNext() {
		
		String sql = "select rebbsID from recipebbs order by rebbsID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	//글쓰기 메소드
	public int write(String rebbsTitle, String userID, String rebbsContent) {
		String sql = "insert into bbs values(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, rebbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, rebbsContent);
			pstmt.setInt(6, 1); 
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
  
	//게시글 리스트 메소드
	public ArrayList<Recipebbs> getList(int pageNumber){
		String sql = "select * from recipebbs where rebbsID < ? and rebbsAvailable = 1 order by rebbsID desc limit 10";
		ArrayList<Recipebbs> list = new ArrayList<Recipebbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Recipebbs rebbs = new Recipebbs();
				rebbs.setRebbsID(rs.getInt(1));
				rebbs.setRebbsTitle(rs.getString(2));
				rebbs.setUserID(rs.getString(3));
				rebbs.setRebbsDate(rs.getString(4));
				rebbs.setRebbsContent(rs.getString(5));
				rebbs.setRebbsAvailable(rs.getInt(6));
				list.add(rebbs);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//게시글 검색 메소드
	public ArrayList<Recipebbs> getSearch(String searchField, String searchText){
	      ArrayList<Recipebbs> list = new ArrayList<Recipebbs>();
	      String SQL ="select * from recipebbs WHERE "+searchField.trim();
	      try {
	            if(searchText != null && !searchText.equals("") ){
	                SQL +=" LIKE '%"+searchText.trim()+"%' order by rebbsID desc limit 10";
	            }
	            PreparedStatement pstmt=conn.prepareStatement(SQL);
				rs=pstmt.executeQuery();//select
	         while(rs.next()) {
	        	 Recipebbs rebbs = new Recipebbs();
					rebbs.setRebbsID(rs.getInt(1));
					rebbs.setRebbsTitle(rs.getString(2));
					rebbs.setUserID(rs.getString(3));
					rebbs.setRebbsDate(rs.getString(4));
					rebbs.setRebbsContent(rs.getString(5));
					rebbs.setRebbsAvailable(rs.getInt(6));
					list.add(rebbs);
	         }         
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
	      return list;//ㄱㅔ시글 리스트 반환
	}
	
	//페이징 처리 메소드
	public boolean nextPage(int pageNumber) {
		String sql = "select * from recipebbs where rebbsID < ? and rebbsAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	public Recipebbs getBbs(int rebbsID) {
		String sql = "select * from recipebbs where rebbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rebbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Recipebbs rebbs = new Recipebbs();
				rebbs.setRebbsID(rs.getInt(1));
				rebbs.setRebbsTitle(rs.getString(2));
				rebbs.setUserID(rs.getString(3));
				rebbs.setRebbsDate(rs.getString(4));
				rebbs.setRebbsContent(rs.getString(5));
				rebbs.setRebbsAvailable(rs.getInt(6));
				return rebbs;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//게시글 수정 메소드
	public int update(int rebbsID, String rebbsTitle, String rebbsContent) {
		String sql = "update recipebbs set rebbsTitle = ?, rebbsContent = ? where rebbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rebbsTitle);
			pstmt.setString(2, rebbsContent);
			pstmt.setInt(3, rebbsID);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	//게시글 삭제 메소드
	public int delete(int rebbsID) {
		String sql = "update recipebbs set rebbsAvailable = 0 where rebbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rebbsID);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류 
	}
}

