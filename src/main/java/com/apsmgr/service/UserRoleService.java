package com.apsmgr.service;

import com.apsmgr.bo.UserRoleBo;

import java.util.List;

public interface UserRoleService {
    List<UserRoleBo> selectUserRoleAll();

    int insert(UserRoleBo userRoleBo);

    int update(UserRoleBo userRoleBo);

    int delete(String userRoleNo);
}
