package com.itravel.dao;

import com.itravel.model.*;

import java.time.LocalDateTime;
import java.util.List;

public class DBTest {

    public static void main(String[] args){
        UserDao userdao = new UserDao();
//        List<User> users = userdao.getAllUser();
//        for(User u: users){
//            System.out.println("Email:"+  u.getEmail());
//            System.out.println("Password:"+  u.getPassword());
//            System.out.println("Role:"+  u.getRole());
//            System.out.println("Active:"+  u.isActive());
//        }
//        User user1 =  userdao.getUser("edagnew@miu.edu");
//        System.out.println("edagnew@miu.edu is Active :"+ user1.isActive());
//        boolean result = userdao.addUser(new User("samuelbereka@gmail.com","sami1233",true, Role.ADMIN));
//        System.out.println(result);
//        for(User u: userdao.getActiveUsers()){
//           System.out.print("Email:"+  u.getEmail());
//           System.out.print("   Password:"+  u.getPassword());
//           System.out.print("   Role:"+  u.getRole());
//           System.out.print("   Active:"+  u.isActive()+"\n");
//        }
//
//        System.out.println("traveler@gmail.com exists in user :"+userdao.emailAlreadyExists("traveler@gmail.com"));
//         Insert LocationTest
        LocationDao locationDao = new LocationDao();
//        System.out.println(locationDao.getLocation(1));
//        locationDao.addLocation(new Location(10.33,-4546.9866));
//        System.out.println(locationDao.getLocation(3));
//
//        User user = userdao.login("edagnew@miu.edu","esuAbadi");
//        System.out.println(user);
//
        AddressDao addressDao = new AddressDao();
        Address address1= new Address("IA","Fair","1000 N 4th", 10020 );
////        int adId = addressDao.addAddress();
////        System.out.println("The Newly Inserted Address Id :"+ adId);
//
//
        Traveler traveler = new Traveler("49460","Solomon","Kassa","Mekonnen","Male",1980,"solkassa@gmail.com","solkassa",true,Role.USER, address1,"","");

        //        TravelerDao travelerDao = new TravelerDao();
////        travelerDao.addTraveler(traveler);
//        System.out.println(travelerDao.getAllTraveler());
//
//        System.out.println("Logging in with traveler");
//        User user1 = userdao.login("solkassa@gmail.com","esuAbadi");
//
//        System.out.println(user1);
//        System.out.println("Set Activation Result :" + userdao.setActivation("solkassa@gmail.com",true));
//
//        System.out.println("Get active Travelers /n"+ travelerDao.getActiveTravelers());
//        System.out.println("Get Inactive Travelers /n"+ travelerDao.getInactiveTravelers());



//        Post post1 = new Post("Hi this is My First Post!!!",LocalDateTime.now(),"",false,traveler,new Location(198.33,-1006.9866));
        PostDao postDao = new PostDao();
//        System.out.println("Adding an Address Successful: "+ addressDao.addAddress(address1));
//        System.out.println("Adding a Location Successful: "+ locationDao.addLocation(new Location(10.33,-4546.9866)));
//        System.out.println("Adding a Post Successful: "+ postDao.addPost(post1));
//        System.out.println(postDao.getUnhealthyPosts());
//        System.out.println(postDao.getAllPosts());

//        String a = null;
//
//        System.out.println(d);
        Location location = new Location(123,123);

        Post post = new Post("Post Test", LocalDateTime.now(), "", true, traveler, location);

        boolean result = postDao.addPost(post);


    }
}
