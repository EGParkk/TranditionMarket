<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link href="<%=request.getContextPath() %>/PEG/css/bootstrap.min.css" rel="stylesheet" />
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/headers/" />
 <link rel="canonical"
      href="https://getbootstrap.com/docs/5.1/examples/carousel/" />
<title>${param.title }</title>
</head>
<body>
	<header class="p-3 bg-dark text-white">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="PEG/home.jsp" class="nav-link px-2 text-white"><i
							class="bi bi-shop"></i></a></li>
					<li><a href="#" class="nav-link px-2 text-white">공지사항</a></li>
					<li><a href="#" class="nav-link px-2 text-white">후기 게시판</a></li>
				</ul>

				<form action="<%=request.getContextPath() %>/Search"
					method="get" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
					<input type="hidden" name="action" value="search" /> 
					<input type="text" class="form-control form-control-dark"
						placeholder="Search..." name="searchKW" />
				</form>

				<div class="text-end">
					<button type="button" class="btn btn-outline-light me-2">
						Login</button>
				</div>
			</div>
		</div>
	</header>

	<section class="p-3 bg-dark text-white">