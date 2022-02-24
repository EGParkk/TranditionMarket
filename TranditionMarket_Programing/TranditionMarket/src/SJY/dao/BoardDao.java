package SJY.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import SJY.model.Board;

public class BoardDao {

	private DataSource dataSource;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public BoardDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public BoardDao() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/traditionmarket?useSSL=false";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}

	public List<Board> findAll(String action) {
		List<Board> list = new ArrayList<Board>();
		String type = "";
		int index = 0;

		if (action.equals("notice")) {
			type = "where btype = '공지'";
		} else {
			type = "where btype = '후기'";
		}
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("select * from board b join user u on b.uno = u.uno " + type);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Board board = new Board();
				index++;
				board.setBno(rs.getInt("bno"));
				board.setIndex(index);
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("nick"));
				board.setReco(Integer.parseInt(rs.getString("reco")));
				board.setCheck(Integer.parseInt(rs.getString("check")));
				board.setDate(rs.getString("date").substring(0, 10));
				board.setUno(rs.getInt("uno"));

				list.add(board);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 에러");
		} finally {
			closeAll();
		}
		return list;
	}

	public String getDate() {
		String SQL = "select now()";
		try {
			Connection conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getString("now()");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}

	public boolean save(int uno, String title, String content, String actiont) {
		boolean rowAffected = false;
		String type = "";
		int zero = 0;
		int mno = 1;
		String now = getDate();

		if (actiont.equals("notice")) {
			type = "공지";
		} else {
			type = "후기";
		}
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(
					"insert into board (`title`, `reco`, `check`, `content`, `date`, `btype`, `uno`, `mno`) VALUES(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, title);
			pstmt.setInt(2, zero);
			pstmt.setInt(3, zero);
			pstmt.setString(4, content);
			pstmt.setString(5, now);
			pstmt.setString(6, type);
			pstmt.setInt(7, uno);
			pstmt.setInt(8, mno); // mno 있어야 하는건가???

			rowAffected = pstmt.executeUpdate() > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 에러");
		} finally {
			closeAll();
		}
		return rowAffected;
	}

	public Board find(int bno) {
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("select * from board b join user u on b.uno = u.uno where b.bno = ?");
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Board board = new Board();
				board.setBno(rs.getInt("bno"));
				board.setTitle(rs.getString("title"));
				board.setDate(rs.getString("date").substring(0, 10));
				board.setContent(rs.getString("content"));
				board.setCheck(rs.getInt("check"));
				board.setReco(rs.getInt("reco"));
				board.setUno(rs.getInt("uno"));
				board.setWriter(rs.getString("nick"));

				return board;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("sql find ERROR!");
		} finally {
			closeAll();
		}

		return null;
	}

	private void closeAll() {

		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();

		} catch (Exception e) {
			System.out.println("DB연결 닫을때 에러발생");
		}

	}

	public void reco(int reco, int bno) {
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(" UPDATE board SET reco = ? WHERE bno = ? ");
			pstmt.setInt(1, reco);
			pstmt.setInt(2, bno);
			
			pstmt.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("sql find ERROR!");
		} finally {
			closeAll();
		}

	}

	public void check(int check, int bno) {
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("UPDATE board SET `check` = ? WHERE bno = ?;");
			pstmt.setInt(1, check);
			pstmt.setInt(2, bno);
			
			pstmt.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("sql check ERROR!");
		} finally {
			closeAll();
		}
		

	}

	public boolean updatecomment(Board board) {
		boolean rowAffected = false;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("UPDATE comment SET ccontent = ? WHERE cno = ?;");
			pstmt.setString(1, board.getCcontent());
			pstmt.setInt(2, board.getCno());
			
			rowAffected = pstmt.executeUpdate() > 0;
			

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("댓글 수정 완료");
		} finally {
			closeAll();
		}

		return rowAffected;
	}

	public Board findcomment(int cno) {
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("SELECT * from comment join user on comment.uno = user.uno join board on board.bno = comment.bno where comment.cno = ?");
			pstmt.setInt(1, cno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Board board = new Board();
				board.setCno(rs.getInt("cno"));
				board.setCcontent(rs.getString("ccontent"));
				board.setBno(rs.getInt("bno"));
				board.setUno(rs.getInt("uno"));
				board.setDate(rs.getString("date"));
				return board;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("sql findcomment ERROR!");
		} finally {
			closeAll();
		}

		return null;
	}

	public void cdelete(int bno) {
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(" DELETE FROM board WHERE bno = ? ");
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("게시판 글 삭제 실패");
		} finally {
			closeAll();
		}
	}

	public void cupdate(int bno, String title, String content) {
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(" UPDATE board SET `title` = ?, `content` = ? WHERE (`bno` = ?);");
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, bno);
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("게시판 글 수정 실패");
		} finally {
			closeAll();
		}

		
	}

	public void delete(int cno) {
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(" DELETE FROM comment WHERE cno = ? ");
			pstmt.setInt(1, cno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("댓글 삭제 실패");
		} finally {
			closeAll();
		}
		
	}

	public void csave(int uno, int bno, String comment) {
		String Date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

			try{
				conn = dataSource.getConnection();	
				
				pstmt = conn.prepareStatement("INSERT INTO comment (`ccontent`, `uno`, `bno`, `date`) VALUES (?,?,?,?) ");
				pstmt.setString(1, comment);
				pstmt.setInt(2, uno);
				pstmt.setInt(3, bno);
				pstmt.setString(4, Date);
				
				pstmt.executeUpdate();

				conn.close();
				
			} catch (Exception e){
				e.printStackTrace();
				System.out.println("댓글 저장 완료");
			}
		}
	
}
