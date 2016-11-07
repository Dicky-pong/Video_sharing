package com.pwx.video_sharing.message.dao;

import com.pwx.video_sharing.message.entity.MsgChannel;


public interface MessageDao {
	/**
	 * 
	 * 验证手机号码是否存在
	 * @param loginName
	 * @return
	 */
	Integer validateLoginNameIsExist(String loginName);
	
	/**
     * 
     * TODO 根据渠道短信用户名查询渠道信息
     * @param msgUserName 短信用户名
     * @return 渠道信息
     */
    MsgChannel findByMsgUserName(String msgUserName);

}
