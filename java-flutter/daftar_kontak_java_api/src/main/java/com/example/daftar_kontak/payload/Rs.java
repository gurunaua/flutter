package com.example.daftar_kontak.payload;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.HashMap;
import java.util.Map;

public class Rs {

    public static final String MESSAGE_NO_DATA = "NO_DATA";
    public static final String MESSAGE_NO_DATA_PROCESS = "NO_DATA_PROCES";
    public static String MESSAGE_UPDATED = "UPDDATED";
    public static String MESSAGE_ERROR = "ERROR";
    public static String MESSAGE_DELETED = "DELETED";
    public static String MESSAGE_UNPROCESS = "UNPROCESS";

    public static ResponseEntity<Object> response(String message, HttpStatus status, Object responseObj) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("message", message);
        map.put("status", status.value());
        map.put("data", responseObj);

        return new ResponseEntity<Object>(map,status);
    }
}