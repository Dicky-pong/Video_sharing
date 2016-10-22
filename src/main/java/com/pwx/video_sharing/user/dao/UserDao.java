package com.pwx.video_sharing.user.dao;

import java.util.List;

import com.pwx.video_sharing.user.entity.Users;

/**
 * 
 * <用户接口类>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * tanchao 	1.0  		2015年6月4日 	Created
 *
 * </pre>
 * @since 1.
 */
public interface UserDao {
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
     * TODO 根据商户手机号查询商户信息.
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
     * TODO Y账户注册成功后修改ACCUUID
     * @param userId
     * @param accUUID
     * @return
     */
    void updateUserAccUUID(String userId,String accUUID);
    /**
     * 根据手机号去找
     * TODO Add comments here.
     * @param phone   手机号
     * @return
     */
    public Users findByPhone(String phone);
    /**
     * 根据邮箱查找
     * TODO Add comments here.
     * @param email 邮箱
     * @return
     */
    public Users findByEmail(String email);
    public Users findByUserCode(String userCode);
    
    /**
     * 
     * TODO 修改商家信息
     * @param user
     */
    public void updateMerchantMessage(Users user);
    
}
