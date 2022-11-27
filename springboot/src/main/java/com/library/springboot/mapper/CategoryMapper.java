package com.library.springboot.mapper;

import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Admin;
import com.library.springboot.entity.Category;
import com.library.springboot.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper {


    List<Category> list();

    //    @Select("select * from user where name like concat('%', #{ name }, '%') and phone like concat('%', #{ phone }, '%')")
    List<Category> listByCondition(BaseRequest baseRequest);

    void save(Category obj);

    Category getById(Integer id);

    void updateById(Category obj);

    void deleteById(Integer id);

}