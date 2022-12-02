package com.library.springboot.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.ToRead;
import com.library.springboot.mapper.ToReadMapper;
import com.library.springboot.service.IToReadService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.List;

@Service
@Slf4j
public class ToReadService implements IToReadService {

    @Resource
    ToReadMapper toReadMapper;


    @Override
    public List<ToRead> list() {
        return toReadMapper.list();
    }

    @Override
    public PageInfo<ToRead> page(BaseRequest baseRequest) {

        PageHelper.startPage(baseRequest.getPageNum(), baseRequest.getPageSize());
        List<ToRead> list = toReadMapper.listByCondition(baseRequest);
        return new PageInfo<>(list);
    }

    @Override
    public void save(ToRead obj) {
        obj.setCategory(obj.getCategory());
        obj.setFavourite(false); // default set false to favourite
        if (obj.getCover() == null) {
            obj.setCover("https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg"); //set default cover
        }
        toReadMapper.save(obj);
    }

    @Override
    public ToRead getById(Integer id) {
        return toReadMapper.getById(id);
    }

    @Override
    public void update(ToRead obj) {

        obj.setFavourite(!obj.isFavourite());

        obj.setUpdatetime(LocalDate.now());
        toReadMapper.updateById(obj);
    }

    @Override
    public void deleteById(Integer id) {
        toReadMapper.deleteById(id);
    }
}
