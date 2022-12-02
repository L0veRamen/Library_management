package com.library.springboot.mapper;

import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Recommendation;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RecommendationMapper {


    List<Recommendation> list();

    List<Recommendation> listByCondition(BaseRequest baseRequest);

    void save(Recommendation obj);

    Recommendation getById(Integer id);

    void updateById(Recommendation obj);

    void deleteById(Integer id);

}