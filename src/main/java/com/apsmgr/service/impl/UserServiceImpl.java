package com.apsmgr.service.impl;

import com.apsmgr.bo.UserBo;
import com.apsmgr.dao.UserDao;
import com.apsmgr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author hyh
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public int updateUser(UserBo userBo) {
        return 0;
    }

}
