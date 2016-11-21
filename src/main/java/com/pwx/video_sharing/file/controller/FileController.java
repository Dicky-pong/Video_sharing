package com.pwx.video_sharing.file.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.pwx.video_sharing.common.pagination.Page;
import com.pwx.video_sharing.common.qiniu.ConfigToken;
import com.pwx.video_sharing.common.qiniu.MyUploadToken;
import com.pwx.video_sharing.common.util.MsgJson;
import com.pwx.video_sharing.common.util.ResponseUtil;
import com.pwx.video_sharing.common.util.tools.JsonUtil;
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
    @RequestMapping("addFile")
    @ResponseBody
    public String addFile(File file, HttpServletRequest request) {
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
        String pkey =fileService.saveFile(file);
        if(pkey!=null){
        	msg.setMsg("保存成功!");
        }else{
        	msg.setMsg("保存失败！");
        }
        return JsonUtil.toJSONString(msg);
    }
    
    /**
     * 跳转至我的上传文件
     * @param page
     * @param cloudFile
     * @param session
     * @return
     */
    @RequestMapping("listMyFile")
    public ModelAndView listMyFile() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("gallery");
        return mav;
    }
    
    /**
     * 展示我上传的视频
     * @param page
     * @param cloudFile
     * @param session
     * @return
     */
    @RequestMapping("ajaxMyFile")
    @ResponseBody
    public String ajax_myFile(Integer pageIndex, Integer pageSize,boolean isQueryList,
         File file, HttpSession session) {
			Page page = new Page();
			 String fileName = file.getFileName();
		     String fileState = file.getFileState();
		     Map<String, Object> map = new HashMap<String, Object>(); // 使用Map传值到mapper处理
		     map.put("start",pageIndex ); // 起始记录
		     map.put("size", pageSize);
		     map.put("fileName", fileName);
		     map.put("fileState", fileState);
		     map.put("user_id", "1");
		if(isQueryList) {
		    Cms_Users user = (Cms_Users) session.getAttribute("CMS_USER_INFO");
		    page = (Page)fileService.findByUserId(map);
		    //查询数据库并加入视频帧地址
		    List<File> cloudFileList = MyUploadToken.getVframes((List<File>)page.getData());
		}
		    int total = fileService.countById(map);   //查询记录总数
		    page.setPageCount(total);
		    page.setPageSize(pageSize);
		    return JsonUtil.toJSONString(page);
		}
    
    /**
     * 获得七牛云文件下载URL
     *
     * @param key
     * @param response
     */
    @RequestMapping("/getDownloadUrl")
    public void getDownloadUrl( HttpServletResponse response) {
    	String key = "o_1b22dp4lr1l7154g1h8bdrsc3r9.mp4" ;
    	MsgJson msg = new MsgJson();
        ConfigToken ct = new ConfigToken();
        //System.out.println(key);
        String downloadUrl = ct.getDownloadToken(key);
        JSONObject obj = new JSONObject();
        obj.put("downloadUrl", downloadUrl);
        ResponseUtil.renderJson(response, obj.toString());
        
    }
}
