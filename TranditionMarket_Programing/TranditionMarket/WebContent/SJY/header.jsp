<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="SJY.model.Board"%> 
<%@ page import="SJY.dao.BoardDao"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/jqc-1.12.4/dt-1.11.4/b-2.2.2/sl-1.3.4/datatables.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/market.css" />
<meta charset="UTF-8" />
<title>전,알,사</title>
</head>
<body>
<% String nick = request.getParameter("nick");
	String uno = request.getParameter("uno");
	
	if (nick == null && uno == null) {
		nick = "관리자";
		uno = "1";
	}
%>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
			<div class="container-fluid">
				<i class="bi bi-fan fs-3 me-3"></i>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>">홈</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/Boards?action=notice&uno=<%=uno%>&nick=<%=nick%>">공지사항</a> <%-- 헤더에 uno 랑 nick 변수만 넣어주면 로그인 구별 가능 --%>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/Boards?action=board&uno=<%=uno%>&nick=<%=nick%>">게시판</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>">지역</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>">추천시장</a></li>
					</ul>
					<ul class="navbar-nav ms-auto">
						<%
							
						if (nick == null) {
						%>
						<li class="nav-item"><a class="nav-link" href="">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="">/&nbsp;&nbsp;&nbsp;회원가입</a></li>
						<%
							} else {
						%>
						<li class="nav-item nav-link"><%=nick%>님</li>
						<li class="nav-item"><a class="nav-link" href="">/&nbsp;&nbsp;&nbsp;마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="">/&nbsp;&nbsp;&nbsp;로그아웃</a></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</body>
</html>
