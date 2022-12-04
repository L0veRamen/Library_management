package com.library.springboot.service;

import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Book;
import com.library.springboot.entity.UpdateBook;

import java.util.List;

public interface IBookService {
    List<Book> list();

    PageInfo<Book> page(BaseRequest baseRequest);

    void save(Book obj);

    Book getById(Integer id);

    void update(UpdateBook obj);

    void updateByFav(Book obj);

    void deleteById(Integer id);

}
