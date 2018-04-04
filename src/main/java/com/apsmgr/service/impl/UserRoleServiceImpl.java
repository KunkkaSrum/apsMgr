package com.apsmgr.service.impl;

import com.apsmgr.bo.UserRoleBo;
import com.apsmgr.dao.UserRoleDao;
import com.apsmgr.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleDao userRoleDao;

    @Override
    public List<UserRoleBo> selectUserRoleAll() {
        return userRoleDao.selectAll();
    }

    @Override
    public int insert(UserRoleBo userRoleBo) {
        return userRoleDao.insert(userRoleBo);
    }

    @Override
    public int update(UserRoleBo userRoleBo) {
        return userRoleDao.updateByPrimaryKeySelective(userRoleBo);
    }

    @Override
    public int delete(String userRoleNo) {
        return userRoleDao.deleteByPrimaryKey(userRoleNo);
    }
}
