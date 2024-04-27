package com.guiProj.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class WebServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forwards request to home.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("web/Home.jsp");
        dispatcher.forward(request, response);
    }
}