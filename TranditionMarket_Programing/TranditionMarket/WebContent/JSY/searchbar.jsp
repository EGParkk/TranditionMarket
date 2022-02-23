<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link href="searchbar.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
<div class="container p-5">
     <div class="d-flex justify-content-center">
         <div class="search border"> 
         <form action="<%=request.getContextPath() %>/Search" method="get">
         	<input type="hidden" name="action" value="search" /> 
         	<input class="search_input" type="text" name="searchKW" placeholder="Search">
         	<button type="submit" class="search_icon"><i class="fa fa-search"></i></button> 
         </form>
         </div>
     </div>
</div>


</body>
</html>