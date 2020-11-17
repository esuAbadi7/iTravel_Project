package com.itravel.controller;

import com.google.gson.Gson;
import com.itravel.dao.PostDao;
import com.itravel.dao.TravelerDao;
import com.itravel.model.Location;
import com.itravel.model.Post;
import com.itravel.model.Traveler;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class GetPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Traveler traveler = (Traveler) request.getSession().getAttribute("traveler");

        PostDao postDao = new PostDao();
        List<Post> postList = postDao.getAllPosts();

        Map<String, Post> allPosts = new LinkedHashMap<>();
        for(Post post: postList){
            allPosts.put(post.getPostId(),post);
        }

        String json = null;
        json = new Gson().toJson(allPosts);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }
}
