<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" crossorigin>
<link rel="stylesheet" href="https://cdn.datatables.net/v/bs4/dt-1.10.24/datatables.min.css" crossorigin>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/market.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css" />
<meta charset="UTF-8" />
<title>전,알,사</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
			<div class="container-fluid">
				<i class="bi bi-fan fs-3 me-3"></i>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>">홈</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/Boards?action=notice">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/Boards?action=board">게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>">지역</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>">추천시장</a></li>
					</ul>
					<ul class="navbar-nav ms-auto">
						<%
						String nick = request.getParameter("nick");
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
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" crossorigin></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" crossorigin></script>
</body>
</html>