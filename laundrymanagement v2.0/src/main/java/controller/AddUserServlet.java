package controller;

import dao.UserDAO;
import model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    	final Logger logger = Logger.getLogger(AddUserServlet.class.getName());
    	
    	 logger.info("Received request to add a new user");
    	
        // Get form parameters
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        
       
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setAddress(address);
        user.setNic(nic);
        user.setRole(role);
        user.setEmail(email);
        user.setPhone(phone);
        
        // Insert user
        UserDAO userDAO = new UserDAO();
        boolean isSuccess = userDAO.insertUser(user);
        
        // Redirect based on result
        if (isSuccess) {
            // pass user to JSP
            request.getRequestDispatcher("add-user-success.jsp").forward(request, response);
      
            logger.info("Succesfully added new user");
            
        } else {
            response.sendRedirect("add-user-error.jsp");
        }

    }
}