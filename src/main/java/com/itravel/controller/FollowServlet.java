package com.itravel.controller;

import com.google.gson.Gson;
import com.itravel.dao.FollowDao;
import com.itravel.dao.TravelerDao;
import com.itravel.model.Follow;
import com.itravel.model.Traveler;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class FollowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // do follow someone
        //Get current traveller from session
        Traveler traveler = (Traveler) request.getSession().getAttribute("traveler");
        String travlerId = traveler.getTravelerId();
        //Get follwee id(or person he wants to follow)
        String followee_id = request.getParameter("followeeId");

        Follow follow = new Follow(travlerId,followee_id);
        FollowDao followDao = new FollowDao();
        boolean result = followDao.addFollow(follow);

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
        // get Lists of Travelers that are not followed by him
        //Get current traveller from session
        Traveler currentTraveler = (Traveler) request.getSession().getAttribute("traveler");
        String travlerId = currentTraveler.getTravelerId();

        TravelerDao travelerDao = new TravelerDao();

        List<Traveler> notFollowedTravelersList = travelerDao.getTravelersNotFollowedBy(travlerId);

        Map<String, Traveler> notFollowedTravelers = new LinkedHashMap<>();
        for(Traveler traveler : notFollowedTravelersList){
            notFollowedTravelers.put(traveler.getTravelerId(), traveler);
        }
        String json = null;
        json = new Gson().toJson(notFollowedTravelers);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

    }
}
