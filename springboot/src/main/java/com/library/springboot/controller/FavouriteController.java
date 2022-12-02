package com.library.springboot.controller;

import com.library.springboot.common.Result;
import com.library.springboot.controller.request.BookPageRequest;
import com.library.springboot.entity.Favourite;
import com.library.springboot.service.IFavService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin // fixed No 'Access-Control-Allow-Origin' error
@RestController
@RequestMapping("/fav")
public class FavouriteController {
    @Autowired
    IFavService favService;

    @PostMapping("/save")
    public Result save(@RequestBody Favourite obj) {
        favService.save(obj);
        return Result.success();
    }


    @PutMapping("/update")
    public Result update(@RequestBody Favourite obj) {
        favService.update(obj);
        return Result.success();
    }

    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        favService.deleteById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id) {
        Favourite obj = favService.getById(id);
        return Result.success(obj);
    }

    @GetMapping("/list")
    public Result list() {
        List<Favourite> list = favService.list();
        return Result.success(list);
    }

    @GetMapping("/page")
    public Result page(BookPageRequest pageRequest) {
        return Result.success(favService.page(pageRequest));
    }
}
