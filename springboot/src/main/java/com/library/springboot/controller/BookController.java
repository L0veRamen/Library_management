package com.library.springboot.controller;

import com.library.springboot.common.Result;
import com.library.springboot.controller.request.BookPageRequest;
import com.library.springboot.entity.Book;
import com.library.springboot.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin // fixed No 'Access-Control-Allow-Origin' error
@RestController
@RequestMapping("/book")
public class BookController {
    @Autowired
    IBookService bookService;

    @PostMapping("/save")
    public Result save(@RequestBody Book obj) {
        bookService.save(obj);
        return Result.success();
    }


    @PutMapping("/update")
    public Result update(@RequestBody Book obj) {
        bookService.update(obj);
        return Result.success();
    }

    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        bookService.deleteById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id) {
        Book obj = bookService.getById(id);
        return Result.success(obj);
    }

    @GetMapping("/list")
    public Result list() {
        List<Book> list = bookService.list();
        return Result.success(list);
    }

    @GetMapping("/page")
    public Result page(BookPageRequest pageRequest) {
        return Result.success(bookService.page(pageRequest));
    }
}
