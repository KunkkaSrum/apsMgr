package com.apsmgr.dao;

import com.apsmgr.bo.RoleResourceBo;

import java.util.List;

public interface RoleResourceDao {
    int deleteBatch(String roleNo);

    int insert(RoleResourceBo record);

    int insertList(List<RoleResourceBo> roleResourceBos);

    int insertSelective(RoleResourceBo record);

    RoleResourceBo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(RoleResourceBo record);

    int updateByPrimaryKey(RoleResourceBo record);

    List<RoleResourceBo> selectAll();
}