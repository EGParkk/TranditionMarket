package JYG.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import JYG.model.Board;
import JYG.model.Market;
import JYG.model.User;

public class MypageDAO {
	
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	public MypageDAO() {
		String URL = "jdbc:mysql://localhost:3306/tranditionMarket?useSSL=false";
		String id = "root";
		String pw= "1234";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(URL, id, pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void closeAll() {
		try {
			if(rs != null ) rs.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원 정보 조회
	public User showData(String id) {
		User user = null;
		try {
			String SQL = "select * from user where id = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setUserId(rs.getString("id"));
				user.setUserPassword(rs.getString("pw"));
				user.setUserAddress(rs.getString("uadd"));
				user.setUserEmail(rs.getString("email"));
				user.setUserIntro(rs.getString("intro"));
				user.setUserImg(rs.getString("uimg"));
				user.setUserNick(rs.getString("nick"));
				user.setUserName(rs.getString("uname"));
				user.setAdmin(rs.getByte("admin"));
				user.setWarning(rs.getInt("warning"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
	// 회원 탈퇴
	public boolean deleteUser(String id) {
		String SQL = "delete from user where id = ?";
		boolean delete = false;
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			
			delete = pstmt.executeUpdate() != 0;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		
		
		return delete;
		
	}
	
	// 내 정보 수정
	public boolean editMyData(User user) {
		boolean edit = false;
		String SQL = "update user set pw = ? , email = ? , uname = ?, nick = ?, uadd = ?, uimg = ?, intro = ? where id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserPassword());
			pstmt.setString(2, user.getUserEmail());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserNick());
			pstmt.setString(5, user.getUserAddress());
			pstmt.setString(6, user.getUserImg());
			pstmt.setString(7, user.getUserIntro());
			pstmt.setString(8, user.getUserId());
			
			edit = pstmt.executeUpdate() != 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return edit;
	}
	
	// 임시로 마켓 클래스 지정(통합할때 정리 필요)
	public List<Market> getBookmark(String id){
		List<Market> bookmark = new ArrayList<>();
		String SQL = "SELECT * FROM market WHERE mno IN(SELECT mno FROM bookmark WHERE uno = (SELECT uno FROM USER WHERE id = ? )) limit 0, 5";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Market market = new Market();
				market.setMarketNo(rs.getInt("mno"));
				market.setMarketName(rs.getString("mname"));
				market.setMarketType(rs.getString("mtype"));
				market.setMarketAddress(rs.getString("madd"));
				market.setMarketPeriod(rs.getString("period"));
				
				bookmark.add(market);
			}
		} catch (SQLException e) {
			System.out.println("SQL문 에러");
			e.printStackTrace();
		}
		return bookmark;
		
	}
	// 내가 작성한 글 목록을 가져오는 메소드 (Board는 임시로 설정한 model)
	public List<Board> getMyPost(String id){
		List<Board> myPost = new ArrayList<>();
		String SQL = "SELECT * FROM board WHERE uno = (SELECT uno FROM USER WHERE id = ?) order by bdate desc limit 1, 5";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBoardTitle(rs.getString("title"));
				board.setBoardReco(rs.getInt("reco"));
				board.setBoardCheck(rs.getInt("check"));
				board.setBoardTime(rs.getDate("bdate"));
				myPost.add(board);
			}
		} catch (SQLException e) {
			System.out.println("SQL문 에러");
			e.printStackTrace();
		}
		return myPost;
		
	}
	
	public boolean deletBookmark(String id, String mname) {
		boolean delete = false;
		String SQL = "DELETE FROM bookmark WHERE uno = (SELECT uno FROM USER WHERE id = ?) AND mno = (SELECT mno FROM market WHERE mname= ? )";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, mname);
			
			delete = pstmt.executeUpdate() != 0;
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return delete;
	}
}
