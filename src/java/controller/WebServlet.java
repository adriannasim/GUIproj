package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.ServletException;

public class WebServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forwards request to index.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}