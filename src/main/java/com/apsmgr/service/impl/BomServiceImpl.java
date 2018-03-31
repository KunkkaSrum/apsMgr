package com.apsmgr.service.impl;

import com.apsmgr.bo.BomBo;
import com.apsmgr.dao.BomDao;
import com.apsmgr.service.BomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hyh
 */
@Service
public class BomServiceImpl implements BomService {

    @Autowired
    private BomDao bomDao;

    @Override
    public List<BomBo> selectAllBom() {
        return bomDao.selectAllBom();
    }

    @Override
    public int updateByPrimaryKey(BomBo bomBo) {
        return bomDao.updateByPrimaryKey(bomBo);
    }

    @Override
    public int insert(BomBo bomBo) {
        return bomDao.insert(bomBo);
    }

    @Override
    public int deleteBatch(List<String> bomNolist) {
        return bomDao.deleteBatch(bomNolist);
    }
}
