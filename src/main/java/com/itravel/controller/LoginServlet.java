package com.itravel.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.itravel.dao.TravelerDao;
import com.itravel.dao.UserDao;
import com.itravel.model.Role;
import com.itravel.model.Traveler;
import com.itravel.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
//            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//            rd.forward(request,response);

            response.sendRedirect("index.jsp");
            //Return Error Mesa
        }else{
            if(user.isActive()){

                if(Role.USER == user.getRole() ){

                    HttpSession session = request.getSession();
                    TravelerDao travelerDao = new TravelerDao();
                    Traveler traveler = travelerDao.getTravelerUsingEmail(email);
                    session.setAttribute("traveler", traveler);
//                    RequestDispatcher rd = request.getRequestDispatcher("travelerHomePage.jsp");
//                    rd.forward(request,response);

                    response.sendRedirect("travelerHomePage.jsp");

                }else if(Role.ADMIN == user.getRole()){
                    HttpSession session = request.getSession();
                    session.setAttribute("admin",user);
//                    RequestDispatcher rd = request.getRequestDispatcher("adminHome.jsp");
//                    rd.forward(request,response);
                    response.sendRedirect("adminHome.jsp");
                }

            }else{
                String errMsg = "Account is not Active!";
                request.setAttribute("errMsg",errMsg);
//                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//                rd.forward(request,response);
                response.sendRedirect("index.jsp");
            }


        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
