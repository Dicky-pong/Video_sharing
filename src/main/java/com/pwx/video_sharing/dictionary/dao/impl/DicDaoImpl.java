package com.pwx.video_sharing.dictionary.dao.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pwx.video_sharing.common.baseUtil.BaseDao;
import com.pwx.video_sharing.dictionary.dao.DicDao;
import com.pwx.video_sharing.dictionary.entity.DataDictionary;


@Service
public class DicDaoImpl extends BaseDao implements DicDao {

    @Override
    public List<DataDictionary> getList() {
        
        return (List<DataDictionary>) super.getAll(DataDictionary.class);
        
    }

}
