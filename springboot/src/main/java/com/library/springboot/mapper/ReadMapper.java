package com.library.springboot.mapper;

import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Read;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReadMapper {


    List<Read> list();

    List<Read> listByCondition(BaseRequest baseRequest);

    void save(Read obj);

    Read getById(Integer id);

    void updateById(Read obj);

    void deleteById(Integer id);

}