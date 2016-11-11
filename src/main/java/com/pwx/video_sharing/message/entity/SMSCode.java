/**
 * Copyright © 2014 Winit Corp. All rights reserved.
 * This software is proprietary to and embodies the confidential
 * technology of Winit Corp.  Possession, use, or copying
 * of this software and media is authorized only pursuant to a
 * valid written license from Winit Corp or an authorized sublicensor.
 */
package com.pwx.video_sharing.message.entity;

import java.io.Serializable;

/**
 * <描述这个类>
 * 短信号码验证对象类
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * bianwc 	1.0  		2016年9月6日 	Created
 *
 * </pre>
 * @since 1.
 */

public class SMSCode implements Serializable {
	
	private static final long serialVersionUID = 4014943293596725371L;

	private String cellphone;
	
	private Long createDate;
	
	private String code;

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public Long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Long createDate) {
		this.createDate = createDate;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public SMSCode() {
		super();
	}

	public SMSCode(String cellphone, Long createDate, String code) {
		super();
		this.cellphone = cellphone;
		this.createDate = createDate;
		this.code = code;
	}
}
