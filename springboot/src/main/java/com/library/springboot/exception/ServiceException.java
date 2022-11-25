package com.library.springboot.exception;


public class ServiceException extends RuntimeException{

    public ServiceException(String message) {
        super(message);
    }
}
