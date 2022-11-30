package com.library.springboot.service;

import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Category;

import java.util.List;

public interface ICategoryService {
    List<Category> list();

    PageInfo<Category> page(BaseRequest baseRequest);

    void save(Category obj);

    Category getById(Integer id);

    void update(Category obj);

    void deleteById(Integer id);

}
