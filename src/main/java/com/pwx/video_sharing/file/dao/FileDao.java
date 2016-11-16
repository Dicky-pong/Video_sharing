package com.pwx.video_sharing.file.dao;

import com.pwx.video_sharing.file.entity.File;

public interface FileDao {

	/**
	 * 保存用户上传的文件
	 * @param file
	 * @return
	 */
	public String saveFile(File file);

}
