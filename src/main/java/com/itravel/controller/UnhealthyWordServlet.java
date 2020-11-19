package com.itravel.controller;

import com.google.gson.Gson;
import com.itravel.dao.PostDao;
import com.itravel.model.Post;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class UnhealthyWordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDao postDao = new PostDao();
//<<<<<<< HEAD
        List<Post> unhealthyPostList = postDao.getUnhealthyPosts();
//=======
//        List<Post> postList = postDao.getAllPosts();
////        postDao.getUnhealthyPosts()
//>>>>>>> 17020a395296189e1fbebd3e771da82f11d23b14

        Map<String, Post> unhealthyPosts = new LinkedHashMap<>();
        for(Post post: unhealthyPostList){
            unhealthyPosts.put(post.getPostId(),post);
        }

        String json = null;
        json = new Gson().toJson(unhealthyPosts);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
