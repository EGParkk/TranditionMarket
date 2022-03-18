<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container mt-3">
		<%	String action = request.getParameter("action");
			String actiont = request.getParameter("actiont");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
		if (actiont.equals("notice")) {
		%>
		<h1 class="mb-5 pb-5">공지사항/글쓰기</h1>
		<%
			} else {
		%>
		<h1 class="mb-5 pb-5">후기게시판/글쓰기</h1>
		<%
			}
		%>
		<% if (title == null) {
			title = "";
			content = ""; }%>
		
		<div class="card">
			<div class="card-body">
				<form action="<%=request.getContextPath()%>/Boards" method="POST">
					<% if (action.equals("edit")) { %>
					<input type="hidden" name="action" value="cedit" />
					<input type="hidden" name="bno" value="<%= request.getParameter("bno") %>"/>
					<input type="hidden" name="check" value="<%= request.getParameter("check") %>" />
					<input type="hidden" name="uno" value="<%= (String) session.getAttribute("uno") %>" />
					<% } else { %>
					<input type="hidden" name="action" value="save" />
					<input type="hidden" name="uno" value="<%= (String) session.getAttribute("uno") %>" />
					<% } %>
					<input type="hidden" name="actiont" value="<%= actiont %>" />
					<input type="text" class="form-control mb-3" name="title" value="<%= title %>"
						placeholder="제목" maxlength="50" required>
					<textarea type="text" class="form-control mb-3" name="content"
						placeholder="내용" maxlength="2048" style="height: 350px" required><%= content %></textarea>
					<div class="row">
						<input type="submit" value="글쓰기"
							class="btn bg-secondary bg-opacity-10 ml-auto mr-3">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>