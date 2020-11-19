package com.itravel.controller;

import com.google.gson.Gson;
import com.itravel.dao.CommentDao;
import com.itravel.model.Comment;
import com.itravel.model.Traveler;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class CommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        Traveler traveler = (Traveler) request.getSession().getAttribute("traveler");
//        Traveler traveler = (Traveler) request.getSession().getAttribute("traveler");
        String commentText = request.getParameter("commentText");
        String post_id = request.getParameter("postId");
        CommentDao commentDao = new CommentDao();
        Comment comment = new Comment(commentText,traveler,post_id);

        System.out.println("Post Id"+ post_id);
        System.out.println("Comment Text"+ commentText);
        System.out.println("Traveler"+ traveler);

        boolean result = commentDao.addComment(comment);
        final String RESULT_SUCCESSFUL = "successful";
        final String RESULT_FAIL = "failed";


        String json = null;

        if(result ){
            json =  new Gson().toJson(RESULT_SUCCESSFUL);
        } else{
            json = new Gson().toJson(RESULT_FAIL);
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String postId = request.getParameter("postId");
        CommentDao commentDao = new CommentDao();
        List<Comment> postCommentsList = commentDao.getPostComments(postId);
        Map<String,Comment> postComments = new LinkedHashMap<>();
        for(Comment comment: postCommentsList){
            postComments.put(comment.getCommentId(), comment);
        }

        String json= null;
        json = new Gson().toJson(postComments);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

    }
}
