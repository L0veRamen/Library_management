package com.library.springboot.service;

import com.library.springboot.controller.request.UserPageRequest;
import com.library.springboot.entity.User;

import java.util.List;

public interface IUserService {

    List<User> list();

    Object page(UserPageRequest userPageRequest);
}
