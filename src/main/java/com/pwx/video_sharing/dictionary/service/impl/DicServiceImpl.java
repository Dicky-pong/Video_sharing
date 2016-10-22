package com.pwx.video_sharing.dictionary.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.pwx.video_sharing.dictionary.dao.DicDao;
import com.pwx.video_sharing.dictionary.entity.DataDictionary;
import com.pwx.video_sharing.dictionary.service.IDicService;



@Service("dicService")
public class DicServiceImpl implements IDicService {

    @Resource
    private DicDao dicDao;
    
    @Override
    public List<DataDictionary> getList() {
        return dicDao.getList();
    }

}
