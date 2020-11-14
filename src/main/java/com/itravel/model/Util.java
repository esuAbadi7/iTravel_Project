package com.itravel.model;

public class Util {

    public static String idGenerator(){
        int rand = (int) (Math.random()*(99999 - 10000)) + 10000;
        return String.valueOf(rand);
    }
}

