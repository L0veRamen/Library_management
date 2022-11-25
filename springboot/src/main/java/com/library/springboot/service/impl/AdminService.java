package com.library.springboot.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.springboot.common.Result;
import com.library.springboot.controller.dto.LoginDTO;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.controller.request.LoginRequest;
import com.library.springboot.entity.Admin;
import com.library.springboot.exception.ServiceException;
import com.library.springboot.mapper.AdminMapper;
import com.library.springboot.service.IAdminService;
import com.library.springboot.utils.MD5Util;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.rmi.server.ServerCloneException;
import java.util.Date;
import java.util.List;

@Service
@Slf4j
public class AdminService implements IAdminService {
    @Autowired
    AdminMapper adminMapper;

    private static final String DEFAULT_PASSWORD = "123";
    private static final String PASSWORD_SALT = "test";

    @Override
    public List<Admin> list() {
        return adminMapper.list();
    }

    @Override
    public PageInfo<Admin> page(BaseRequest baseRequest) {
        PageHelper.startPage(baseRequest.getPageNum(), baseRequest.getPageSize());
        List<Admin> users = adminMapper.listByCondition(baseRequest);

        return new PageInfo<>(users);
    }

    @Override
    public void save(Admin obj) throws Exception {
        if (obj.getPassword() == null){
            // default password test123
            obj.setPassword(DEFAULT_PASSWORD);
        }
        obj.setPassword(MD5Util.getEncryptedPwd(obj.getPassword()+ PASSWORD_SALT)); // MD5 encryption add salt
        adminMapper.save(obj);
    }

    @Override
    public Admin getById(Integer id) {
        return adminMapper.getById(id);
    }

    @Override
    public void update(Admin user) {
        user.setUpdatetime(new Date());
        adminMapper.updateById(user);
    }

    @Override
    public void deleteById(Integer id) {
        adminMapper.deleteById(id);
    }

    @Override
    public LoginDTO login(LoginRequest request) {
        Admin admin = adminMapper.getByUsernameAndPassword(request);
        if (admin == null){
            throw new ServiceException("username or password error !!!");
        }
        LoginDTO loginDTO = new LoginDTO();
        BeanUtils.copyProperties(admin, loginDTO);
        return loginDTO;
    }
}
