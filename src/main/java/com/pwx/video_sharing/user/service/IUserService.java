package com.pwx.video_sharing.user.service;

import java.util.List;
import java.util.Map;

import com.pwx.video_sharing.common.util.MsgJson;
import com.pwx.video_sharing.user.entity.Users;

/**
 * 
 * <用户信息Service接口>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * tanchao 	1.0  		2015年6月4日 	Created
 *
 * </pre>
 * @since 1.
 */
public interface IUserService {

    
//    @PreAuthorize("hasRole('ADMIN')")  
	
	/**
	 * 
	 * TODO 查询用户信息
	 * @param id
	 * @return
	 */
	public Users queryUsersMessage(String id);
	
    /**
     * 
     * TODO 新增商户信息.
     * @param user
     * @return
     * @throws Exception
     */
    String addUser(Users user) throws Exception;

    /**
     * 
     * TODO 删除商户信息.
     * @param user
     */
    void delUser(Users user);
    
    /**
     * 
     * TODO 修改商户信息.
     * @param user
     */
    void updateUser(Users user);
    
    /**
     * 
     * TODO 根据商户登录名查询商户信息.
     * @param username
     * @return
     */
    Users findUserByuserName(String username);
    
    /**
     * 
     * TODO 根据商户登录名查询商户信息.
     * @param username
     * @return
     */
    Users findUserByPhone(String phone);
    
    /**
     * 
     * TODO 根据商户登录名和pass查询商户信息进行验证.
     * @param username
     * @param password
     * @return
     */
    Users findUserByuserName(String username,String password);
    
    /**
     * 
     * TODO 根据商户id.查询商户信息
     * @param id
     * @return
     */
    Users findUserById(String id);
    
    /**
     * 
     * TODO 查询商户信息list.
     * @param page
     * @param pagesize
     * @return
     */
    List<Users> getPageInfoList(Integer page,Integer pagesize);
    
    /**
     * 
     * TODO 给商户分配权限.
     * @param userid
     * @param roleid
     */
    String addUserRole(String userid,int roleid);
    
    /**
     * 
     * TODO 发送激活邮件
     * @param user
     * @return
     */
    String toSendEmail(Users user,String sendType, String verifyCode);
    
    /**
     * 
     * TODO 激活帐户
     * @param email
     * @return
     */
    Map<String,String> activateEmail(String email);
    
    /**
     * 
     * TODO 注册Y账户
     * @param UUID
     * @param phone
     * @param loginPwd
     * @param email
     * @return
     */
    String yAccount(String UUID,String phone,String email);
    
    /**
     * 
     * TODO 保存图片
     * @return
     */
    Map<String,Object> setRegImage(String email,String fileNameStr,Users user);
    
    /**
     * 
     * TODO Y账户注册成功后修改ACCUUID
     * @param userId
     * @param accUUID
     * @return
     */
    void updateUserAccUUID(String userId,String accUUID);
    
    /**
     * 
     * TODO 设置新密码
     * @param userName
     * @param pw
     * @param pwd
     * @return
     */
    MsgJson setNewPwd(String userName,String pw, String pwd);
    
    /**
     * 
     * TODO 验证码验证
     * @param validateC
     * @param veryCode
     * @return
     */
    String verifyCodeIsTrue(String validateC, String veryCode);
    
    /**
     * 
     * TODO 记录短信
     * @param mobile
     * @param operType
     * @param verifyCodeValidity
     * @param sendType
     * @return
     */
    String msgInfo(String mobile, String operType,String verifyCodeValidity,String sendType);
    
    /**
     * 
     * TODO 完善资料
     * @param files
     * @param user
     * @return
     */
    MsgJson perfectInfo(Users user, String operStep);
    /**
     * 同步用户信息 来源运营平台  接口
     * TODO Add comments here.
     * @param argMap
     * @return
     */
    public MsgJson updateOpeUser(Map<String,String> argMap) throws Exception;
    public MsgJson findUserId(Map<String,String> argMap) throws Exception;
    
    /**
     * 
     * TODO 修改用户状态
     * @param user
     * @return
     */
    public void updateUserState(Users user, String state);
    
    /**
     * 根据商户编号查找
     * TODO Add comments here.
     * @param userCode  商户编号
     * @return
     */
    public Users findByUserCode(String userCode);
    
    /**
     * 
     * TODO 修改商家信息
     * @param user
     */
    public void updateMerchantMessage(Users user);
}
