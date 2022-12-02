package com.library.springboot.service;

import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Favourite;

import java.util.List;

public interface IFavService {
    List<Favourite> list();

    PageInfo<Favourite> page(BaseRequest baseRequest);

    void save(Favourite obj);

    Favourite getById(Integer id);

    void update(Favourite obj);

    void deleteById(Integer id);

}
