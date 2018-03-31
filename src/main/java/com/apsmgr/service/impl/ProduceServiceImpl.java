package com.apsmgr.service.impl;

import com.apsmgr.bo.ProduceBo;
import com.apsmgr.dao.ProduceDao;
import com.apsmgr.service.ProduceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProduceServiceImpl implements ProduceService {

    @Autowired
    private ProduceDao produceDao;

    @Override
    public int insert(ProduceBo produceBo) {
        return produceDao.insert(produceBo);
    }

    @Override
    public int deleteBatch(List<String> produceNoList) {
        return produceDao.deleteBatch(produceNoList);
    }

    @Override
    public List<ProduceBo> selectAllProduce() {
        return produceDao.selectAllProduce();
    }

    @Override
    public int update(ProduceBo produceBo) {
        return produceDao.updateByPrimaryKey(produceBo);
    }
}
