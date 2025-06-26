package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

/**
 * Servlet implementation class staffCountServlet
 */
@WebServlet("/staffCountServlet")

public class staffCountServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	UserDAO userDao = new UserDAO();
        int staffCount = userDao.getStaffCount();
        
        

        request.setAttribute("staffCount", staffCount);
        request.getRequestDispatcher("user-list.jsp").forward(request, response);
    }
}
