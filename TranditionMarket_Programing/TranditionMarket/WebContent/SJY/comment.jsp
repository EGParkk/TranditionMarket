<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String comment = request.getParameter("comment");
	int uno = Integer.parseInt(request.getParameter("uno"));
	int bno = Integer.parseInt(request.getParameter("bno"));
    
	if(comment.trim().equals("")){
		
		out.print("<p>댓글 내용을 적어주세요</p>");
	
	} else {
		
		try{
			String url = "jdbc:mysql://localhost:3306/traditionmarket?useSSL=false";
			Connection conn = DriverManager.getConnection(url,"root","1234");
			
			PreparedStatement pstmt = 
					conn.prepareStatement("INSERT INTO comment (`ccontent`, `uno`, `bno`) VALUES (?,?,?) ");
			pstmt.setString(1, comment);
			pstmt.setInt(2, uno);
			pstmt.setInt(3, bno);
	
			pstmt.executeUpdate(); //결과는 숫자로 1일때 정상
			
			pstmt = conn.prepareStatement("SELECT * from comment join user on comment.uno = user.uno join board on board.bno = comment.bno where comment.bno = ?");			
			pstmt.setInt(1, bno);
			ResultSet rs = pstmt.executeQuery();
			
	
			while(rs.next()){
				out.print("<div class='box border border-secondary'>");  
				out.print("<div class='bg-secondary bg-opacity-10'><strong>작성자</strong> "+rs.getString("nick")+" <strong>작성일</strong> " + rs.getString("date").substring(0,10)+ " </div>");  
				out.print("<p>"+rs.getString("ccontent")+"</p>");  
				out.print("</div>"); 
			}  
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}
				
	} 
%>