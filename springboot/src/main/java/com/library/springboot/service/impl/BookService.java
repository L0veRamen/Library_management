package com.library.springboot.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Book;
import com.library.springboot.entity.UpdateBook;
import com.library.springboot.mapper.BookMapper;
import com.library.springboot.service.IBookService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.List;

@Service
@Slf4j
public class BookService implements IBookService {

    @Resource
    BookMapper bookMapper;


    @Override
    public List<Book> list() {
        return bookMapper.list();
    }

    @Override
    public PageInfo<Book> page(BaseRequest baseRequest) {

        PageHelper.startPage(baseRequest.getPageNum(), baseRequest.getPageSize());
        List<Book> list = bookMapper.listByCondition(baseRequest);
        return new PageInfo<>(list);
    }

    @Override
    public void save(Book obj) {
        List<String> categories = obj.getCategories();
        String cover = obj.getCover();
        obj.setCategory(categories.get(0));
        obj.setFavourite(false); // default set false to favourite
        if (cover == null) {
            obj.setCover("https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg"); //set default cover
        }
        bookMapper.save(obj);
    }

    @Override
    public Book getById(Integer id) {
        return bookMapper.getById(id);
    }

    @Override
    public void update(UpdateBook obj) {
        obj.setUpdatetime(LocalDate.now());
        bookMapper.updateById(obj);
    }
    @Override
    public void updateByFav(Book obj) {
        obj.setFavourite(!obj.isFavourite());
        obj.setUpdatetime(LocalDate.now());
        bookMapper.updateByFav(obj);
    }

    @Override
    public void deleteById(Integer id) {
        bookMapper.deleteById(id);
    }
}
