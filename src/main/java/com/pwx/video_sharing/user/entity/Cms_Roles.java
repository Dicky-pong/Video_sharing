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
 * <用户角色类>
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
@Table(name="CMS_ROLES")
public class Cms_Roles implements Serializable {

	
	/**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    @Column(name = "id") 
    private int id;
    
    @Column(name="roleCode")
    private String roleCode ;
    
    @Column(name="despripe")
    private String despripe ;
    
    @ManyToMany(fetch=FetchType.EAGER)
    @JoinTable(name="cms_user_role" , joinColumns = {  
            @JoinColumn(name = "cms_roleId")  
    }, inverseJoinColumns = {@JoinColumn(name="cms_userId")})   
	private List<Cms_Users> users = new ArrayList<Cms_Users>();

    
    public int getId() {
        return id;
    }

    
    public void setId(int id) {
        this.id = id;
    }

    
    public String getRoleCode() {
        return roleCode;
    }

    
    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    
    public String getDespripe() {
        return despripe;
    }

    
    public void setDespripe(String despripe) {
        this.despripe = despripe;
    }

    
    public List<Cms_Users> getUsers() {
        return users;
    }

    
    public void setUsers(List<Cms_Users> users) {
        this.users = users;
    }


    public Cms_Roles(int id, String roleCode, String despripe, List<Cms_Users> users){
        super();
        this.id = id;
        this.roleCode = roleCode;
        this.despripe = despripe;
        this.users = users;
    } 
    
	
    @Override
    public String toString() {
        return "Cms_Roles [id=" + id + ", roleCode=" + roleCode + ", despripe=" + despripe + ", users=" + users + "]";
    }


    public Cms_Roles(){
        super();
    }
    
}
