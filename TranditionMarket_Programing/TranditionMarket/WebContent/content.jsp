<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.BoardDao"%>
<%@ page import="model.Boards"%>
<%@ page import="dao.MarketDAO"%>
<%@ page import="model.MarketBean"%>
<%@ page import="model.MarketImgBean"%>
<%@ page import="java.util.Random"%>
<%@ page import="java.lang.Math"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>전알사</title>
</head>
<body>


<% 
	// 랜덤한 시장을 얻기위한 랜덤 숫자 -> getImg에 넣기
	Random random = new Random();
	int num1 = random.nextInt(1000) + 1;
	int num2 = random.nextInt(1000) + 1;
	int num3 = random.nextInt(1000) + 1;

	// 시장 제목 얻기 위한 객체
	MarketDAO marketDao = new MarketDAO(); 
	MarketBean market1 = marketDao.search(1);
	MarketBean market2 = marketDao.search(2);
	MarketBean market3 = marketDao.search(3);
	
	// 시장 이미지 얻기
	MarketImgBean mkImg1 = marketDao.getImg(1); 
	MarketImgBean mkImg2 = marketDao.getImg(2);
	MarketImgBean mkImg3 = marketDao.getImg(3);
	%>
	

<div class="container-fluid border w-75 h-50">
	<div class="row">
		<div class="col-6">
			<h2 class="border-bottom"><a href="#">추천시장</a></h2>
			<!-- 캐러셀 -->
			<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
			
				<!-- 캐러셀 버튼 -->
	  			<div class="carousel-indicators">
			    	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
			  	</div>
			  
				<div class="carousel-inner">
					<!-- 첫번째 시장 -->
					<div class="carousel-item active">
				    	<!-- <img src="https://images.unsplash.com/photo-1569180880150-df4eed93c90b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWFya2V0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60" class="d-block w-100" alt="..."> -->
				    	<img src="<%= mkImg1.getUrl() %>" class="d-block w-100" alt="...">
				    	<div class="carousel-caption d-none d-md-block">
				    	<h5><%= market1.getMname() %></h5>
				    	</div>
				    </div>
				    <!-- 두번째 시장 -->
				    <div class="carousel-item">
				    	<!-- <img src="https://images.unsplash.com/photo-1555876484-a71a693b161b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bWFya2V0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60" class="d-block w-100" alt="..."> -->
				    	<img src="<%= mkImg2.getUrl() %>" class="d-block w-100" alt="...">
				    	<div class="carousel-caption d-none d-md-block">
				    	<h5><%= market2.getMname() %></h5>
				    	</div>
				    </div>
				    <!-- 세번째 시장 -->
				    <div class="carousel-item">
				      	<!-- <img src="https://images.unsplash.com/photo-1535202610320-919f9b13de77?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG1hcmtldHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60" class="d-block w-100" alt="..."> -->
				      	<img src="<%= mkImg3.getUrl() %>" class="d-block w-100" alt="...">
				      	<div class="carousel-caption d-none d-md-block">
				        <h5><%= market3.getMname() %></h5>
				      	</div>
				  	</div>
				</div>
				
			<!-- 캐러셀 좌우버튼 -->
  			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    			<span class="visually-hidden">Previous</span>
  			</button>
  			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    			<span class="carousel-control-next-icon" aria-hidden="true"></span>
    			<span class="visually-hidden">Next</span>
  			</button>
			</div>
		</div>
		
		<!-- 공지사항 -->
		<div class="col-6 border">
			<h2 class="border-bottom"><a href="#">공지사항</a></h2>
		    <ul>
			   	<% BoardDao boardDao = new BoardDao();
			   	
			   	int recentBno1 = boardDao.findRecentBoard().get(0).getBno();
			   	int recentBno2 = boardDao.findRecentBoard().get(1).getBno();
			   	int recentBno3 = boardDao.findRecentBoard().get(2).getBno();  	
			   	%>
		    	<li><a href=""><%= boardDao.find(recentBno1).getTitle() %></a></li>
		    	<li><a href=""><%= boardDao.find(recentBno2).getTitle() %></a></li>
		    	<li><a href=""><%= boardDao.find(recentBno3).getTitle() %></a></li>
    		</ul>
		</div>	
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>