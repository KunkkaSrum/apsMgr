package com.apsmgr.dao;

import com.apsmgr.bo.UserResourceBo;

import java.util.List;

public interface UserResourceDao {
    int deleteByPrimaryKey(String userResourceNo);

    int insert(UserResourceBo record);

    int insertSelective(UserResourceBo record);

    UserResourceBo selectByPrimaryKey(String userResourceNo);

    int updateByPrimaryKeySelective(UserResourceBo record);

    int updateByPrimaryKey(UserResourceBo record);

    List<UserResourceBo> selectAll();
}