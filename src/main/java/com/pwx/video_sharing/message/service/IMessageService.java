package com.pwx.video_sharing.message.service;

public interface IMessageService {

	/**
	 * 
	 * 验证手机号码是否存在
	 * @param loginName
	 * @return
	 */
	public Integer validateLoginNameIsExist(String loginName);
	
	 /**
     * 
     * 发送短信验证码
     * @param cellphone
     * @return
     */
    public String sendSMScode(String cellphone, String content);
}
