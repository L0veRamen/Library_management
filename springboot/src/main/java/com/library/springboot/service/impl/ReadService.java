package com.library.springboot.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Read;
import com.library.springboot.mapper.ReadMapper;
import com.library.springboot.service.IReadService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.List;

@Service
@Slf4j
public class ReadService implements IReadService {

    @Resource
    ReadMapper readMapper;


    @Override
    public List<Read> list() {
        return readMapper.list();
    }

    @Override
    public PageInfo<Read> page(BaseRequest baseRequest) {

        PageHelper.startPage(baseRequest.getPageNum(), baseRequest.getPageSize());
        List<Read> list = readMapper.listByCondition(baseRequest);
        return new PageInfo<>(list);
    }

    @Override
    public void save(Read obj) {
        obj.setCategory(obj.getCategory());
        obj.setFavourite(false); // default set false to favourite
        if (obj.getCover() == null) {
            obj.setCover("https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg"); //set default cover
        }
        readMapper.save(obj);
    }

    @Override
    public Read getById(Integer id) {
        return readMapper.getById(id);
    }

    @Override
    public void update(Read obj) {

        obj.setFavourite(!obj.isFavourite());

        obj.setUpdatetime(LocalDate.now());
        readMapper.updateById(obj);
    }

    @Override
    public void deleteById(Integer id) {
        readMapper.deleteById(id);
    }
}
