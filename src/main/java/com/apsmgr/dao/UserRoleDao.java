package com.apsmgr.dao;

import com.apsmgr.bo.UserRoleBo;

import java.util.List;

public interface UserRoleDao {
    int deleteByPrimaryKey(String userRoleNo);

    int insert(UserRoleBo record);

    int insertSelective(UserRoleBo record);

    UserRoleBo selectByPrimaryKey(String userRoleNo);

    int updateByPrimaryKeySelective(UserRoleBo record);

    int updateByPrimaryKey(UserRoleBo record);

    List<UserRoleBo> selectAll();
}