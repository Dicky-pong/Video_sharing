package com.pwx.video_sharing.message.service.impl;

import javax.annotation.Resource;

import msg.Message;

import org.springframework.stereotype.Service;

import com.pwx.video_sharing.message.dao.MessageDao;
import com.pwx.video_sharing.message.entity.MsgChannel;
import com.pwx.video_sharing.message.service.IMessageService;


@Service("messageService")
public class MessageServiceImpl implements IMessageService{
	@Resource
	private MessageDao messageDao;
	

	public Integer validateLoginNameIsExist(String loginName) {
		return messageDao.validateLoginNameIsExist(loginName);
	}

	 @Override
    public String sendSMScode(String cellphone, String content) {
    	//发送短信
    	String msgUserName = "yql";
        //根据用户名查询渠道信息
        MsgChannel msgChannel = messageDao.findByMsgUserName(msgUserName);
        String result = Message.sendMsg(cellphone, content+msgChannel.getMsgSign(),
        		msgChannel.getMsgUserName(), msgChannel.getMsgPassword(), msgChannel.getC_url());
        return result;
    }

}
