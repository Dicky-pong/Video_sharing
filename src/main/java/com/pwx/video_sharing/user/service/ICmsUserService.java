package com.pwx.video_sharing.user.service;

import java.util.List;

import com.pwx.video_sharing.common.pagination.Page;
import com.pwx.video_sharing.common.util.MsgJson;
import com.pwx.video_sharing.user.entity.Cms_Users;

/**
 * 
 * <用户信息Service接口>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * tanchao 	1.0  		2016年5月5日 	Created
 *
 * </pre>
 * @since 1.
 */
public interface ICmsUserService {

    
//    @PreAuthorize("hasRole('ADMIN')")  
	
	/**
	 * 
	 * TODO 查询操作员信息
	 * @param id
	 * @return
	 */
	public Cms_Users queryCms_UsersMessage(String id);
	
    /**
     * 
     * TODO 新增操作员
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
     * TODO 设置新密码
     * @param userName
     * @param pw
     * @param pwd
     * @return
     */
    MsgJson setNewPwd(String userName,String pw, String pwd);
    
    /**
     * 
     * TODO 修改用户状态
     * @param user
     * @return
     */
    public void updateCms_Userstate(Cms_Users user, String state);
    
    /**
     * 根据操作员编号查找
     * TODO Add comments here.
     * @param userCode  操作员编号
     * @return
     */
    public Cms_Users findByUserCode(String userCode);
    
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
    
    /**
	 * 
	 * 注册信息
	 * @param users
	 * @return
	 */
	public String register(Cms_Users users) throws Exception;
    
}
