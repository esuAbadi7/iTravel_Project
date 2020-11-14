package com.itravel.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.itravel.dao.UserDao;
import com.itravel.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email= request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("Email"+email);
        System.out.println("Password"+password);
        UserDao userDao= new UserDao();
        User user = userDao.login(email,password);

        if(user == null){
            String errMsg = "Username or Password is incorrect!";
            request.setAttribute("errMsg",errMsg);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request,response);
            //Return Error Mesa
        }else{
            if(user.isActive()){
                request.setAttribute("traveler",user);
                RequestDispatcher rd = request.getRequestDispatcher("travelerHome.jsp");
                rd.forward(request,response);
            }else{
                String errMsg = "Account is not Active!";
                request.setAttribute("errMsg",errMsg);
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request,response);
            }


        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
