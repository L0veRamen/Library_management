package com.library.springboot.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.springboot.controller.dto.LoginDTO;
import com.library.springboot.controller.request.BaseRequest;
import com.library.springboot.controller.request.LoginRequest;
import com.library.springboot.entity.Admin;
import com.library.springboot.exception.ServiceException;
import com.library.springboot.mapper.AdminMapper;
import com.library.springboot.service.IAdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.List;

@Service
@Slf4j
public class AdminService implements IAdminService {
    @Autowired
    AdminMapper adminMapper;

    private static final String DEFAULT_PASSWORD = "test123";

    private static final String PASSWORD_SALT = "test123";

    //MD5 encryption
    private String encryptPassword(String password){
        return DigestUtils.md5DigestAsHex((password +PASSWORD_SALT).getBytes());
    }

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
    public void save(Admin obj) {
        //default password test123
        if (obj.getPassword()== null){
            obj.setPassword(DEFAULT_PASSWORD);
        }
        obj.setPassword(encryptPassword(obj.getPassword())); // MD5 encryption
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
    public LoginDTO login(LoginRequest request){
        request.setPassword(encryptPassword(request.getPassword()));
        Admin admin = adminMapper.getByUsernameAndPassword(request);
        if (admin == null) {
            throw new ServiceException("username or password error !!!");
        }
        LoginDTO loginDTO = new LoginDTO();
        BeanUtils.copyProperties(admin, loginDTO);
        return loginDTO;
    }
}
