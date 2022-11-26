package com.library.springboot.service;

import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.dto.LoginDTO;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.controller.request.LoginRequest;
import com.library.springboot.controller.request.PasswordRequest;
import com.library.springboot.entity.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IAdminService {

    List<Admin> list();

    PageInfo<Admin> page(BaseRequest baseRequest);

    void save(Admin obj);

    Admin getById(Integer id);

    void update(Admin obj);

    void deleteById(Integer id);

    LoginDTO login(LoginRequest request);

    void changePass(PasswordRequest request);
}
