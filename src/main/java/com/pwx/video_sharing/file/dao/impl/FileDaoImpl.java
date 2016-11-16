package com.pwx.video_sharing.file.dao.impl;

import org.springframework.stereotype.Service;

import com.pwx.video_sharing.common.baseUtil.BaseDao;
import com.pwx.video_sharing.file.dao.FileDao;
import com.pwx.video_sharing.file.entity.File;
@Service
public class FileDaoImpl extends BaseDao implements FileDao {

	@Override
	public String saveFile(File file) {
		return super.add(file);
	}

}
