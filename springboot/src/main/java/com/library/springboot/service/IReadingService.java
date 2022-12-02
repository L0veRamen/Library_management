package com.library.springboot.service;

import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Reading;

import java.util.List;

public interface IReadingService {
    List<Reading> list();

    PageInfo<Reading> page(BaseRequest baseRequest);

    void save(Reading obj);

    Reading getById(Integer id);

    void update(Reading obj);

    void deleteById(Integer id);

}
