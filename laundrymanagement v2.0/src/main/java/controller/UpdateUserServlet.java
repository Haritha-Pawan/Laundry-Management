package controller;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	final Logger logger = Logger.getLogger(AddUserServlet.class.getName());
    	
    	
    	
   	 
    	
       
        String id = request.getParameter("id");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String nic = request.getParameter("nic");
        String address = request.getParameter("address");
        String role = request.getParameter("role");
        
        
        User updatedUser = new User();
        updatedUser.setId(Integer.parseInt(id));
        updatedUser.setFirstName(firstName);
        updatedUser.setLastName(lastName);
        updatedUser.setEmail(email);
        updatedUser.setPhone(phone);
        updatedUser.setNic(nic);
        updatedUser.setAddress(address);
        updatedUser.setRole(role);
      
        

        
        UserDAO userDao = new UserDAO();
        boolean isUpdated = userDao.updateUser(updatedUser);

      
        if (isUpdated) {
        	 logger.info("Updted user Information correctly");
            request.getRequestDispatcher("update-success.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Failed to update user details");
            request.getRequestDispatcher("edit.jsp").forward(request, response);
        }
    }
}
