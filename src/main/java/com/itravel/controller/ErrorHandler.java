package com.itravel.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ErrorHandler extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
//        String servletName = (String) request.getAttribute("javax.servlet.error.servlet_name");
        Integer statusCode = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
        String requestUri = (String) request.getAttribute("jakarta.servlet.error.request_uri");

        if (requestUri == null) {
            RequestDispatcher rd = request.getRequestDispatcher("404.jsp");
            rd.forward(request,response);
        }

        if (statusCode == 500) {
            RequestDispatcher rd = request.getRequestDispatcher("500.jsp");
            rd.forward(request,response);
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}

