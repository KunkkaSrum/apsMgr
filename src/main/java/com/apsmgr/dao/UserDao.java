package com.apsmgr.dao;

import com.apsmgr.bo.UserBo;

import java.util.List;

public interface UserDao {
    int deleteByPrimaryKey(String userNo);

    int insert(UserBo record);

    int insertSelective(UserBo record);

    UserBo selectByPrimaryKey(String userNo);

    int updateByPrimaryKeySelective(UserBo record);

    int updateByPrimaryKey(UserBo record);

    List<UserBo> selectAll();

    UserBo selectByName(String userName);
}