package com.itravel.controller;

import com.google.gson.Gson;
import com.itravel.dao.PostDao;
import com.itravel.dao.UnhealthyWordDao;
import com.itravel.model.Location;
import com.itravel.model.Post;
import com.itravel.model.Traveler;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.*;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AddPostServlet extends HttpServlet {

    private final static Logger LOGGER =
            Logger.getLogger(AddPostServlet.class.getCanonicalName());
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        final String RESULT_SUCCESSFUL = "successful";
        final String RESULT_FAIL = "failed";
        Traveler traveler = (Traveler) request.getSession().getAttribute("traveler");
//        String travelerId = (String) request.getParameter("travelerId") ;
        String postImage = null;
        postImage = (String)  request.getParameter("postImage");
        String postText = (String) request.getParameter("postText");
        //       This part checks post text whether it is healthy or unhealthy
        boolean healthyType = true;
        UnhealthyWordDao unhealthyWordDao = new UnhealthyWordDao();
        for(String word: unhealthyWordDao.getAllUnhealthyWords()){
                if(postText.contains(word)){
                    healthyType = false;
                }
        }


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

        Location location = new Location(longitude,latitude);


        PostDao postDao =  new PostDao();
        Post post;
        if(postImage== null)
           post  = new Post(postText, LocalDateTime.now(), "", healthyType, traveler, location);
        else
            post = new Post(postText, LocalDateTime.now(), postImage, healthyType, traveler, location);

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

//        boolean isMultipart;
//        String filePath = "C:\\Users\\esuab\\IdeaProjects\\iTravel_Project\\src\\main\\postImages";
//        int maxFileSize = 50 * 1024;
//        int maxMemSize = 4 * 1024;
//        File file ;
//
//
//
//        final String path = request.getParameter(filePath);
//        final Part filePart = request.getPart("postImage");
//        final String fileName = getFileName(filePart);
//
//        OutputStream out = null;
//        InputStream filecontent = null;
//        final PrintWriter writer = response.getWriter();
//
//        try {
//            out = new FileOutputStream(new File(path + File.separator
//                    + fileName));
//            filecontent = filePart.getInputStream();
//
//            int read = 0;
//            final byte[] bytes = new byte[1024];
//
//            while ((read = filecontent.read(bytes)) != -1) {
//                out.write(bytes, 0, read);
//            }
//            writer.println("New file " + fileName + " created at " + path);
//            LOGGER.log(Level.INFO, "File{0}being uploaded to {1}",
//                    new Object[]{fileName, path});
//        } catch (FileNotFoundException fne) {
//            writer.println("You either did not specify a file to upload or are "
//                    + "trying to upload a file to a protected or nonexistent "
//                    + "location.");
//            writer.println("<br/> ERROR: " + fne.getMessage());
//
//            LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}",
//                    new Object[]{fne.getMessage()});
//        } finally {
//            if (out != null) {
//                out.close();
//            }
//            if (filecontent != null) {
//                filecontent.close();
//            }
//            if (writer != null) {
//                writer.close();
//            }
//        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isMultipart;
        String filePath = "C:\\Users\\esuab\\IdeaProjects\\iTravel_Project\\src\\main\\postImages";
        int maxFileSize = 50 * 1024;
        int maxMemSize = 4 * 1024;
        File file ;



        final String path = request.getParameter(filePath);
        final Part filePart = request.getPart("postImage");
        final String fileName = getFileName(filePart);

        OutputStream out = null;
        InputStream filecontent = null;
        final PrintWriter writer = response.getWriter();

        try {
            out = new FileOutputStream(new File(path + File.separator
                    + fileName));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            writer.println("New file " + fileName + " created at " + path);
            LOGGER.log(Level.INFO, "File{0}being uploaded to {1}",
                    new Object[]{fileName, path});
        } catch (FileNotFoundException fne) {
            writer.println("You either did not specify a file to upload or are "
                    + "trying to upload a file to a protected or nonexistent "
                    + "location.");
            writer.println("<br/> ERROR: " + fne.getMessage());

            LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}",
                    new Object[]{fne.getMessage()});
        } finally {
            if (out != null) {
                out.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
            if (writer != null) {
                writer.close();
            }
        }

    }
    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
