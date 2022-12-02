package com.library.springboot.service;

import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Recommendation;

import java.util.List;

public interface IRecommendService {
    List<Recommendation> list();

    PageInfo<Recommendation> page(BaseRequest baseRequest);

    void save(Recommendation obj);

    Recommendation getById(Integer id);

    void update(Recommendation obj);

    void deleteById(Integer id);

}
