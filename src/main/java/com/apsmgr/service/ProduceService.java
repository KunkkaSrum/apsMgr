package com.apsmgr.service;

import com.apsmgr.bo.ProduceBo;

import java.util.List;

public interface ProduceService {

    int insert(ProduceBo produceBo);

    int deleteBatch(List<String> produceNoList);

    List<ProduceBo> selectAllProduce();

    int update(ProduceBo produceBo);

}
