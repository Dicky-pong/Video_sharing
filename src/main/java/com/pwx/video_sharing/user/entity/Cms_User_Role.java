package com.pwx.video_sharing.user.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="CMS_USER_ROLE")
public class Cms_User_Role {
    
    @Id
    @Column(length = 32)
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;
    
    @ManyToOne(targetEntity=Cms_Users.class)
    @JoinColumn(name="cms_userId")
    private Cms_Users cms_Users;
    
    @ManyToOne(targetEntity=Cms_Roles.class)
    @JoinColumn(name="cms_roleId")
    private Cms_Roles cms_Roles;

    
    @Override
    public String toString() {
        return "Cms_User_Role [id=" + id + ", cms_Users=" + cms_Users + ", cms_Roles=" + cms_Roles + "]";
    }


    public String getId() {
        return id;
    }

    
    public void setId(String id) {
        this.id = id;
    }
    
    
    public Cms_Users getCms_Users() {
        return cms_Users;
    }


    
    public void setCms_Users(Cms_Users cms_Users) {
        this.cms_Users = cms_Users;
    }


    
    public Cms_Roles getCms_Roles() {
        return cms_Roles;
    }


    
    public void setCms_Roles(Cms_Roles cms_Roles) {
        this.cms_Roles = cms_Roles;
    }


    public Cms_User_Role(String id, Cms_Users cms_Users, Cms_Roles cms_Roles){
        super();
        this.id = id;
        this.cms_Users = cms_Users;
        this.cms_Roles = cms_Roles;
    }


    public Cms_User_Role(){
        super();
    }
    
}
