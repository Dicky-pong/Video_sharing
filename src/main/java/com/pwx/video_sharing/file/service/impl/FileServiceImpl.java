package com.pwx.video_sharing.file.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.pwx.video_sharing.common.pagination.Page;
import com.pwx.video_sharing.file.dao.FileDao;
import com.pwx.video_sharing.file.entity.File;
import com.pwx.video_sharing.file.service.IFileService;
@Service("fileService")
public class FileServiceImpl implements IFileService{
	@Resource
	private FileDao fileDao;

	@Override
	public String saveFile(File file) {
		return fileDao.saveFile(file);
	}

	@Override
	public Page findByUserId(Map<String, Object> map) {
		return fileDao.findByUserId(map);
	}

	@Override
	public int countById(Map<String, Object> map) {
		return fileDao.countById(map);
	}

}
