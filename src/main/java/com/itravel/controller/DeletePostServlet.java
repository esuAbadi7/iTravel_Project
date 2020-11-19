package com.itravel.controller;

import com.google.gson.Gson;
import com.itravel.dao.PostDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DeletePostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String postId = request.getParameter("postId");

        System.out.println(postId);
        PostDao postDao = new PostDao();
        boolean result = postDao.deletePost(postId);

        String json = null;
        final String RESULT_SUCCESSFUL = "successful";
        final String RESULT_FAIL = "failed";

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
