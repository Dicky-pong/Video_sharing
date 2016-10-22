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
@Table(name="USER_ROLE")
public class User_Role {
    
    @Id
    @Column(length = 32)
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;
    
    @ManyToOne(targetEntity=Users.class)
    @JoinColumn(name="userid")
    private Users users;
    
    @ManyToOne(targetEntity=Roles.class)
    @JoinColumn(name="roleid")
    private Roles roles;

    
    
    
    
    public String getId() {
        return id;
    }

    
    public void setId(String id) {
        this.id = id;
    }


    public Users getUsers() {
        return users;
    }

    
    public void setUsers(Users users) {
        this.users = users;
    }

    
    public Roles getRoles() {
        return roles;
    }

    
    public void setRoles(Roles roles) {
        this.roles = roles;
    }
    
    
}
