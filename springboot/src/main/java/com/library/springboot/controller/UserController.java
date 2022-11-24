package com.library.springboot.controller;

import com.library.springboot.common.Result;
import com.library.springboot.controller.request.UserPageRequest;
import com.library.springboot.entity.User;
import com.library.springboot.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin // fixed No 'Access-Control-Allow-Origin' error
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    IUserService userService;

    @GetMapping("/list")
    public Result list(){
        List<User> users = userService.list();
        return  Result.success(users);
    }

    @GetMapping("/page")
    public Result page(UserPageRequest userPageRequest){
        return  Result.success( userService.page(userPageRequest));
    }
}
