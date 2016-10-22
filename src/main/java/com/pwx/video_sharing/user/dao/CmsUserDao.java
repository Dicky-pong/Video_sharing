package com.pwx.video_sharing.user.dao;

import java.util.List;

import com.pwx.video_sharing.common.pagination.Page;
import com.pwx.video_sharing.user.entity.Cms_Users;

/**
 * 
 * <用户接口类>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * tanchao 	1.0  		2016年5月5日 	Created
 *
 * </pre>
 * @since 1.
 */
public interface CmsUserDao {
	/**
	 * 
	 * TODO 查询操作员信息
	 * @param id
	 * @return
	 */
	public Cms_Users queryCms_UsersMessage(String id);

    /**
     * 
     * TODO 新增操作员信息.
     * @param user
     * @return
     * @throws Exception
     */
    String addUser(Cms_Users user) throws Exception;

    /**
     * 
     * TODO 删除操作员信息.
     * @param user
     */
    void delUser(Cms_Users user);
    
    /**
     * 
     * TODO 修改操作员信息.
     * @param user
     */
    void updateUser(Cms_Users user);
    
    /**
     * 
     * TODO 根据操作员登录名查询操作员信息.
     * @param username
     * @return
     */
    Cms_Users findUserByuserName(String username);
    
    /**
     * 
     * TODO 根据操作员手机号查询操作员信息.
     * @param username
     * @return
     */
    Cms_Users findUserByPhone(String phone);
    
    /**
     * 
     * TODO 根据操作员登录名和pass查询操作员信息进行验证.
     * @param username
     * @param password
     * @return
     */
    Cms_Users findUserByuserName(String username,String password);
    
    /**
     * 
     * TODO 根据操作员id.查询操作员信息
     * @param id
     * @return
     */
    Cms_Users findUserById(String id);
    
    /**
     * 
     * TODO 查询操作员信息list.
     * @param page
     * @param pagesize
     * @return
     */
    List<Cms_Users> getPageInfoList(Integer page,Integer pagesize);
    
    /**
     * 
     * TODO 给操作员分配权限.
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
    public Cms_Users findByPhone(String phone);
    /**
     * 根据邮箱查找
     * TODO Add comments here.
     * @param email 邮箱
     * @return
     */
    public Cms_Users findByEmail(String email);
    public Cms_Users findByUserCode(String userCode);
    
    /**
     * 
     * TODO 修改商家信息
     * @param user
     */
    public void updateMerchantMessage(Cms_Users user);
    
    /**
     * 
     * TODO cms用户分页数据组装.
     * @param user
     * @return
     */
    public Page queryCmsUserList(Cms_Users user,Integer pageIndex,Integer pageSize);
    
    /**
     * 
     * TODO cms用户数据总条数.
     * @param user
     * @return
     */
    public Integer queryCmsUserPageSize(Cms_Users user);
    
}
