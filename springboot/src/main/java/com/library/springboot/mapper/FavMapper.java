package com.library.springboot.mapper;

import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Favourite;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FavMapper {


    List<Favourite> list();

    List<Favourite> listByCondition(BaseRequest baseRequest);

    void save(Favourite obj);

    Favourite getById(Integer id);

    void updateById(Favourite obj);

    void deleteById(Integer id);

}