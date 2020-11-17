package com.itravel.controller;

import com.google.gson.Gson;
import com.itravel.dao.TravelerDao;
import com.itravel.model.Traveler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

//@WebServlet(name = "GetTravelerServlet")
public class GetTravelerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TravelerDao travelerDao = new TravelerDao();
        Map<String, List<String> > activeTravelers = new LinkedHashMap<>();
        List<String> suggestedWord = new ArrayList<>();
        for(Traveler traveler: travelerDao.getActiveTravelers()){
            suggestedWord.add(traveler.getFirstName());
            suggestedWord.add(traveler.getLastName());
        }
        activeTravelers.put("suggestedKeywords",suggestedWord);

        String json = null;
        json = new Gson().toJson(activeTravelers);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int status = Integer.parseInt(request.getParameter("status"));
        TravelerDao travelerDao = new TravelerDao();



        String json = null;
        switch (status){
            case 0:
                Map<String, Traveler> inactiveTravelers = new LinkedHashMap<>();
                for(Traveler traveler: travelerDao.getInactiveTravelers()){
                    inactiveTravelers.put(traveler.getTravelerId(),traveler);
                }
                json = new Gson().toJson(inactiveTravelers);
                break;
            case 1:
                Map<String, Traveler> activeTravelers = new LinkedHashMap<>();
                for(Traveler traveler: travelerDao.getActiveTravelers()){
                    activeTravelers.put(traveler.getTravelerId(),traveler);
                }
                json = new Gson().toJson(activeTravelers);
                break;
            case 2:
                Map<String, Traveler> allTravelers = new LinkedHashMap<>();
                for(Traveler traveler: travelerDao.getAllTraveler()){
                    allTravelers.put(traveler.getTravelerId(),traveler);
                }
                json = new Gson().toJson(allTravelers);
                break;

        }

//        Map<String, String> ind = new LinkedHashMap<String, String>();
//        ind.put("1", "New delhi");
//        ind.put("2", "Tamil Nadu");
//        ind.put("3", "Kerala");
//        ind.put("4", "Andhra Pradesh");
//
//        Map<String, String> us = new LinkedHashMap<String, String>();
//        us.put("1", "Washington");
//        us.put("2", "California");
//        us.put("3", "Florida");
//        us.put("4", "New York");
//        String json = null;
//        if (country.equals("India")) {
//            json = new Gson().toJson(ind);
//        } else if (country.equals("US")) {
//            json = new Gson().toJson(us);
//        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
