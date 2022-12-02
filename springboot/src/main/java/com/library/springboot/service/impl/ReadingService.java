package com.library.springboot.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Reading;
import com.library.springboot.mapper.ReadingMapper;
import com.library.springboot.service.IReadingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.List;

@Service
@Slf4j
public class ReadingService implements IReadingService {

    @Resource
    ReadingMapper readingMapper;


    @Override
    public List<Reading> list() {
        return readingMapper.list();
    }

    @Override
    public PageInfo<Reading> page(BaseRequest baseRequest) {

        PageHelper.startPage(baseRequest.getPageNum(), baseRequest.getPageSize());
        List<Reading> list = readingMapper.listByCondition(baseRequest);
        return new PageInfo<>(list);
    }

    @Override
    public void save(Reading obj) {
        obj.setCategory(obj.getCategory());
        obj.setFavourite(false); // default set false to favourite
        if (obj.getCover() == null) {
            obj.setCover("https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg"); //set default cover
        }
        readingMapper.save(obj);
    }

    @Override
    public Reading getById(Integer id) {
        return readingMapper.getById(id);
    }

    @Override
    public void update(Reading obj) {

        obj.setFavourite(!obj.isFavourite());

        obj.setUpdatetime(LocalDate.now());
        readingMapper.updateById(obj);
    }

    @Override
    public void deleteById(Integer id) {
        readingMapper.deleteById(id);
    }
}
