package com.pwx.video_sharing.user.controller;

import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.Header;
import org.apache.http.HttpHeaders;
import org.apache.http.entity.ContentType;
import org.apache.http.message.BasicHeader;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.pwx.video_sharing.common.constant.ErrorCode;
import com.pwx.video_sharing.common.pagination.Page;
import com.pwx.video_sharing.common.redisUtil.RedisUtil;
import com.pwx.video_sharing.common.util.MD5Util;
import com.pwx.video_sharing.common.util.MsgJson;
import com.pwx.video_sharing.common.util.tools.JsonUtil;
import com.pwx.video_sharing.dictionary.DicSingle;
import com.pwx.video_sharing.user.entity.Cms_Users;
import com.pwx.video_sharing.user.service.ICmsUserService;

/**
 * <Change to the actual description of this class>
 * 
 * @version <pre>
 * Author	Version		Date		Changes
 * tanchao 	1.0  		2015年6月4日 	Created
 *
 * </pre>
 * @since 1.
 */

@Controller
@RequestMapping("/cmsuser")
public class CmsUserController {

    private static Logger logger = Logger.getLogger(CmsUserController.class);

    protected static Header jsonHeader = new BasicHeader(HttpHeaders.CONTENT_TYPE,ContentType.APPLICATION_JSON.toString());

    @Resource
    private ICmsUserService cmsUserService;

    // 数据字典
    public static DicSingle dic = DicSingle.getInstance();
    
    private RedisUtil redis = RedisUtil.getInstance();

    @RequestMapping("/addCmsUsers")
    @ResponseBody
    public String addCmsUsers(HttpServletRequest request, HttpServletResponse response,Cms_Users cmsUsers){
        MsgJson msg = new MsgJson();
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            cmsUsers.setCreateDate(format.format(new Date()));
            cmsUsers.setState("0");
            //根据登录用户名查询,判断该用户名是否存在
            Cms_Users tempUser = cmsUserService.findUserByuserName(cmsUsers.getLoginName());
            if(tempUser == null){
                String uuid = cmsUserService.addUser(cmsUsers);
                if(uuid!=null){
                    msg.setMsgCode(ErrorCode.SUCCESS);
                    msg.setMsg(ErrorCode.SUCCESS_EXPLAIN);
                }
            }else{
                msg.setMsgCode(ErrorCode.LOGIN_EXIST);
                msg.setMsg(ErrorCode.LOGIN_EXIST_EXPLAIN);
            }
        } catch (Exception e) {
            msg.setMsgCode(ErrorCode.SYETEM_ERROR);
            msg.setMsg(ErrorCode.SYETEM_ERROR_EXPLAIN);
        }
        return JsonUtil.toJSONString(msg);
    }
    
    @RequestMapping("/editCmsUsers")
    @ResponseBody
    public String editCmsUsers(HttpServletRequest request, HttpServletResponse response,Cms_Users cmsUsers){
        MsgJson msg = new MsgJson();
        try {
            
            Cms_Users users = cmsUserService.findUserById(cmsUsers.getId());
            users.setPassword(cmsUsers.getPassword());
            cmsUserService.updateUser(users);
            msg.setMsgCode(ErrorCode.SUCCESS);
            msg.setMsg(ErrorCode.SUCCESS_EXPLAIN);
        } catch (Exception e) {
            msg.setMsgCode(ErrorCode.SYETEM_ERROR);
            msg.setMsg(ErrorCode.SYETEM_ERROR_EXPLAIN);
        }
        return JsonUtil.toJSONString(msg);
    }
    
    @RequestMapping("/delCmsUsers")
    @ResponseBody
    public String delCmsUsers(HttpServletRequest request, HttpServletResponse response,Cms_Users cmsUsers){
        MsgJson msg = new MsgJson();
        try {
            Cms_Users users = cmsUserService.findUserById(cmsUsers.getId());
            cmsUserService.delUser(users);
            msg.setMsgCode(ErrorCode.SUCCESS);
            msg.setMsg(ErrorCode.SUCCESS_EXPLAIN);
        } catch (Exception e) {
            msg.setMsgCode(ErrorCode.SYETEM_ERROR);
            msg.setMsg(ErrorCode.SYETEM_ERROR_EXPLAIN);
        }
        return JsonUtil.toJSONString(msg);
    }
    
    @RequestMapping("/queryCmsUserList")
    @ResponseBody
    public String findUserInfo(HttpServletRequest request,HttpServletResponse response,Cms_Users cmsUsers){
       
        Integer pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        Integer pageSize = Integer.parseInt(request.getParameter("pageSize"));
        
        Page page = cmsUserService.queryCmsUserList(cmsUsers,pageIndex,pageSize);
        return JSONObject.toJSONString(page);
    }
    
    @RequestMapping("/queryCmsUserPageSize")
    @ResponseBody
    public String usersPageSize(HttpServletRequest request, HttpServletResponse response,Cms_Users cmsUsers){
        
        Integer CountNum = cmsUserService.queryCmsUserPageSize(cmsUsers);
        
        return CountNum.toString();
    }
    public static void main(String[] args) throws Exception {
        System.out.println(MD5Util.md5Encode("admin0506"));
    }
    
   
    
}
