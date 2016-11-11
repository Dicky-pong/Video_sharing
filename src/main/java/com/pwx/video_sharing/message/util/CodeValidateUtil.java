/**
 * Copyright © 2014 Winit Corp. All rights reserved.
 * This software is proprietary to and embodies the confidential
 * technology of Winit Corp.  Possession, use, or copying
 * of this software and media is authorized only pursuant to a
 * valid written license from Winit Corp or an authorized sublicensor.
 */
package com.pwx.video_sharing.message.util;

import org.apache.commons.lang.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.pwx.video_sharing.common.redisUtil.RedisUtil;
import com.pwx.video_sharing.common.util.tools.JsonUtil;
import com.pwx.video_sharing.message.entity.SMSCode;

/**
 * <描述这个类>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * bianwc 	1.0  		2016年9月6日 	Created
 *
 * </pre>
 * @since 1.
 */

public class CodeValidateUtil {
	
	private static RedisUtil redis = RedisUtil.getInstance();
	
	private static final String SMSCODEPREFIX = "SMSCODE";
	
	private static final String EMAILCODEPREFIX = "EMAILCODEPREFIX";
	
	private static long timeout = 1800000;
	
	private static long emailTimeOut = 1800000;
	
	/**
	 * 
	 * 验证短信验证码
	 * @param cellphone
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public static boolean validateSMSCode(String cellphone, String code) throws Exception {
		if(StringUtils.isBlank(cellphone)) {
			return false;
		}else if(StringUtils.isBlank(code)) {
			return false;
		}
		long time = System.currentTimeMillis();
		SMSCode smsCode = getSMSCode(cellphone);
		
		if(null == smsCode || (time - smsCode.getCreateDate() > timeout) || !code.equals(smsCode.getCode())) {
			return false;
		}
		return true;
	}
	
	/**
	 * 
	 * 删除短信code
	 * @param cellphone
	 */
	public static void delSMSCode(String cellphone) {
		redis.hdel(SMSCODEPREFIX, cellphone);
	}
	
	/**
	 * 
	 * 保存短信验证码
	 * @param cellphone
	 * @param code
	 */
	public static void saveSMSCode(String cellphone, String code) {
		SMSCode smsCode = new SMSCode(cellphone, System.currentTimeMillis(), code);
		redis.hset(SMSCODEPREFIX, cellphone, JsonUtil.toJSONString(smsCode));
	}
	
	private static SMSCode getSMSCode(String cellphone) {
		String jsonStr = redis.hget(SMSCODEPREFIX, cellphone);
		if(null == jsonStr) {
			return null;
		}
		return JSONObject.parseObject(jsonStr, SMSCode.class);
	}
	
	/**
	 * 
	 * 保存邮箱验证码
	 * @param email
	 * @param code
	 */
	public static void saveEmailCode(String email, String code) {
		SMSCode smsCode = new SMSCode(email, System.currentTimeMillis(), code);
		redis.hset(EMAILCODEPREFIX, email, JsonUtil.toJSONString(smsCode));
	}
	
	/**
	 * 
	 * 验证邮箱验证码
	 * @param email
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public static boolean validateEmailCode(String email, String code) throws Exception {
		if(StringUtils.isBlank(email)) {
			return false;
		}else if(StringUtils.isBlank(code)) {
			return false;
		}
		long time = System.currentTimeMillis();
		String jsonStr = redis.hget(EMAILCODEPREFIX, email);
		if(null == jsonStr) {
			return false;
		}
		SMSCode smsCode = JSONObject.parseObject(jsonStr, SMSCode.class);
		
		if(null == smsCode || (time - smsCode.getCreateDate() > emailTimeOut) || !code.equals(smsCode.getCode())) {
			return false;
		}
		return true;
	}
	
	/**
	 * 
	 * 删除邮箱验证码
	 * @param email
	 */
	public static void delEmailCode(String email) {
		redis.hdel(EMAILCODEPREFIX, email);
	}
}
