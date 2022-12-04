package com.library.springboot.mapper;

import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Book;
import com.library.springboot.entity.UpdateBook;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper {


    List<Book> list();

    //    @Select("select * from user where name like concat('%', #{ name }, '%') and phone like concat('%', #{ phone }, '%')")
    List<Book> listByCondition(BaseRequest baseRequest);

    void save(Book obj);

    Book getById(Integer id);

    void updateById(UpdateBook obj);

    void updateByFav(Book obj);

    void deleteById(Integer id);

}