package com.library.springboot.mapper;

import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.FavItem;
import com.library.springboot.entity.Favourite;
import com.library.springboot.entity.UpdateBook;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FavMapper {


    List<FavItem> list();

    List<Favourite> listByCondition(BaseRequest baseRequest);

    void save(UpdateBook obj);

    Favourite getById(Integer id);

    void updateById(Favourite obj);

    void changeFav(Favourite obj);

    void deleteById(UpdateBook obj);

}