package com.library.springboot.mapper;

import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.ToRead;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ToReadMapper {


    List<ToRead> list();

    List<ToRead> listByCondition(BaseRequest baseRequest);

    void save(ToRead obj);

    ToRead getById(Integer id);

    void updateById(ToRead obj);

    void deleteById(Integer id);

}