package com.pwx.video_sharing.file.service;

import com.pwx.video_sharing.file.entity.File;

public interface IFileService {
	
	/**
	 * 
	 *  保存用户上传的文件
	 * @param wxWifiMessage
	 */
	public String saveFile(File file);
}
