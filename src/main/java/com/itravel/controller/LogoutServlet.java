package com.itravel.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("traveler");
        request.getSession().removeAttribute("admin");
        request.getSession().invalidate();

        response.sendRedirect("index.jsp");

//        RequestDispatcher rd = request.getRequestDispatcher("http://localhost:8080/iTravel_Project_war_exploded/");
//        rd.forward(request,response);
    }
}
