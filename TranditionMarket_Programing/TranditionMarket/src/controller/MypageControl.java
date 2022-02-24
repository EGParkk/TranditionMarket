package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MypageDAO;
import model.User;

@WebServlet("/Mypage")
public class MypageControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MypageDAO mypageDAO;

	public void init(ServletConfig config) throws ServletException {
		mypageDAO = new MypageDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF8");
		String action = request.getParameter("cmd") != null ? request.getParameter("cmd") : "show";
		try {
			switch (action) {
			case "edit":
				editMydata(request, response);
				break;
			case "delete":
				deleteMydata(request, response);
				break;
			case "deleteBm":
				deleteBookmark(request, response);
				break;
			default:
				show(request, response);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void deleteBookmark(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("userId");
		String mname = request.getParameter("mname");
		boolean delete = mypageDAO.deletBookmark(id, mname);
		if(delete) {
			System.out.println("즐겨찾기 삭제 완료");
			response.sendRedirect("Mypage");
		}
	}

	private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("myPage.jsp");
		rd.forward(request, response);
	}

	private void deleteMydata(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("userId");

		boolean delete = mypageDAO.deleteUser(id);
		if (delete) {
			System.out.println("탈퇴완료");
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("Mypage");
		}
	}

	private void editMydata(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		
		user.setUserId(request.getParameter("userId"));
		user.setUserName(request.getParameter("userName"));
		user.setUserNick(request.getParameter("userNick"));
		user.setUserEmail(request.getParameter("userEmail"));
		user.setUserAddress(request.getParameter("userAddress"));
		user.setUserPassword(request.getParameter("userPw"));
		user.setUserIntro(request.getParameter("userIntro"));
		
		boolean edited = mypageDAO.editMyData(user);
		if(edited) {
			System.out.println("수정완료");
			response.sendRedirect("Mypage");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
