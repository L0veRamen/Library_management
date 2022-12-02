package com.library.springboot.service;

import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Read;

import java.util.List;

public interface IReadService {
    List<Read> list();

    PageInfo<Read> page(BaseRequest baseRequest);

    void save(Read obj);

    Read getById(Integer id);

    void update(Read obj);

    void deleteById(Integer id);

}
