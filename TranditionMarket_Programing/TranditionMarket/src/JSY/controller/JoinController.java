package JSY.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import JSY.model.User;
import JSY.model.UserDAO;

@WebServlet("/JSY/Join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserDAO userDAO;
	
	public void init(ServletConfig config) throws ServletException {
		userDAO = new UserDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		User user = new User();
		user.setUserID(request.getParameter("userID"));
		user.setUserPassword(request.getParameter("userPassword"));
		user.setUserName(request.getParameter("userName"));
		user.setUserNick(request.getParameter("userNick"));
		user.setUserAddress(request.getParameter("userAddress"));
		user.setUserEmail(request.getParameter("userEmail"));
		user.setUserIntro(request.getParameter("userIntro"));
		user.setUserImg(request.getParameter("userImg"));
		
		int joinResult = userDAO.join(user);
		
		if(joinResult == 1) {
			response.sendRedirect("login.jsp");
		} else {
			response.sendRedirect("join.jsp");
		}
	}
	

}
