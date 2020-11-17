package com.itravel.model;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneOffset;

public class Util {

    public static String idGenerator(){
        int rand = (int) (Math.random()*(99999 - 10000)) + 10000;
        return String.valueOf(rand);
    }

    public static LocalDateTime localDateFromTimestamp(Timestamp timestamp) {
        return LocalDateTime
                .ofInstant(timestamp.toInstant(), ZoneOffset.ofHours(0));
    }
}

