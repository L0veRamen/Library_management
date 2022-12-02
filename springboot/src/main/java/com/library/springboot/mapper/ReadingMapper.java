package com.library.springboot.mapper;

import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Reading;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReadingMapper {


    List<Reading> list();

    List<Reading> listByCondition(BaseRequest baseRequest);

    void save(Reading obj);

    Reading getById(Integer id);

    void updateById(Reading obj);

    void deleteById(Integer id);

}