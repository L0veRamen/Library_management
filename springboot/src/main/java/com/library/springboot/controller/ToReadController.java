package com.library.springboot.controller;

import com.library.springboot.common.Result;
import com.library.springboot.controller.request.BookPageRequest;
import com.library.springboot.entity.ToRead;
import com.library.springboot.service.IToReadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin // fixed No 'Access-Control-Allow-Origin' error
@RestController
@RequestMapping("/toRead")
public class ToReadController {
    @Autowired
    IToReadService toReadService;

    @PostMapping("/save")
    public Result save(@RequestBody ToRead obj) {
        toReadService.save(obj);
        return Result.success();
    }


    @PutMapping("/update")
    public Result update(@RequestBody ToRead obj) {
        toReadService.update(obj);
        return Result.success();
    }

    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        toReadService.deleteById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id) {
        ToRead obj = toReadService.getById(id);
        return Result.success(obj);
    }

    @GetMapping("/list")
    public Result list() {
        List<ToRead> list = toReadService.list();
        return Result.success(list);
    }

    @GetMapping("/page")
    public Result page(BookPageRequest pageRequest) {
        return Result.success(toReadService.page(pageRequest));
    }
}
