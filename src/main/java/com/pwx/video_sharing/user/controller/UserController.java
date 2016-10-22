package com.pwx.video_sharing.user.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.http.Header;
import org.apache.http.HttpHeaders;
import org.apache.http.entity.ContentType;
import org.apache.http.message.BasicHeader;
import org.apache.log4j.Logger;
import org.hibernate.usertype.UserType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HtmlUtils;

import com.alibaba.fastjson.JSONObject;
import com.pwx.video_sharing.common.redisUtil.RedisUtil;
import com.pwx.video_sharing.common.util.MD5Util;
import com.pwx.video_sharing.common.util.MsgJson;
import com.pwx.video_sharing.common.util.SessionUtil;
import com.pwx.video_sharing.common.util.tools.JsonUtil;
import com.pwx.video_sharing.dictionary.DicSingle;
import com.pwx.video_sharing.user.entity.Users;
import com.pwx.video_sharing.user.service.IUserService;

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
@RequestMapping("/user")
public class UserController {

    private static Logger   logger     = Logger.getLogger(UserController.class);

    protected static Header jsonHeader = new BasicHeader(HttpHeaders.CONTENT_TYPE,
                                           ContentType.APPLICATION_JSON.toString());

    @Resource
    private IUserService    userService;

//    @Resource
//    private ISysNoticeService sysNoticeService;
    

    // 数据字典
    public static DicSingle dic = DicSingle.getInstance();
    
    private RedisUtil redis = RedisUtil.getInstance();

    

    @RequestMapping("/toFindPwd")
    public ModelAndView toForgetPwd(HttpServletRequest request,
                              HttpServletResponse response) throws Exception {
        return new ModelAndView("registered/findPassword");
    }
    
    @RequestMapping("/toModifyUserAddress")
    public ModelAndView toModifyUserAddress(HttpServletRequest request,
                                    HttpServletResponse response) throws Exception {
        String userId = request.getParameter("userId");
        Users user = userService.findUserById(userId);
        request.setAttribute("user", user);
        return new ModelAndView("sysManage/modifyUserAddress");
    }
    

    @RequestMapping("/modifyPwd")
    @ResponseBody
    public String modifyPwd(String oldPwd, String newPwd, HttpServletRequest request, HttpServletResponse response)
                                                                                                                 throws Exception {
        Map<String, Object> jsonMap = new HashMap<String, Object>();
        Users u = userService.findUserByuserName(SessionUtil.getUserName());
        if (null != u) {
            String oPwd = MD5Util.md5Encode(oldPwd);
            if (oPwd.equals(u.getPassword())) {
                String nPwd = MD5Util.md5Encode(newPwd);
                u.setPassword(nPwd);
                userService.updateUser(u);
                jsonMap.put("state", "0");
                
            } else {
                jsonMap.put("state", "2");
            }
        } else {
            jsonMap.put("state", "1");
        }
        return JsonUtil.toJSONString(jsonMap);
    }

    /**
     * 
     * TODO 设置新密码 
     * @param userName
     * @param pw
     * @param pwd
     * @param response
     * @throws IOException
     */
    @RequestMapping("/method/setNewPwd")
    @ResponseBody
    public String setNewPwd(String userName,String pw,String pwd,HttpServletResponse response) throws IOException{
        MsgJson msg = userService.setNewPwd(userName,pw,pwd);
        return JSONObject.toJSONString(msg);
    }

    
    /**
     * 
     * TODO 查询公告信息
     * @param request
     * @throws IOException
     */
//    @RequestMapping("/method/findSysNotice")
//    @ResponseBody
//    public String findSysNotice(HttpServletRequest request) throws IOException{
//        List<SysNotice> list = sysNoticeService.findNewSysNotice();
//        return JSONObject.toJSONString(list);
//    }
    
    /**
     * 
     * TODO 查询所有系统公告信息
     * @param request
     * @return
     */
//    @RequestMapping("/method/findAllSysNotice")
//    @ResponseBody
//    public String findAllSysNotice(HttpServletRequest request,SysNotice sysNotice){
//        String pageIndex = request.getParameter("pageIndex");
//        String pageSize = request.getParameter("pageSize");
//        Page page = sysNoticeService.findAllNotice(sysNotice, null, null, Integer.parseInt(pageIndex), Integer.parseInt(pageSize));
//        return JsonUtil.toJSONString(page);
//    }
    
    /**
     * 
     * TODO 查询所有系统公告信息分页总数
     * @return
     */
//    @RequestMapping("/method/allSysNoticePageSize")
//    @ResponseBody
//    public String allSysNoticePageSize(HttpServletRequest request,SysNotice sysNotice){
//        Integer countPage = sysNoticeService.findAllNoticePageSize(sysNotice, null, null);
//        return countPage.toString();
//    }
    
    /**
     * 
     * TODO 查询公告内容
     * @return
     */
//    @RequestMapping("/method/findSysNoticeContent")
//    @ResponseBody
//    public String findSysNoticeContent(HttpServletRequest request){
//        String sysNoticeId = request.getParameter("sysNoticeId");
//        SysNotice sysNotice = sysNoticeService.findSysNoticeById(sysNoticeId);
//        return JsonUtil.toJSONString(sysNotice);
//    }
    
    
    
    /**
     * 
     * TODO 完善资料第一步
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/method/perfeceUserInfoFirst", method = RequestMethod.POST)
    public String perfeceUserInfoFirst(Users user, HttpServletRequest request) {
    	MsgJson msg = new MsgJson();
    	try {
    		Users users = JsonUtil.parseObject(redis.get(user.getId()), Users.class);
    		if(null == users) {
    			msg.setMsgCode("2");
     			return  JsonUtil.toJSONString(msg);
    		}
    		//没有上传图片
    		if(StringUtils.isBlank(users.getEnterpriseLogo())) {
    			 msg.setMsgCode("2");
    			return  JsonUtil.toJSONString(msg);
    		}
    		users.setWriteStep("2");
			users.setState("1");
			users.setContactCellPhone(user.getContactCellPhone());
			users.setContactPhone(user.getContactPhone());
			users.setLat(user.getLat());
			users.setLng(user.getLng());
			users.setEnterpriseAddressArea(user.getEnterpriseAddressArea());
			users.setEnterpriseAddressCity(user.getEnterpriseAddressCity());
			users.setEnterpriseAddressProvince(user.getEnterpriseAddressProvince());
			users.setEnterpriseAddressDetail(user.getEnterpriseAddressDetail());
			users.setEnterpriseIndustryType(user.getEnterpriseIndustryType());
			users.setNickName(user.getNickName());
    		users.setEnterpriseName(user.getEnterpriseName());
            redis.set(users.getId(), JsonUtil.toJSONString(users));
            msg.setMsgCode("1");
		} catch (Exception e) {
			msg.setMsgCode("0");
		}
    	return JsonUtil.toJSONString(msg);
    }
    
    
    
    /**
     * 
     * TODO 上传图片
     * @return
     * @throws Exception 
     */
    /*@RequestMapping("/method/upLoadUserImg")
    @ResponseBody
    public String upLoadUserImg(@RequestParam(value = "files", required = false) MultipartFile files, HttpServletRequest request){
        MsgJson msg = new MsgJson();
        String userId = request.getParameter("userId");
        Users userInfo = userService.findUserById(userId);
        // 获取用户的图片路径
        String fileNameType = "";
        //最终存储路径
        String picSrc = dic.getText("picPath", "picSrc");
        String picInfoSrc = dic.getText("picPath","info");
        String imgPath = picSrc+"/"+userInfo.getLoginName()+"/"+picInfoSrc;
        // 文件临时标记
        String fileMark = "";
        String imgName = request.getParameter("fileNames");
        
        Users user = JsonUtil.parseObject(redis.get(userId), Users.class);
        try {
            if(files.getSize() > 0 && files != null){
                float imgSize = (float) (Math.round(files.getSize()*100/(1024 * 1024))/100.0);
                if(null == user){
                    user = new Users();
                }
                String fileNameStr = files.getOriginalFilename();
                // 获取图片后缀
                String fileFormat = fileNameStr.substring(fileNameStr.lastIndexOf("."), fileNameStr.length());
                boolean isSuccessImgType = false;
                if(fileFormat.equals(".jpg") || fileFormat.equals(".jpeg") || fileFormat.equals(".png") || fileFormat.equals(".bmp")){
                	isSuccessImgType = true;
                }
                if(!isSuccessImgType) {
                	msg.setState("7");
                    return JsonUtil.toJSONString(msg);
                }
                // 验证图片类型
                if (imgName.equals("NameCardScan")) {
                    if(imgSize > 11.00){
                        msg.setMessage("10M");
                        msg.setState("6");
                        return JsonUtil.toJSONString(msg);
                    }
                    fileNameType = "/NameCardScan" + System.currentTimeMillis();
                    // 存入对应的图片路径到user对象
                    user.setBusinessNameCardScan(dic.getText("picPath", "ShowPicSrc") + userInfo.getLoginName() + "/" + picInfoSrc + fileNameType + fileFormat);
                    fileMark = "NameCardScan";
                } else if (imgName.equals("NameCardScan1")) {
                    if(imgSize > 11.00){
                        msg.setMessage("10M");
                        msg.setState("6");
                        return JsonUtil.toJSONString(msg);
                    }
                    fileNameType = "/NameCardScan1" + System.currentTimeMillis();
                    // 存入对应的图片路径到user对象
                    user.setBusinessNameCardScan1(dic.getText("picPath", "ShowPicSrc") + userInfo.getLoginName() + "/" + picInfoSrc + fileNameType + fileFormat);
                    fileMark = "NameCardScan1";
                } else if (imgName.equals("Logo")) {
                    if(imgSize > 5.00){
                        msg.setMessage("5M");
                        msg.setState("6");
                        return JsonUtil.toJSONString(msg);
                    }
                    fileNameType = "/Logo" + System.currentTimeMillis();
                    // 存入对应的图片路径到user对象
                    user.setEnterpriseLogo(dic.getText("picPath", "ShowPicSrc") + userInfo.getLoginName() + "/" + picInfoSrc + fileNameType + fileFormat);
                    fileMark = "Logo";
                } else if (imgName.equals("BusinessLicense")){
                    if(imgSize > 5.00){
                        msg.setMessage("5M");
                        msg.setState("6");
                        return JsonUtil.toJSONString(msg);
                    }
                    fileNameType = "/BusinessLicense" + System.currentTimeMillis();
                    user.setBusinessLicenseScan(dic.getText("picPath", "ShowPicSrc") + userInfo.getLoginName() + "/" + picInfoSrc + fileNameType + fileFormat);
                    fileMark = "BusinessLicense";
                } else if (imgName.equals("CardId")){
                    if(imgSize > 5.00){
                        msg.setMessage("5M");
                        msg.setState("6");
                        return JsonUtil.toJSONString(msg);
                    }
                    fileNameType = "/CardId" + System.currentTimeMillis();
                    user.setContactCardImgSrc(dic.getText("picPath", "ShowPicSrc") + userInfo.getLoginName() + "/" + picInfoSrc + fileNameType + fileFormat);
                    fileMark = "CardId";
                }else if (imgName.equals("BackCardId")){
                    if(imgSize > 5.00){
                        msg.setMessage("5M");
                        msg.setState("6");
                        return JsonUtil.toJSONString(msg);
                    }
                    fileNameType = "/BackCardId" + System.currentTimeMillis();
                    user.setContactBackCardImgSrc(dic.getText("picPath", "ShowPicSrc") + userInfo.getLoginName() + "/" + picInfoSrc + fileNameType + fileFormat);
                    fileMark = "BackCardId";
                }
                // 存储的文件名和文件格式
                imgPath += fileNameType + fileFormat;
                File targetFile = new File(imgPath);
                if(!targetFile.exists()){
                    targetFile.mkdirs();
                }
                //保存图片
                files.transferTo(targetFile);
                ImageInputStream imagein= ImageIO.createImageInputStream(new File(imgPath));
                BufferedImage bufferedImg = ImageIO.read(imagein);
                int imgWidth = bufferedImg.getWidth();
                int imgHeight = bufferedImg.getHeight();
                // 验证图片尺寸大小
                if("Logo".equals(fileMark)){
                    if(imgWidth > 160 || imgHeight > 100){
                        // 不在规定内删除文件
                        if (targetFile.isFile() && targetFile.exists()) {  
                            targetFile.delete();  
                        } 
                        user.setEnterpriseLogo(null);  
                        msg.setState("1");
                        msg.setMessage("商户Logo图标尺寸不符合规定,请重新上传");
                    }else{
                        msg.setState("0");
                    }
                }
                else if("NameCardScan".equals(fileMark)){
                    if(imgWidth > 290 || imgHeight > 291){
                        // 不在规定内删除文件
                        if (targetFile.isFile() && targetFile.exists()) {  
                            targetFile.delete();  
                        } 
                        user.setBusinessNameCardScan(null);
                        msg.setState("2");
                        msg.setMessage("门脸照片或名片图片1尺寸不符合规定,请重新上传");
                    }else{
                        msg.setState("0");
                    }
                }else if("NameCardScan1".equals(fileMark)){
                    if(imgWidth > 290 || imgHeight > 291){
                        // 不在规定内删除文件
                        if (targetFile.isFile() && targetFile.exists()) {  
                            targetFile.delete();  
                        } 
                        user.setBusinessNameCardScan1(null);
                        msg.setState("3");
                        msg.setMessage("门脸照片或名片图片2尺寸不符合规定,请重新上传");
                    }else{
                        msg.setState("0");
                    }
                }
                if(user.getId() == null){
                    msg.setState("5");
                    msg.setMessage("系统异常,请联系客服人员!");
                    return JsonUtil.toJSONString(msg);
                }
                redis.set(user.getId(), JsonUtil.toJSONString(user));
            }
        } catch (Exception e) {
            msg.setState("4");
            msg.setMessage("系统异常");
        }
        return JsonUtil.toJSONString(msg);
    }*/
    
    
    private static Users formatRedisObj(Users user, Users u){
        user.setId(u.getId());
        user.setCreateDate(u.getCreateDate());
        user.setLoginName(u.getLoginName());
        user.setPassword(u.getPassword());
        user.setState(u.getState());
        user.setAccountType(u.getAccountType());
        user.setAccUUID(u.getAccUUID());
        
        user.setEnterpriseLogo(u.getEnterpriseLogo());
        user.setBusinessNameCardScan(u.getBusinessNameCardScan());
        user.setBusinessNameCardScan1(user.getBusinessNameCardScan1());
        
        user.setContactName(u.getContactName());
        user.setContactEmail(u.getContactEmail());
        user.setContactCardId(u.getContactCardId());
        user.setEnterprisePhone(u.getEnterprisePhone());
        user.setQqNumber(u.getQqNumber());
        user.setBusinessLicense(u.getBusinessLicense());
        user.setVerifyCode(u.getVerifyCode());
        user.setBusinessLicenseScan(u.getBusinessLicenseScan());
        user.setContactCardImgSrc(u.getContactCardImgSrc());
        user.setContactBackCardImgSrc(u.getContactBackCardImgSrc());
        user.setRegistType(u.getRegistType());
        user.setUserCode(u.getUserCode());
        return user;
    }
    
    
    
    
}
