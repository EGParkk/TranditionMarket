<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="JYG.dao.MypageDAO"%>
<%@ page import="JYG.model.User"%>
<%@ page import="JYG.model.Market"%>
<%@ page import="JYG.model.Board"%>
<jsp:include page="/JYG/includes/header.jsp" />
<%
/* 마이페이지 접속시 세션의 아이디를 조회하여 비 로그인 상태일때 login.jsp 페이지로 돌려보냄 */
String id = (String) session.getAttribute("userId");
if (id == null) {
	response.sendRedirect("login.jsp");
}
MypageDAO mdao = new MypageDAO();
User user = mdao.showData(id);
List<Market> bookmark = mdao.getBookmark(id);
List<Board> myPost = mdao.getMyPost(id);
%>

<div id="myData" class="container" style="display: flex; justify-content: space-evenly;">
	<div style="border: 1px black solid; width: 25em; padding: 20px; margin-top: 30px; height: 500px;">
		<h2 style="display: inline">회원정보</h2>
		<%
		if (user.getAdmin() == 1) {
		%>
		<span class="badge bg-success">관리자</span>
		<%
		}
		%>
		<!-- 관리자 계정 로그인시 관리자 배지 표시 -->
		<table style="width: 100%;">
			<tr>
				<td>
					<img class="profileImg" src="<%=user.getUserImg()%>" width="50px" height="50px">
				</td>
				<td>
					아이디 :
					<%=user.getUserId()%>
				</td>
			</tr>
			<tr>
				<td>프로필사진</td>
				<td>
					이름&nbsp;&nbsp;&nbsp;&nbsp;:
					<%=user.getUserName()%></td>
			</tr>
			<tr>
				<td>
					닉네임 :
					<%=user.getUserNick()%></td>
			</tr>
			<tr>
				<td colspan="2">
					이메일 :
					<%=user.getUserEmail()%></td>
			</tr>
			<tr>
				<td colspan="2">
					주소&nbsp;&nbsp;&nbsp;&nbsp;:
					<%=user.getUserAddress()%></td>
			</tr>
			<tr>
				<td>자기소개</td>
			</tr>
			<tr>
				<td colspan="2" width="50px" style="word-break: break-all; border: 1px soilid black;"><%=user.getUserIntro()%></td>
			</tr>
		</table>
		<div style="display: flex; justify-content: flex-end;">
			<%
			if (user.getAdmin() == 0) { /* 일반회원 수정/탈퇴 버튼 */
			%>
			<!-- 회원정보 수정 모달창 팝업 -->
			<button type="button" class="btn btn-primary" id="openEditModal">수정</button>
			<!-- 회원탈퇴 모달 팝업 -->
			<button type="button" class="btn btn-warning" id="openExitModal">탈퇴</button>
			<%
			} else { /* 관리자 로그인시 회원관리 버튼 */
			%>
			<button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/admin'">회원관리</button>
			<%
			}
			%>
		</div>
	</div>
	<div style="display: flex-row; margin-top: 30px; margin-left: 30px">
		<h2>즐겨찾기</h2>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">시장 이름</th>
					<th scope="col">주소</th>
					<th scope="col">구분</th>
					<th scope="col">개설주기</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Market m : bookmark) {
				%>
				<tr>
					<td>
						<%=m.getMarketName()%>
					</td>
					<td>
						<%=m.getMarketAddress()%>
					</td>
					<td>
						<%=m.getMarketType()%>
					</td>
					<td>
						<%=m.getMarketPeriod()%>
					</td>
					<td>
						<button type="button" class="btn btn-warning btn-deleteBm" data-mname="<%=m.getMarketName()%>">삭제</button>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<h2>최근 작성한 글</h2>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">제목</th>
					<th scope="col">작성 시간</th>
					<th scope="col">추천</th>
					<th scope="col">조회</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Board b : myPost) {
				%>
				<tr>
					<td><%=b.getBoardTitle()%></td>
					<td><%=b.getBoardTime()%></td>
					<td><%=b.getBoardReco()%></td>
					<td><%=b.getBoardCheck()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

</div>

<!-- 회원수정 모달 -->
<div class="modal fade" id="editBox" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">회원 정보 수정</h5>
			</div>
			<form action="<%=request.getContextPath()%>/Mypage?cmd=edit" method="post" autocomplete="off">
				<div class="modal-body">
					<label for="userId">아이디</label> <input type="text" id="userId" readonly class="form-control" name="userId" value="<%=user.getUserId()%>"> <label for="userPw">비밀번호</label> <input type="password" id="userPw" class="form-control" name="userPw" value="<%=user.getUserPassword()%>"> <label for="userName">이름</label> <input type="text" id="userName" class="form-control" name="userName" value="<%=user.getUserName()%>"> <label for="userId">닉네임</label> <input type="text" id="userNick" class="form-control" name="userNick" value="<%=user.getUserNick()%>"> <label for="userId">이메일</label> <input type="text" id="userEmail" class="form-control" name="userEmail" value="<%=user.getUserEmail()%>"> <label for="userImg">프로필사진</label> <input type="text" id="userImg" class="form-control" name="userImg" value="<%=user.getUserImg()%>"> <label for="userId">주소</label> <input type="text" id="userAddress" class="form-control" name="userAddress"
						value="<%=user.getUserAddress()%>"
					>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">자기소개</label>
						<textarea class="form-control" id="exampleFormControlTextarea1" name="userIntro" rows="3"><%=user.getUserIntro()%></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button id="btn-edit" type="submit" class="btn btn-primary">수정하기</button>
					<button id="closeModalBtn" type="button" class="btn btn-secondary">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 회원탈퇴 모달 -->
<div class="modal fade" id="exitBox" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
			</div>
			<form id="exitForm" action="<%=request.getContextPath()%>/Mypage?cmd=delete" method="post">
				<div class="modal-body">
					<input type="hidden" name="cmd" value="delete"> <input id="exitId" name="userId" type="hidden" value="<%=session.getAttribute("userId")%>">
				</div>
				<div class="alert alert-danger d-flex align-items-center" role="alert">
					<use xlink:href="#exclamation-triangle-fill" />
					</svg>
					<div>모든 회원 정보가 삭제됩니다!</div>
				</div>
				<div class="modal-footer">
					<button id="exitBtn" type="submit" class="btn btn-primary">탈퇴</button>
					<button id="closeModalBtn2" type="button" class="btn btn-secondary">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 북마크 삭제 모달 -->
<div class="modal fade" id="deleteBm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">즐겨찾기 삭제</h5>
			</div>
			<form id="fm-delete-bm">
				<div class="modal-body">
					<input type="hidden" name="cmd" value="deleteBm"> <input name="userId" type="hidden" value="<%=session.getAttribute("userId")%>"> <input type="hidden" name="mname" value="">
				</div>
				<div class="alert alert-danger d-flex align-items-center" role="alert">
					<use xlink:href="#exclamation-triangle-fill" />
					</svg>
					<div>즐겨찾기를 삭제됩니다</div>
				</div>
				<div class="modal-footer">
					<button id="delete-bm-btn" type="submit" class="btn btn-primary">탈퇴</button>
					<button id="closeModalBtn3" type="button" class="btn btn-secondary">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/JYG/includes/footer.jsp" />