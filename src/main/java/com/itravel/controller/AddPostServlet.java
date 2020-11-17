package com.itravel.controller;

import com.google.gson.Gson;
import com.itravel.dao.PostDao;
import com.itravel.model.Location;
import com.itravel.model.Post;
import com.itravel.model.Traveler;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;

public class AddPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        final String RESULT_SUCCESSFUL = "successful";
        final String RESULT_FAIL = "failed";
        Traveler traveler = (Traveler) request.getSession().getAttribute("traveler");
//        String travelerId = (String) request.getAttribute("travelerId") ;
//        travelerId
        String postText = (String) request.getParameter("postText");
        double latitude;
        double longitude;
        try{
            latitude = Double.parseDouble(request.getParameter("latitude"));
        }catch (Exception e){
            latitude  = 41.00863 ;
            System.out.println(e);
        }
        try{
            longitude = Double.parseDouble(request.getParameter("longitude"));
        }catch (Exception e){
            longitude = -91.96267;
            System.out.println(e);
        }

        PostDao postDao =  new PostDao();
//        TravelerDao travelerDao = new TravelerDao();
//        Traveler traveler = travelerDao.getTraveler(travelerId);
        System.out.println("Latitude: "+latitude+"  Longitude: "+ longitude);
        System.out.println("My Traveler ::"+ traveler);
        Location location ;
//                = new Location(-91.96267,41.00863);

            location = new Location(longitude,latitude);

//        String postText, LocalDateTime date, String postImage, boolean healthyType, Traveler traveler, Location location
//      TODO  For the time being lets assume it is Healthy, it should check whether it is healthy or unhealthy
        Post post = new Post(postText, LocalDateTime.now(), "", true, traveler, location);
//        Post post = new Post("Post Test", LocalDateTime.now(), "", true, traveler, location);

        boolean result = postDao.addPost(post);

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
