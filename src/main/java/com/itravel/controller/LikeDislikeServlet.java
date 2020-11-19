package com.itravel.controller;

import com.google.gson.Gson;
import com.itravel.dao.PostDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

//@javax.servlet.annotation.WebServlet(name = "LikeDislikeServlet")
public class LikeDislikeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        type checks whether it is like or dislike
        String type = request.getParameter("type");
        String postId = request.getParameter("postId");
        int changeValue = Integer.parseInt(request.getParameter("changeValue"));

        System.out.println(" Type: "+  type);
        System.out.println(" Type: "+  type);
        System.out.println(" Type: "+  type);

        PostDao postDao =  new PostDao();
        boolean result = false;
        if(type.equals("like")){
            result = postDao.updatePostLikes(postId,changeValue);
        }else if(type.equals("dislike")){
            result = postDao.updatePostDislikes(postId,changeValue);
        }

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
