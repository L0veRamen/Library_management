package com.library.springboot.service;

import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.controller.request.UserPageRequest;
import com.library.springboot.entity.User;

import java.util.List;

public interface IUserService {

    List<User> list();

    PageInfo<User> page(BaseRequest baseRequest);

    void save(User user);

    User getById(Integer id);

    void update(User user);

    void deleteById(Integer id);
}
