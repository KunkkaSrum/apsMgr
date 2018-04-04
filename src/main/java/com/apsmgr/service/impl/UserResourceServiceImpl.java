package com.apsmgr.service.impl;

import com.apsmgr.bo.UserResourceBo;
import com.apsmgr.dao.UserResourceDao;
import com.apsmgr.service.UserResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserResourceServiceImpl implements UserResourceService {
    @Autowired
    private UserResourceDao userResourceDao;

    @Override
    public List<UserResourceBo> selectUserResourceAll() {
        return userResourceDao.selectAll();
    }

    @Override
    public int insert(UserResourceBo userResourceBo) {
        return userResourceDao.insert(userResourceBo);
    }

    @Override
    public int update(UserResourceBo userResourceBo) {
        return userResourceDao.updateByPrimaryKeySelective(userResourceBo);
    }

    @Override
    public int delete(String userResourceNo) {
        return userResourceDao.deleteByPrimaryKey(userResourceNo);
    }
}
