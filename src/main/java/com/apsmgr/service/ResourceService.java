package com.apsmgr.service;

import com.apsmgr.bo.ResourceBo;

import java.util.List;

/**
 * @author hyh
 */
public interface ResourceService {

    List<ResourceBo> selectAllResource();

    int update(ResourceBo resourceBo);

    int insert(ResourceBo resourceBo);

    int deleteBatch(List<String> resourceNolist);
}
