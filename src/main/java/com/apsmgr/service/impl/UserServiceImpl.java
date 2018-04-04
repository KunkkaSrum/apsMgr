package com.apsmgr.service.impl;

import com.apsmgr.bo.UserBo;
import com.apsmgr.dao.UserDao;
import com.apsmgr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hyh
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public List<UserBo> selectUserAll() {
        return userDao.selectAll();
    }

    @Override
    public int insert(UserBo userBo) {
        return userDao.insert(userBo);
    }

    @Override
    public int update(UserBo userBo) {
        return userDao.updateByPrimaryKeySelective(userBo);
    }

    @Override
    public int delete(String userNo) {
        return userDao.deleteByPrimaryKey(userNo);
    }
}
