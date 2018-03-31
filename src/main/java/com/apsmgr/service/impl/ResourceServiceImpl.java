package com.apsmgr.service.impl;

import com.apsmgr.bo.ResourceBo;
import com.apsmgr.dao.ResourceDao;
import com.apsmgr.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hyh
 */
@Service
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private ResourceDao resourceDao;

    @Override
    public List<ResourceBo> selectAllResource() {
        return resourceDao.selectAllResource();
    }

    @Override
    public int update(ResourceBo resourceBo) {
        return resourceDao.updateByPrimaryKey(resourceBo);
    }

    @Override
    public int insert(ResourceBo resourceBo) {
        return resourceDao.insert(resourceBo);
    }

    @Override
    public int deleteBatch(List<String> resourceNolist) {
        return resourceDao.deleteBatch(resourceNolist);
    }
}
