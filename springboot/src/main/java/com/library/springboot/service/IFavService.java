package com.library.springboot.service;

import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.FavItem;
import com.library.springboot.entity.Favourite;
import com.library.springboot.entity.UpdateBook;

import java.util.List;

public interface IFavService {
    List<FavItem> list();

    PageInfo<Favourite> page(BaseRequest baseRequest);

    void save(UpdateBook obj);

    Favourite getById(Integer id);

    void update(Favourite obj);

    void changeFav(Favourite Obj);

    void deleteById(UpdateBook obj);

}
