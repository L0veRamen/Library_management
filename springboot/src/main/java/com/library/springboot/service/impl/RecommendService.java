package com.library.springboot.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.entity.Recommendation;
import com.library.springboot.mapper.RecommendationMapper;
import com.library.springboot.service.IRecommendService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.List;

@Service
@Slf4j
public class RecommendService implements IRecommendService{
    @Resource
    RecommendationMapper recommendationMapper;


    @Override
    public List<Recommendation> list() {
        return recommendationMapper.list();
    }

    @Override
    public PageInfo<Recommendation> page(BaseRequest baseRequest) {

        PageHelper.startPage(baseRequest.getPageNum(), baseRequest.getPageSize());
        List<Recommendation> list = recommendationMapper.listByCondition(baseRequest);
        return new PageInfo<>(list);
    }

    @Override
    public void save(Recommendation obj) {
        obj.setCategory(obj.getCategory());
        obj.setFavourite(false); // default set false to favourite
        if (obj.getCover() == null) {
            obj.setCover("https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg"); //set default cover
        }
        recommendationMapper.save(obj);
    }

    @Override
    public Recommendation getById(Integer id) {
        return recommendationMapper.getById(id);
    }

    @Override
    public void update(Recommendation obj) {

        obj.setFavourite(!obj.isFavourite());

        obj.setUpdatetime(LocalDate.now());
        recommendationMapper.updateById(obj);
    }

    @Override
    public void deleteById(Integer id) {
        recommendationMapper.deleteById(id);
    }
}
