package controller;

import dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
      
        UserDAO userDAO = new UserDAO();

        boolean success = userDAO.deleteUserById(id);
        if (success) {
            System.out.println("User deleted successfully.");
        } else {
            System.out.println("Failed to delete user.");
        }

        if (success) {
            // “/your‑app/users” will hit UserListServlet and reload the fresh list
            response.sendRedirect(request.getContextPath() + "/UserListServelet");
        } else {
            response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
        }
    }
}
