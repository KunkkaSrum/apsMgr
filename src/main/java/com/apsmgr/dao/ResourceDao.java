package com.apsmgr.dao;

import com.apsmgr.bo.ResourceBo;

import java.util.List;

public interface ResourceDao {

    int insert(ResourceBo resourceBo);

    int deleteBatch(List<String> resourceNoList);

    int updateByPrimaryKey(ResourceBo resourceBo);

    List<ResourceBo> selectAllResource();

    int deleteByPrimaryKey(Long id);

    int insertSelective(ResourceBo record);

    ResourceBo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ResourceBo record);


}