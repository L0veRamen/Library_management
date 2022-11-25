package com.library.springboot.controller;

import com.library.springboot.common.Result;
import com.library.springboot.controller.dto.LoginDTO;
import com.library.springboot.controller.request.AdminPageRequest;
import com.library.springboot.controller.request.LoginRequest;
import com.library.springboot.entity.Admin;
import com.library.springboot.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin // fixed No 'Access-Control-Allow-Origin' error
@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    IAdminService adminService;

    @PostMapping("/save")
    public Result save(@RequestBody Admin obj) throws Exception {
        adminService.save(obj);
        return Result.success();
    }

    @PostMapping("/login")
    public Result login(@RequestBody LoginRequest request) {
        LoginDTO login = adminService.login(request);
        return Result.success(login);
    }


    @PutMapping("/update")
    public Result update(@RequestBody Admin obj) {
        adminService.update(obj);
        return Result.success();
    }

    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        adminService.deleteById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id) {
        Admin obj = adminService.getById(id);
        return Result.success(obj);
    }

    @GetMapping("/list")
    public Result list() {
        List<Admin> list = adminService.list();
        return Result.success(list);
    }

    @GetMapping("/page")
    public Result page(AdminPageRequest pageRequest) {
        return Result.success(adminService.page(pageRequest));
    }
}
