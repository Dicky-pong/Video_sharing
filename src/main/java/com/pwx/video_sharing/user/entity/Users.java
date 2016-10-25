package com.pwx.video_sharing.user.entity;

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
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * 
 * <用户实体类>
 * 
 * @version <pre>
 * Author	Version		Date		Changes
 * tanchao 	1.0  		2015年6月4日 	Created
 * 
 * </pre>
 * @since 1.
 */
@Entity
@Table(name = "USERS")
public class Users implements Cloneable {

	@Id
	@Column(length = 32)
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;

	// 用户名
	@Column(name = "loginName")
	private String loginName;

	// 密码
	@Column(name = "password")
	private String password;

	// 姓名 
	@Column(name = "contact_Name")
	private String contactName;
	
	//账户ID
	@Column(name = "accUUID")
	private String accUUID;
	
	// 邮箱
	@Column(name = "contact_Email")
	private String contactEmail;

	/**
	 * 审核状态,0为已审核的商户,3为待审核,2为锁定用户->此状态用于商户下控制子账号的可用状态 1已注册,待完善资料 4 审核失败，
	 * 5、提交审核失败
	 */
	@Column(name = "user_state")
	private String state;

	@Column(name = "createDate")
	private String createDate;

	/**
	 * 是否设置支付密码 0:已设置 1:位设置
	 */
	@Column(name = "isSetPayPwd")
	private String isSetPayPwd;

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

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getAccUUID() {
		return accUUID;
	}

	public void setAccUUID(String accUUID) {
		this.accUUID = accUUID;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getIsSetPayPwd() {
		return isSetPayPwd;
	}

	public void setIsSetPayPwd(String isSetPayPwd) {
		this.isSetPayPwd = isSetPayPwd;
	}

	@Override
	public String toString() {
		return "Users [id=" + id + ", loginName=" + loginName + ", password="
				+ password + ", contactName=" + contactName + ", accUUID="
				+ accUUID + ", contactEmail=" + contactEmail + ", state="
				+ state + ", createDate=" + createDate + ", isSetPayPwd="
				+ isSetPayPwd + "]";
	}

	public Users(String id, String loginName, String password,
			String contactName, String accUUID, String contactEmail,
			String state, String createDate, String isSetPayPwd) {
		super();
		this.id = id;
		this.loginName = loginName;
		this.password = password;
		this.contactName = contactName;
		this.accUUID = accUUID;
		this.contactEmail = contactEmail;
		this.state = state;
		this.createDate = createDate;
		this.isSetPayPwd = isSetPayPwd;
	}

	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}


	
}
