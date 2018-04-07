package com.apsmgr.service;

import com.apsmgr.bo.RoleResourceBo;
import com.apsmgr.bo.UserRoleBo;
import com.apsmgr.vo.UserRoleVo;

import java.util.List;

public interface UserRoleService {
    List<UserRoleBo> selectUserRoleAll();

    List<RoleResourceBo> selectUserRole();

    int insert(UserRoleVo userRoleVo, String[] roleResourceBoList);

    int update(UserRoleBo userRoleBo);

    int delete(String userRoleNo);

    int updateRoleResource(String roleNo, String[] resourceNos);
}
