package controller;

import model.User;
import dao.UserDAO;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/edit")
public class EditServlet extends HttpServlet {
    private UserDAO userDao;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	final Logger logger = Logger.getLogger(AddUserServlet.class.getName());

    	logger.info("Received request to edit details");

        String idParam = request.getParameter("id");

     

        try {
            int id = Integer.parseInt(idParam); // parse safely
            User user = UserDAO.getUserById(id);

            if (user != null) {
                request.setAttribute("user", user);
                request.getRequestDispatcher("edit.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "User not found");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid ID format");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
