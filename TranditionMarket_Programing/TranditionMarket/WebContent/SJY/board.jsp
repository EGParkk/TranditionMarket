<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<body>
	<jsp:include page="header.jsp" />
	<div class="position-absolute top-50 start-50 translate-middle col-10">
		<%
			String action = request.getParameter("action");
			String uno = request.getParameter("uno");
			String nick = request.getParameter("nick");
			
		if (action.equals("notice")) {
		%>
		<h1 class="mb-5 pb-5">공지사항</h1>
		<%
			} else {
		%>
		<h1 class="mb-5 pb-5">후기게시판</h1>
		<%
			}
		%>
		<table
			id = "table"
			class="table table-bordered table-hover cell-border text-center">
			<thead>
				<tr class="bg-secondary bg-opacity-10">
					<th class="d-none">게시판번호</th>
					<th class="d-none">타입</th>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>추천수</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			
			<tbody>
				<c:forEach var="board" items="${boardlist}">
					<tr data-bno="${board.bno}">		
						<td class="d-none"><c:out value="${board.bno}" />
						<td class="d-none"><c:out value="<%= action %>" />
						<td class="col-sm-1"><c:out value="${board.index}" /></td>
						<td class="col-sm-6"><c:out value="${board.title}" /></td>
						<td class="col-sm-1"><c:out value="${board.writer}" /></td>
						<td class="col-sm-1"><c:out value="${board.reco}" /></td>
						<td class="col-sm-1"><c:out value="${board.check}" /></td>
						<td class="col-sm-2"><c:out value="${board.date}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<% if (uno == null) action = "no"; %>
		<button
			class="position-absolute bottom-0 end-0 mb-5 mt-0 bg-secondary px-3 py-1"
			onclick="location.href='<%=request.getContextPath() %>/Boards?action=write&actiont=<%= action %>&uno=<%=uno%>'">글쓰기</button>
	</div>

<script type="text/javascript">
const rows = document.querySelector('#table tbody');
let data = null;
rows.addEventListener('click', function (e) {
  let table = new DataTable('#table');
  let data = table.row(e.target).data();

 location.href = encodeURI('Boards?bno=' + data[0] + '&actiont=' + data[1] +  '&check=' + data[6] + '&action=view' + '&uno=' + '<%=uno%>' + '&nick=' + '<%=request.getParameter("nick")%>');
});

</script>
<jsp:include page="footer.jsp" />
</body>
</html>
