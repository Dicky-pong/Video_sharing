package com.pwx.video_sharing.file.service;

import java.util.List;
import java.util.Map;

import com.pwx.video_sharing.common.pagination.Page;
import com.pwx.video_sharing.file.entity.File;

public interface IFileService {
	
	/**
	 * 
	 *  保存用户上传的文件
	 * @param wxWifiMessage
	 */
	public String saveFile(File file);

	/**
	 * 查询用户上传的文件
	 * @param map
	 * @return
	 */
	public Page findByUserId(Map<String, Object> map);

	/**
	 * 统计用户上传文件的总数
	 * @param map
	 * @return
	 */
	public int countById(Map<String, Object> map);
}
