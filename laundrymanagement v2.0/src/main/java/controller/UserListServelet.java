package controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

/**
 * Servlet implementation class UserListServelet
 */
@WebServlet("/UserListServelet")
public class UserListServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<User> users = UserDAO.getAllUsers();
		  int userCount = UserDAO.getStaffCount(); 
		
		
		System.out.println("Fetched user count: " + users.size());
		
		
		
		request.setAttribute("users", users);
		 request.setAttribute("userCount", userCount);
		
		 
		 RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
	        dispatcher.forward(request, response);

		
	}



}
