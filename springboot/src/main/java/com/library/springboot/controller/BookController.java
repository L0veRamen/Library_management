package com.library.springboot.controller;

import com.library.springboot.common.Result;
import com.library.springboot.controller.request.BookPageRequest;
import com.library.springboot.entity.Book;
import com.library.springboot.entity.FavItem;
import com.library.springboot.entity.Favourite;
import com.library.springboot.entity.UpdateBook;
import com.library.springboot.service.IBookService;
import com.library.springboot.service.IFavService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin // fixed No 'Access-Control-Allow-Origin' error
@RestController
@RequestMapping("/book")
public class BookController {
    @Autowired
    IBookService bookService;

    @Autowired
    IFavService favService;

    @PostMapping("/save")
    public Result save(@RequestBody Book obj) {
        bookService.save(obj);
        return Result.success();
    }

    @GetMapping("/allBook")
    public Result allBook() {
        List<Book> favItems = bookService.list();
        return Result.success(favItems);
    }
    @GetMapping("/getFavList")
    public Result getFavList() {
        List<FavItem> favItems = favService.list();
        return Result.success(favItems);
    }

    @PostMapping("/updateStatus")
    public Result updateStatus(@RequestBody UpdateBook obj) {
        bookService.update(obj);
        return Result.success();
    }
    @PostMapping("/update")
    public Result update(@RequestBody UpdateBook obj) {
        Favourite fa = favService.getById(obj.getId());

        if (fa == null){

        favService.save(obj);
        }else{
            System.out.println("fav: "+fa.isFavourite());
            System.out.println("enter else");
            // change fav to unfav button
            if(!obj.isFavourite()){
                System.out.println("enter delete");
                favService.deleteById(obj);
            }
        }
        bookService.update(obj);

//        bookService.update(obj);
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
