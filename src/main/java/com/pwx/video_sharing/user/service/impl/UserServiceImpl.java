package com.pwx.video_sharing.user.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pwx.video_sharing.common.constant.SystemConfiguration;
import com.pwx.video_sharing.common.redisUtil.RedisUtil;
import com.pwx.video_sharing.common.util.MsgJson;
import com.pwx.video_sharing.common.util.SendEmail;
import com.pwx.video_sharing.common.util.SendMessageUtil;
import com.pwx.video_sharing.common.util.SessionUtil;
import com.pwx.video_sharing.common.util.tools.JsonUtil;
import com.pwx.video_sharing.dictionary.DicSingle;
import com.pwx.video_sharing.user.dao.UserDao;
import com.pwx.video_sharing.user.entity.Users;
import com.pwx.video_sharing.user.service.IUserService;


/**
 * <用户实现接口Service>
 * 
 * @version <pre>
 * Author	Version		Date		Changes
 * tanchao 	1.0  		2015年6月4日 	Created
 *
 * </pre>
 * @since 1.
 */
@Service("userService")
public class UserServiceImpl implements IUserService {

    private final static String key = "12345678";
    SimpleDateFormat            sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Resource
    private UserDao userDao;
    
    // 数据字典
    public static DicSingle dic = DicSingle.getInstance();
    //
    private String emailUrl = SystemConfiguration.OFFICIAL_WEBSITE;
    
    private RedisUtil redis = RedisUtil.getInstance();
    
    private static final String MAIL_VERIFYCODE = "mail_verifyCode";

    
    private static Logger logger = Logger.getLogger(UserServiceImpl.class);
    
    @Transactional(rollbackFor = RuntimeException.class)
    public String addUser(Users user) throws Exception {
        String pKey = userDao.addUser(user);
        if (pKey != null && !"".equals(pKey)) {
            userDao.addUserRole(pKey, 3);
        }
        return pKey;
    }

    public void delUser(Users user) {
        userDao.delUser(user);
    }

    public Users findUserByuserName(String username, String password) {
        return userDao.findUserByuserName(username, password);
    }
    
	public Users queryUsersMessage(String id) {
		return userDao.queryUsersMessage(id);
	}

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateUser(Users user) {
        userDao.updateUser(user);
    }

    @Override
    public List<Users> getPageInfoList(Integer page, Integer pagesize) {

        return userDao.getPageInfoList(page, pagesize);
    }

    @Override
    public Users findUserById(String id) {
        return userDao.findUserById(id);
    }

    @Override
    public String addUserRole(String userid, int roleid) {
        try {
            String pKey = userDao.addUserRole(userid, roleid);
            if(null != pKey && !"".equals(pKey)){
                return pKey;
            }else{
                return "1";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "9";
        }

    }

    @Override
    public Users findUserByuserName(String username) {
        return userDao.findUserByuserName(username);
    }

    /**
     * 发送激活邮箱 1:失败 2:用户已存在
     */
    @SuppressWarnings("static-access")
    @Override
    public String toSendEmail(Users user,String sendType, String verifyCode) {
        String emailContent = "";
        String emailTitle = "";
        // 初始化邮箱
        SendEmail sendEmail = new SendEmail(false);
        
        // 查找用户是否存在
        Users u = findUserByuserName(user.getLoginName());
        if("1".equals(sendType)){   //查找密码
            if (u != null) {
                try {
                    emailTitle = "亿企联账号密码找回";
                    emailContent = setFindPwdContent(u.getContactName(), u.getLoginName(),verifyCode);
                } catch (Exception e) {
                    e.printStackTrace();
                    return "3";
                }
            }else{
                return "4";
            }
        }else if("2".equals(sendType)){ //注册
        	/*if (u == null) {
                // 编辑短信并发送
                MsgSend msgSend = null;
                String result = "";
                String saveMsg = msgInfo(user.getLoginName(), "1", "60","1");
                try {
                    // 发送成功
                    if("0".equals(saveMsg)){
                        // 查询短信信息,查询验证码
                        msgSend = msgSendService.findMsgSend(user.getLoginName(), "1");
                        String mailVerifyCode = redis.get(MAIL_VERIFYCODE + user.getLoginName());
                        emailTitle = "激活你的亿企联帐号";
                        emailContent = setFindPwdContent(user.getLoginName(), user.getLoginName(), mailVerifyCode);
                        redis.del(MAIL_VERIFYCODE + user.getLoginName());
                    }else{
                        result = saveMsg;
                        return result;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    return "9";
                }
            } else {
                return "10";
            }*/
        }
        // 发送激活账户邮箱 返回结果 0:成功 1:失败
        String sendResult = sendEmail.doSendHtmlEmail(emailTitle, emailContent, user.getLoginName(), null);
        if("1".equals(sendResult))
            return "11";
        else
            return sendResult;
    }
    
    private static String setRegContent(String loginName, String encryptHtml,String emailUrl){
        // 组装邮件的内容
        StringBuffer sb = new StringBuffer();
        sb.append("你好!<p>感谢你注册亿企联账户</br>你的登录邮箱为：" + loginName + "。");
        sb.append("请点击一下链接激活帐号：<p>");
        sb.append("<a href=\"http://"+emailUrl+"/business_union/reg/method/activateEmail.do?email=");
        sb.append(encryptHtml);
        sb.append("\">http://"+emailUrl+"/business_union/reg/method/activateEmail.do?email=");
        sb.append(encryptHtml);
        sb.append("</a></br>");
        sb.append("如果以上链接无法点击，请将上面的地址复制到你的浏览器(如IE)的地址栏进入亿企联。 （该链接在48小时内有效，48小时后需要重新注册）</br>");
        return sb.toString();
    }
    
    private static String setFindPwdContent(String userName, String loginName, String verifyCode){
        // 组装邮件的内容
        StringBuffer sb = new StringBuffer();
        String name = "";
        if(StringUtils.isNotBlank(userName)) {
        	name = userName;
        }else{
        	name = loginName;
        }
        sb.append("亲爱的 "+name+",您好!<p>感谢您使用亿企联平台，您正在进行邮箱验证，本次验证码为：<br>" + verifyCode + " (为了保障您的账号安全性，请在1小时内完成验证。)");
        sb.append("<p>亿企联平台");
        return sb.toString();
    }

    /**
     * 验证激活地址
     */
    @Override
    public Map<String, String> activateEmail(String email) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Map<String, String> msg = new HashMap<String, String>();
        String pKey = "";
        if (null != email && !"".equals(email)) {
            try {
                SendEmail sendEmail = new SendEmail(false);
                // 16进制转2进制
                byte[] encrytByte = sendEmail.parseHexStr2Byte(email);
                // 解密
                String result = "email=" + sendEmail.deCrypt(encrytByte, key) + " ";
                if (!"".equals(result) && null != result) {
                    // 获取参数
                    Map<String, Object> map = urlSplit(result);
                    String loginName = String.valueOf(map.get("email"));
                    String password = String.valueOf(map.get("password"));
                    String sendDate = String.valueOf(map.get("sendDate"));
                    // 比较天数,超过24小时判断地址失效
                    Long date = SendMessageUtil.getDateDay(new Date(), sdf.parse(sendDate));
                    if (date >= 2) {
                        msg.put("state", "8");
                        msg.put("message", "已过期,请重新注册");
                    } else {
                        // 账户注册
                        Users u = findUserByuserName(loginName);
                        if (null == u) {
                            Users user = new Users();
                            user.setLoginName(loginName);
                            user.setPassword(password);
                            user.setState("3");
                            user.setEnterpriseIndustryType("0");
                            // 执行数据入库操作.
                            pKey = addUser(user);
                            if (pKey != null && !"".equals(pKey)) {
                                String picSrc = dic.getText("picPath", "picSrc") + "/" + user.getLoginName();
                                String infosFile = dic.getText("picPath", "info");
                                String couponsFile = dic.getText("picPath", "coupons");
                                File targetFile = new File(picSrc, infosFile);
                                if (!targetFile.exists()) {
                                    targetFile.mkdirs();
                                }
                                targetFile = new File(picSrc, couponsFile);
                                if (!targetFile.exists()) {
                                    targetFile.mkdirs();
                                }
                                msg.put("state", "0");
                                msg.put("message", pKey);
                            } else {
                                msg.put("state", "2");
                                msg.put("message", "激活成功,注册失败");
                            }
                        } else {
                            msg.put("state", "3");
                            msg.put("message", loginName);
                        }

                    }
                } else {
                    msg.put("state", "4");
                    msg.put("message", "地址有误,请重新获取");
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                msg.put("state", "5");
                msg.put("message", "系统异常,请稍后再试");
            }
        } else {
            msg.put("state", "6");
            msg.put("message", "地址有误,请重新获取");
        }
        return msg;
    }

    private Map<String, Object> urlSplit(String data) {
        StringBuffer strbuf = new StringBuffer();
        StringBuffer strbuf2 = new StringBuffer();
        Map<String, Object> map = new HashMap<String, Object>();
        for (int i = 0; i < data.length(); i++) {

            if (data.substring(i, i + 1).equals("=")) {

                for (int n = i + 1; n <= data.length(); n++) {
                    if (data.substring(n, n + 1).equals("&") || n == data.length() - 1) {
                        map.put(strbuf.toString(), strbuf2);
                        strbuf = new StringBuffer("");
                        strbuf2 = new StringBuffer("");
                        i = n;
                        break;
                    }
                    strbuf2.append(data.substring(n, n + 1));
                }
                continue;
            }
            strbuf.append(data.substring(i, i + 1));
        }

        return map;
    }

    @Override
    public Map<String, Object> setRegImage(String email, String fileNameStr, Users user) {

        // 获取用户的图片路径
        String fileNameType = "";
        String picSrc = dic.getText("picPath", "picSrc");
        String picInfoSrc = dic.getText("picPath", "info");
        // 最终存储路径
        String path = picSrc + "/" + email + "/" + picInfoSrc;
        // 获取图片后缀
        String fileFormat = fileNameStr.substring(fileNameStr.lastIndexOf("."), fileNameStr.length());
        // 验证图片类型
        if (fileNameStr.equals(user.getBusinessLicenseScan())) {
            fileNameType = "/BusinessLicense" + System.currentTimeMillis();
            // 存入对应的图片路径到user对象
            user.setBusinessLicenseScan(email + "/" + picInfoSrc + fileNameType + fileFormat);
        } else if (fileNameStr.equals(user.getContactCardImgSrc())) {
            fileNameType = "/CardId" + System.currentTimeMillis();
            // 存入对应的图片路径到user对象
            user.setContactCardImgSrc(email + "/" + picInfoSrc + fileNameType + fileFormat);
        } else if (fileNameStr.equals(user.getEnterpriseLogo())) {
            fileNameType = "/Logo" + System.currentTimeMillis();
            // 存入对应的图片路径到user对象
            user.setEnterpriseLogo(email + "/" + picInfoSrc + fileNameType + fileFormat);
        }
        // 存储的文件名和文件格式
        String fileName = fileNameType + fileFormat;
        //返回
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("path", path);
        map.put("fileName", fileName);
        map.put("user", user);
        return map;
    }

    @Override
    public void updateUserAccUUID(String userId, String accUUID) {
        userDao.updateUserAccUUID(userId, accUUID);
    }
    

    @Override
    public Users findUserByPhone(String phone) {
        return userDao.findUserByPhone(phone);
    }
    
    @Override
    @Transactional
    public String verifyCodeIsTrue(String validateC,String veryCode){
        //验证码生成时 存放的session -->validateCode
        validateC = validateC.toUpperCase();
        if(veryCode != null)
            veryCode = veryCode.toUpperCase();
        
        if(veryCode==null||"".equals(veryCode)){
            return "1";
        }else{    
            if(validateC.equals(veryCode)){
                return "0";
            }else{
                return "2";
            }
        }
    }
    

    
    
    @Override
    public void updateUserState(Users user, String state) {
    	user = findUserByuserName(SessionUtil.getUserName());
    	user.setState(state);
    	updateUser(user);
    }
    
    
    private Users formatUser(Users user, Users u, String operStep){
        Users us = JsonUtil.parseObject(redis.get(u.getId()), Users.class);
        if(null != us){
            if("1".equals(operStep)){
                /*us.setId(u.getId());
                us.setCreateDate(u.getCreateDate());
                us.setLoginName(u.getLoginName());
                us.setPassword(u.getPassword());
                us.setState(u.getState());*/
                us.setWriteStep("3");
            }else if("2".equals(operStep)){
                if(null == us.getEnterpriseInfoDetail() || !"".equals(us.getEnterpriseInfoDetail()))
                    us.setEnterpriseInfoDetail(user.getEnterpriseInfoDetail());
                us.setWriteStep("3");
            }else if("3".equals(operStep)){
                /*us.setContactEmail(user.getContactName());
                us.setContactCardId(user.getContactName());
                us.setEnterprisePhone(user.getContactName());
                us.setQqNumber(user.getContactName());
                us.setBusinessLicense(user.getContactName());*/
                us.setWriteStep("4");
            }
        }
        return us;
    }
    @Override
    @Transactional
    public MsgJson updateOpeUser(Map<String, String> argMap) throws Exception{
        MsgJson mj=new MsgJson();
        String loginName=argMap.get("loginName");
        String accUUID=argMap.get("accUUID");
        String registType=argMap.get("registType");
        String enterpriseAddressDetail=argMap.get("enterpriseAddressDetail");
        String enterpriseLogo=argMap.get("enterpriseLogo");
        String enterpriseName=argMap.get("enterpriseName");
        String enterpriseAddressCity=argMap.get("enterpriseAddressCity");
        String enterpriseAddressArea=argMap.get("enterpriseAddressArea");
        String contactCardId=argMap.get("contactCardId");
        String contactCardImgSrc=argMap.get("contactCardImgSrc");
        String legalName=argMap.get("legalName");
        String businessLicense=argMap.get("businessLicense");
        String businessLicenseScan=argMap.get("businessLicenseScan");
        String nickName=argMap.get("nickName");
        String enterpriseJGH =argMap.get("enterpriseJGH");
        String password=argMap.get("password");
        String userCode=argMap.get("userCode");
        String contactEmail=argMap.get("contactEmail");
        String contactName=argMap.get("contactName");
        String enterprisePhone=argMap.get("enterprisePhone");
        String enterpriseAddressProvince=argMap.get("enterpriseAddressProvince");
        String remark=argMap.get("remark");
        String createDate=argMap.get("createDate");
        String enterpriseIndustryType=argMap.get("enterpriseIndustryType");
        String verifyState=argMap.get("verifyState");
        String accountType=argMap.get("accountType");
        String writeStep=argMap.get("writeStep");
        String contactBackCardImgSrc=argMap.get("contactBackCardImgSrc");
        //运营用户状态转化为亿企联状态
        String userState="";
        if(verifyState.equals("0")){//审核通过
            userState="0";
        }
        if(verifyState.equals("2")){//待审核
            userState="3";
        }
        if(verifyState.equals("3")){//审核不通过
            userState="4";
        }
        Users u=null;
        //根据商户编号判断是做更新还是做保存
         u=findByUserCode(userCode); 
        if(u!=null){//存在只更新 状态
            u.setState(userState);
            if(!StringUtils.isEmpty(accUUID)){
                u.setAccUUID(accUUID);
            }  
            u.setRemark(remark);
            userDao.updateUser(u);
            mj.setMsg("同步成功");
            mj.setMsgCode("success");
            return mj;
        }else{//不存在做保存
            //判断用户名是否存在
            u=findUserByuserName(loginName);
            if(u!=null){
                mj.setMsg("登录名已经存在");
                mj.setMsgCode("fail");
                return mj;
            }
            //判断手机号是否存在
            u=findByPhone(enterprisePhone);
            if(u!=null){
                mj.setMsg("手机号已经存在");
                mj.setMsgCode("fail");
                return mj;
            }
            //判断邮箱是否存在
            u=findByEmail(contactEmail);
            if(u!=null){
                mj.setMsg("邮箱已经存在");
                mj.setMsgCode("fail");
                return mj;
            }
            u=new Users();
            u.setAccUUID(accUUID);
            u.setAccountType(accountType);
            u.setBusinessLicense(businessLicense);
            u.setBusinessLicenseScan(businessLicenseScan);
            u.setContactCardId(contactCardId);
            u.setContactCardImgSrc(contactCardImgSrc);
            u.setContactEmail(contactEmail);
            u.setContactName(contactName);
            u.setContactPhone(enterprisePhone);
            u.setCreateDate(createDate);
            u.setEnterpriseAddressArea(enterpriseAddressArea);
            u.setEnterpriseAddressCity(enterpriseAddressCity);
            u.setEnterpriseAddressDetail(enterpriseAddressDetail);
            u.setEnterpriseAddressProvince(enterpriseAddressProvince);
            u.setEnterpriseIndustryType(enterpriseIndustryType);
            u.setEnterpriseJGH(enterpriseJGH);
            u.setEnterpriseLogo(enterpriseLogo);
            u.setEnterpriseName(enterpriseName);
            u.setEnterprisePhone(enterprisePhone);
            u.setUserCode(userCode);
            u.setLoginName(loginName);
            u.setPassword(password);
            u.setRegistType(registType);
            u.setState(userState);
            u.setNickName(nickName);
            u.setRemark(remark);
            u.setWriteStep(writeStep);
            u.setContactBackCardImgSrc(contactBackCardImgSrc);
            String userId=userDao.addUser(u);
            if(userState.equals("0")) {
            	userDao.addUserRole(userId, 2);
            }
            userDao.addUserRole(userId, 3);
//            mj.setUserId(userId);
            mj.setMsg("同步成功");
            mj.setMsgCode("success");
            return mj;
        }        
    }
    
    @Override
    public MsgJson findUserId(Map<String, String> argMap) throws Exception {
        MsgJson mj=new MsgJson();
        String userCode=argMap.get("userCode");
        Users u=findByUserCode(userCode); 
//        mj.setUserId(u.getId());    
        mj.setMsg("同步成功");
        mj.setMsgCode("success");
        return mj;
              
    }

    /**
     * 根据手机号去找
     * TODO Add comments here.
     * @param phone   手机号
     * @return
     */
    public Users findByPhone(String phone){
        return userDao.findByPhone(phone);
    }
    /**
     * 根据邮箱去找
     * TODO Add comments here.
     * @param email   邮箱
     * @return
     */
    public Users findByEmail(String email){
        return userDao.findByEmail(email);
    }

    @Override
    public Users findByUserCode(String userCode) {
        return userDao.findByUserCode(userCode);
    }
    
    
    @Override
    public void updateMerchantMessage(Users user) {
    	userDao.updateMerchantMessage(user);
    }

    @Override
    public String yAccount(String UUID, String phone, String email) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public MsgJson setNewPwd(String userName, String pw, String pwd) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public String msgInfo(String mobile, String operType, String verifyCodeValidity, String sendType) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public MsgJson perfectInfo(Users user, String operStep) {
        // TODO Auto-generated method stub
        return null;
    }
}
