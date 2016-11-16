package com.pwx.video_sharing.file.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.itextpdf.text.pdf.PdfStructTreeController.returnType;
import com.pwx.video_sharing.common.qiniu.MyUploadToken;
import com.pwx.video_sharing.common.util.MsgJson;
import com.pwx.video_sharing.common.util.ResponseUtil;
import com.pwx.video_sharing.common.util.SessionUtil;
import com.pwx.video_sharing.file.entity.File;
import com.pwx.video_sharing.file.service.IFileService;
import com.pwx.video_sharing.user.entity.Cms_Users;

@Controller
@RequestMapping("/file/")
public class FileController {
	@Resource
	private IFileService fileService;

	/**
     * 获得上传凭证
     *
     * @param response
     */
	@RequestMapping("getTokenJs")
	@ResponseBody
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
    
    /**
     * 新增文件信息
     *
     * @param cloudFile
     * @param response
     */
    @RequestMapping("/addFile")
    @ResponseBody
    public void addFile(File file, HttpServletRequest request) {
    	/*
    	 * 1.用户ID，文件名，文件地址，文件类型（默认video），
    	 * 文件大小，文件描述，文件状态，分享状态，创建时间
    	 * 观看次数，下载次数:存于redis，每晚12点执行定时任务插入数据库
    	 */
    	MsgJson msg = new MsgJson();
    	Cms_Users users = (Cms_Users) request.getSession().getAttribute("CMS_USER_INFO");
    //	file.setUserId(users.getId());
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
    	file.setCreateDate(sdf.format(new Date())+"  "+sdf1.format(new Date()));
        file.setFileState("0");
        fileService.saveFile(file);
        msg.setMsg("保存成功!");
    }
}
