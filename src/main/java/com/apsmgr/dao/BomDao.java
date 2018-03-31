package com.apsmgr.dao;

import com.apsmgr.bo.BomBo;

import java.util.List;

public interface BomDao {
//    int deleteByPrimaryKey(Long id);

    int insert(BomBo bomBo);

    int deleteBatch(List<String> bomNoList);

//    int insertSelective(BomBo record);

//    BomBo selectByPrimaryKey(Long id);

//    int updateByPrimaryKeySelective(BomBo record);

    int updateByPrimaryKey(BomBo bomBo);

    List<BomBo> selectAllBom();
}