<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" crossorigin>
<link rel="stylesheet" href="https://cdn.datatables.net/v/bs4/dt-1.10.24/datatables.min.css" crossorigin>
<title>Insert title here</title>
</head>
<body>
	<%
		String mainId="";
		String login = "로그인";
		String hideJoin = "";
		String hideMypage = "d-none";		
		
		boolean now = false;	// 테스트용 boolean값 true로 바꾸면 로그인 된 상태로 볼수있음
		if(now){ // session.getAttribute("userId")!=null 로 로그인 상태 체크
			session.setAttribute("userId","abc");
			mainId = session.getAttribute("userId")+"님 환영합니다.";
			login = "로그아웃";
			hideJoin ="d-none";
			hideMypage = "";
		}
	%>
	<header class="p-3 bg-dark text-white">
		<div class="container">
			<div class="d-flex flex-wrap justify-content-between">

				<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="#" class="nav-link px-2 text-white"><svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-shop" viewBox="0 0 16 16">
  <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z" />
</svg></a></li>
					<li><a href="#" class="nav-link px-2 mt-3 text-white">공지사항</a></li>
					<li><a href="#" class="nav-link px-2 mt-3 text-white">게시판</a></li>
				</ul>
				<div class="text-end flex-row-reverse mt-2">
					<span class="mr-2"><%=mainId%></span>
					<button type="button" class="btn btn-warning <%=hideMypage%>">마이페이지</button>
					<button type="button" class="btn btn-outline-light me-2"><%=login%></button>
					<button type="button" class="btn btn-warning <%=hideJoin%>">회원가입</button>
				</div>
			</div>
		</div>
	</header>