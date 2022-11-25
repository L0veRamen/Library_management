package com.library.springboot.mapper;

import com.library.springboot.controller.request.UserPageRequest;
import com.library.springboot.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper {
//    @Select("select * from user")
    List<User> list();

//    @Select("select * from user where name like concat('%', #{ name }, '%') and phone like concat('%', #{ phone }, '%')")
    List<User> listByCondition(UserPageRequest userPageRequest);

    void save(User user);

    User getById(Integer id);

    void updateById(User user);

    void deleteById(Integer id);
}
