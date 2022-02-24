<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.MypageDAO"%>
<%@ page import="model.User"%>
<%@ page import="model.MarketBean"%>
<jsp:include page="header.jsp" />
<%
/* 마이페이지 접속시 세션의 아이디를 조회하여 비 로그인 상태일때 login.jsp 페이지로 돌려보냄 */
String id = (String) session.getAttribute("userId");
if (id == null) {
	response.sendRedirect("login.jsp");
}
MypageDAO mdao = new MypageDAO();
List<MarketBean> bookmark = mdao.getBookmark(id);
%>

<h2>즐겨찾기</h2>
<div class="bmContainer">
	<table class="bmTable">
		<tr class="bmTr">
			<td>
				<div class="bmContent">
					<h3>시장 이름</h3>
					<hr>
					<div class="imgBox">
						<img class="bmImg" src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202102/07/3b0f57ed-7530-4899-8f26-4d14f9e25a4f.jpg">
					</div>
					<hr>
					<p class="bmAd">시장 주소</p>
					<button type="button" class="btn btn-primary btn-sm">삭제</button>
				</div>
			</td>
		</tr>
		<tr class="bmTr">
			<td>
				<div class="bmContent">
					<h3>시장 이름</h3>
					<hr>
					<div class="imgBox">
						<img class="bmImg" src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202102/07/3b0f57ed-7530-4899-8f26-4d14f9e25a4f.jpg">
					</div>
					<hr>
					<p class="bmAd">시장 주소</p>
					<button type="button" class="btn btn-primary btn-sm">삭제</button>
				</div>
			</td>
		</tr>
	</table>
</div>

<jsp:include page="footer.jsp" />