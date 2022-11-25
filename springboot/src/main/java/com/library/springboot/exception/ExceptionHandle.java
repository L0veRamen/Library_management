package com.library.springboot.exception;


import com.library.springboot.common.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;


@Slf4j
@RestControllerAdvice
public class ExceptionHandle {

    @ExceptionHandler(value=ServiceException.class)
    public Result serviceExceptionError(ServiceException e) throws Exception{
        log.error("Service Error !!!",e);
        return Result.error(e.getMessage());
    }

    @ExceptionHandler(value=Exception.class)
    public Result exceptionError(Exception e) throws Exception{
        log.error("System Error !!!",e);
        return Result.error("System Error");
    }

}
