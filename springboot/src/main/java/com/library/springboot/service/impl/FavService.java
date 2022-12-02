package com.library.springboot.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Favourite;
import com.library.springboot.mapper.FavMapper;
import com.library.springboot.service.IFavService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.List;

@Service
@Slf4j
public class FavService implements IFavService {

    @Resource
    FavMapper favMapper;


    @Override
    public List<Favourite> list() {
        return favMapper.list();
    }

    @Override
    public PageInfo<Favourite> page(BaseRequest baseRequest) {

        PageHelper.startPage(baseRequest.getPageNum(), baseRequest.getPageSize());
        List<Favourite> list = favMapper.listByCondition(baseRequest);
        return new PageInfo<>(list);
    }

    @Override
    public void save(Favourite obj) {
        obj.setCategory(obj.getCategory());
        obj.setFavourite(false); // default set false to favourite
        if (obj.getCover() == null) {
            obj.setCover("https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg"); //set default cover
        }
        favMapper.save(obj);
    }

    @Override
    public Favourite getById(Integer id) {
        return favMapper.getById(id);
    }

    @Override
    public void update(Favourite obj) {

        obj.setFavourite(!obj.isFavourite());

        obj.setUpdatetime(LocalDate.now());
        favMapper.updateById(obj);
    }

    @Override
    public void deleteById(Integer id) {
        favMapper.deleteById(id);
    }
}
