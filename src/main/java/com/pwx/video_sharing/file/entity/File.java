package com.pwx.video_sharing.file.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.pwx.video_sharing.user.entity.Cms_Roles;
/**
 * 
 * <文件实体类>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * pengweixiong 	1.0  		2015年6月4日 	Created
 *
 * </pre>
 * @since 1.
 */
@Entity
@Table(name="file")
public class File {
	@Id
    @Column(length = 32)
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;
	
	//用户手机号码
    @Column(name="loginName")
    private String loginName;
    
    //用户名
    @Column(name="nickName")
    private String nickName;

    //头像URL
    @Column(name="headImg")
    private String headImg;
    //密码
    @Column(name="password")
    private String password;
    
    //权限级别  (cascade={CascadeType.ALL},fetch=FetchType.EAGER)
    @ManyToMany(fetch=FetchType.EAGER)
    @JoinTable(name="cms_user_role" , joinColumns = {  
            @JoinColumn(name = "cms_userId")  
    }, inverseJoinColumns = {@JoinColumn(name="cms_roleId")})   
    private List<Cms_Roles> cms_roles = new ArrayList<Cms_Roles>();

    //操作员状态
    @Column(name="state")
    private String state;
    
    //创建时间
    @Column(name="createDate")
    private String createDate;
	
	
}
