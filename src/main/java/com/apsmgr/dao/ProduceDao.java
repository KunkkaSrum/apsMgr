package com.apsmgr.dao;

import com.apsmgr.bo.ProduceBo;

import java.util.List;

public interface ProduceDao {

    int deleteBatch(List<String> produceNoList);

    int insert(ProduceBo produceBo);

    int updateByPrimaryKey(ProduceBo produceBo);

    List<ProduceBo> selectAllProduce();

    int deleteByPrimaryKey(Long id);

    int insertSelective(ProduceBo produceBo);

    ProduceBo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ProduceBo record);

}