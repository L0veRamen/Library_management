package com.library.springboot.service;

import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.ToRead;

import java.util.List;

public interface IToReadService {
    List<ToRead> list();

    PageInfo<ToRead> page(BaseRequest baseRequest);

    void save(ToRead obj);

    ToRead getById(Integer id);

    void update(ToRead obj);

    void deleteById(Integer id);

}
