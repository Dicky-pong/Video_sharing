package com.pwx.video_sharing.message.controller;

import java.text.MessageFormat;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pwx.video_sharing.common.util.MsgJson;
import com.pwx.video_sharing.common.util.SendMessageUtil;
import com.pwx.video_sharing.common.util.tools.JsonUtil;
import com.pwx.video_sharing.message.service.IMessageService;
import com.pwx.video_sharing.message.util.CodeValidateUtil;
import com.pwx.video_sharing.user.service.ICmsUserService;


@Controller
@RequestMapping("/message/")
public class MessageController {
	
    private static Logger logger = Logger.getLogger(MessageController.class);
    
    @Resource
    private IMessageService messageService;
    
    /**
   	 * 
   	 * 获得注册的短信验证码 （此时需要验证手机号码为未注册的）
   	 * @param cellphone
   	 * @return
   	 */
    @ResponseBody
   	@RequestMapping("page/getRegisterSMSCode")
   	public String getRegisterSMSCode(String cellphone,HttpServletRequest request) {
   		MsgJson msg = new MsgJson();
   		if(messageService.validateLoginNameIsExist(cellphone) > 0) {
   			msg.setMsgCode("0");
   			msg.setMsg("手机号码已经存在");
   		}else{
   			String verifyCode = SendMessageUtil.createRandomVcode();
   			String content = "验证码为：{0}（您正在{1}，{2}分钟内有效，请尽快验证）";
   			Object arg[] = new Object[]{verifyCode,"注册账号", 3};
   	    	content = MessageFormat.format(content, arg);
   	    	messageService.sendSMScode(cellphone, content);
   	    	//将短信验证码保存到redis服务器中
   	    	CodeValidateUtil.saveSMSCode(cellphone, verifyCode);
   	    	request.getSession().setAttribute("", "");
   	    	msg.setMsgCode("0");
   	    	System.out.println(verifyCode);
   		}
   		return JsonUtil.toJSONString(msg);
   	}
}
