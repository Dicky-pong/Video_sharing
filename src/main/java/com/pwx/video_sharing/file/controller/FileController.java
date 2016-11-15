package com.pwx.video_sharing.file.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.pwx.video_sharing.common.qiniu.MyUploadToken;
import com.pwx.video_sharing.common.util.MsgJson;
import com.pwx.video_sharing.common.util.ResponseUtil;

@Controller
@RequestMapping("/file/")
public class FileController {

	/**
     * 获得上传凭证
     *
     * @param response
     */
	@RequestMapping("getTokenJs")
    public void getUploadTokenJs(HttpServletResponse response) {
        String token = MyUploadToken.getMyUpToken();
        JSONObject obj = new JSONObject();
        obj.put("uptoken", token);
        //System.out.println(obj);
        ResponseUtil.renderJson(response, obj.toString());
    }
    
    //跳转到上传页面
    @RequestMapping("gotoUpload")
    public String gotoUpload() {
        return "layer/file/upload";
    }
}
