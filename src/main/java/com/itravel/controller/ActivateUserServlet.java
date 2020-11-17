package com.itravel.controller;

import com.google.gson.Gson;
import com.itravel.dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ActivateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final String RESULT_SUCCESSFUL = "successful";
        final String RESULT_FAIL = "failed";
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        String travelerEmail = request.getParameter("travelerEmail") ;
        UserDao userDao = new UserDao();

        boolean result = userDao.setActivation(travelerEmail,status);

        String json = null;
        if(result){
            json =  new Gson().toJson(RESULT_SUCCESSFUL);
        } else{
            json = new Gson().toJson(RESULT_FAIL);
        }


        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
