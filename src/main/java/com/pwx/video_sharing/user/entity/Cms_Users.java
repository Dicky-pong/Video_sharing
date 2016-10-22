package com.pwx.video_sharing.user.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
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


/**
 * 
 * <用户实体类>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * tanchao 	1.0  		2015年6月4日 	Created
 *
 * </pre>
 * @since 1.
 */
@Entity
@Table(name="CMS_USERS")
public class Cms_Users implements Serializable {
	
    
    
    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Id
    @Column(length = 32)
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;
    
    //用户名
    @Column(name="loginName")
    private String loginName;
    
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
    
    public String getCreateDate() {
        return createDate;
    }
    
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getId() {
        return id;
    }

    
    public void setId(String id) {
        this.id = id;
    }

    
    public String getLoginName() {
        return loginName;
    }

    
    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    
    public String getPassword() {
        return password;
    }

    
    public void setPassword(String password) {
        this.password = password;
    }

    
    public List<Cms_Roles> getCms_roles() {
        return cms_roles;
    }

    
    public void setCms_roles(List<Cms_Roles> cms_roles) {
        this.cms_roles = cms_roles;
    }

    public String getState() {
        return state;
    }
    
    public void setState(String state) {
        this.state = state;
    }
    
    public Cms_Users(){
        super();
    }


    public Cms_Users(String id, String loginName, String password, List<Cms_Roles> cms_roles, String state){
        super();
        this.id = id;
        this.loginName = loginName;
        this.password = password;
        this.cms_roles = cms_roles;
        this.state = state;
    }


    @Override
    public String toString() {
        return "Cms_Users [id=" + id + ", loginName=" + loginName + ", password=" + password + ", cms_roles="
               + cms_roles + ", state=" + state + "]";
    }

}
