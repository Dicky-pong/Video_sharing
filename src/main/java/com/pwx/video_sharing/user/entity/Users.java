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
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * tanchao 	1.0  		2015年6月4日 	Created
 *
 * </pre>
 * @since 1.
 */
@Entity
@Table(name="USERS")
public class Users implements Cloneable {
	
    
    
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
    
    /**
     * 企业昵称(5个字以内)
     */
    @Column(name="nickName")
    private String nickName;
    
    /**
     * 企业负责人信息
     */
    //姓名 (法人)
    @Column(name="contact_Name")
    private String contactName;
    
    //简介
    @Column(name="contact_Profile")
    private String contactProfile;
    
    //400/800 电话
    @Column(name="contact_Phone")
    private String contactPhone;
    
    //座机电话
    @Column(name="contactCellPhone")
    private String contactCellPhone;
    
    //邮箱
    @Column(name="contact_Email")
    private String contactEmail;
    
    //身份证
    @Column(name="contact_CardId")
    private String contactCardId;
    
    //负责人身份证证件照
    @Column(name="contact_CardImgSrc")
    private String contactCardImgSrc;
    
    //负责人身份证背面证件照
    @Column(name="contact_BackCardImgSrc")
    private String contactBackCardImgSrc;

    /**
     * 企业资料信息
     */
    //企业名称
    @Column(name="enterprise_Name")
    private String enterpriseName;
    
    //绑定的手机
    @Column(name="enterprise_Phone")
    private String enterprisePhone;
    
    //企业详情
    @Column(name="enterpriseDetail", length = 5000)
    private String enterpriseDetail;
    
    @Column(name = "editEnterpriseDetail", length = 5000)
    private String editEnterpriseDetail;

    //企业地址
    //省
    @Column(name="enterprise_Address_Province")
    private String enterpriseAddressProvince;
    //市
    @Column(name="enterprise_Address_City")
    private String enterpriseAddressCity;
    //区
    @Column(name="enterprise_Address_Area")
    private String enterpriseAddressArea;
    // 商圈
    @Column(name="enterprise_Business_Circle")
    private String enterpriseBusinessCircle;
    // 详细地址
    @Column(name="enterprise_Address_Detail")
    private String enterpriseAddressDetail;
    
    //行业类型
    @Column(name="enterprise_IndustryType")
    private String enterpriseIndustryType;
    
    //行业详情
    @Column(name="enterpriseInfoDetail")
    private String enterpriseInfoDetail;
    
    //营业执照
    @Column(name="business_License")
    private String businessLicense;
    
    //营业执照扫描件
    @Column(name="business_License_Scan")
    private String businessLicenseScan;
    
    //商户机构号
    @Column(name="enterprise_JGH")
    private String enterpriseJGH;
    
    //商户Logo
    @Column(name="enterprise_Logo")
    private String enterpriseLogo;
    
    //门脸或名片照片
    @Column(name="business_NameCard_Scan")
    private String businessNameCardScan;
    
    //门脸或名片照片
    @Column(name="business_NameCard_Scan1")
    private String businessNameCardScan1;
    
    //营业时间
    @Column(name="business_Hours")
    private String businessHours;
    
    //注册类型     0.运营   1.亿企联  2.商户云
    @Column(name="regist_type")
    private String registType;
    //商户编号   
    @Column(name="user_code")
    private String userCode;
    /**
     * Y账户UUID
     */
    @Column(name="accUUID")
    private String accUUID;
    
    /**
     * 审核状态,0为已审核的商户,3为待审核,2为锁定用户->此状态用于商户下控制子账号的可用状态    1已注册,待完善资料   4 审核失败， 5、提交审核失败
     */
    @Column(name="user_state")
    private String state;
    
    /**
     * 用户类型 0为主账号  1为子账号  |子账号由主账号分配
     */
    @Column(name="ACCOUNTTYPE")
    private String accountType;
    
    @Column(name="createDate")
    private String createDate;
    
    @Column(name="qqNumber")
    private String qqNumber;
    
    //人均消费 (Consumer Price Index 消费者物价指数)
    @Column(name="CPI")
    private String CPI;
    
    //公交信息
    @Column(name="busInfo")
    private String busInfo;
    
    // 网站地址
    @Column(name="webSite")
    private String webSite;
    
    // 备注
    @Column(name="remark")
    private String remark;
    
    /**
     * 是否设置支付密码 0:已设置 1:位设置
     */
    @Column(name="isSetPayPwd")
    private String isSetPayPwd;
    
    /**
     * 是否存在停车场 0:存在 1:不存在
     */
    @Column(name="isExistParking")
    private String isExistParking;
    
    // 资料填写步骤
    @Column(name="writeStep")
    private String writeStep;
    
    // 经度
    @Column(name="lng")
    private String lng;
    
    // 纬度
    @Column(name="lat")
    private String lat;
    
    
    /**
     * 临时验证码
     */
    @Transient
    private String verifyCode;
    
    /**
     * 是否关注
     */
    @Transient
    private String isNotice;
    
    
    /**
     * 是否相互关注
     */
    @Transient
    private String isTogetherNotice;
    
    /**
     * 行业类型名称
     */
    @Transient
    private String typeName;
    
    
    
    public String getIsSetPayPwd() {
        return isSetPayPwd;
    }


    
    public void setIsSetPayPwd(String isSetPayPwd) {
        this.isSetPayPwd = isSetPayPwd;
    }


    
    
    public String getUserCode() {
        return userCode;
    }



    
    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }



    public String getVerifyCode() {
        return verifyCode;
    }


    
    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }


    public String getAccUUID() {
        return accUUID;
    }

    
    public void setAccUUID(String accUUID) {
        this.accUUID = accUUID;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    @ManyToMany(cascade={CascadeType.ALL},fetch=FetchType.EAGER)
    @JoinTable(name="user_role" , joinColumns = {  
            @JoinColumn(name = "userid")  
    }, inverseJoinColumns = {@JoinColumn(name="roleid")})   
    private List<Roles> roles = new ArrayList<Roles>();    

    
    public List<Roles> getRoles() {
		return roles;
	}

	public void setRoles(List<Roles> roles) {
		this.roles = roles;
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

    
    public String getContactName() {
        return contactName;
    }

    
    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    
    public String getContactPhone() {
        return contactPhone;
    }

    
    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    
    public String getContactEmail() {
        return contactEmail;
    }

    
    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    
    public String getContactCardId() {
        return contactCardId;
    }

    
    public void setContactCardId(String contactCardId) {
        this.contactCardId = contactCardId;
    }

    public String getContactCardImgSrc() {
        return contactCardImgSrc;
    }

    
    public void setContactCardImgSrc(String contactCardImgSrc) {
        this.contactCardImgSrc = contactCardImgSrc;
    }

    public String getEnterpriseName() {
        return enterpriseName;
    }
    
    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }
    
    public String getEnterprisePhone() {
        return enterprisePhone;
    }
    
    public void setEnterprisePhone(String enterprisePhone) {
        this.enterprisePhone = enterprisePhone;
    }

    public String getEnterpriseAddressProvince() {
        
        
//        return dic.getText("province", enterpriseAddressProvince);
        return enterpriseAddressProvince;
    }

    
    public void setEnterpriseAddressProvince(String enterpriseAddressProvince) {
        this.enterpriseAddressProvince = enterpriseAddressProvince;
    }

    
    public String getEnterpriseAddressCity() {
//        return dic.getText("city", enterpriseAddressCity);
        return enterpriseAddressCity;
    }

    
    public void setEnterpriseAddressCity(String enterpriseAddressCity) {
        this.enterpriseAddressCity = enterpriseAddressCity;
    }

    
    public String getEnterpriseAddressArea() {
//        return dic.getText("area", enterpriseAddressArea);
        return enterpriseAddressArea;
    }

    
    public void setEnterpriseAddressArea(String enterpriseAddressArea) {
        this.enterpriseAddressArea = enterpriseAddressArea;
    }
    
    public String getEnterpriseAddressDetail() {
        return enterpriseAddressDetail;
    }

    public void setEnterpriseAddressDetail(String enterpriseAddressDetail) {
        this.enterpriseAddressDetail = enterpriseAddressDetail;
    }
    
    public String getEnterpriseIndustryType() {
        return enterpriseIndustryType;
    }

    
    public void setEnterpriseIndustryType(String enterpriseIndustryType) {
        this.enterpriseIndustryType = enterpriseIndustryType;
    }

    
    public String getBusinessLicense() {
        return businessLicense;
    }

    
    public void setBusinessLicense(String businessLicense) {
        this.businessLicense = businessLicense;
    }

    
    public String getBusinessLicenseScan() {
        return businessLicenseScan;
    }

    
    public void setBusinessLicenseScan(String businessLicenseScan) {
        this.businessLicenseScan = businessLicenseScan;
    }
    
    public String getEnterpriseJGH() {
        return enterpriseJGH;
    }
    
    public void setEnterpriseJGH(String enterpriseJGH) {
        this.enterpriseJGH = enterpriseJGH;
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
    
    public String getEnterpriseLogo() {
        return enterpriseLogo;
    }

    public void setEnterpriseLogo(String enterpriseLogo) {
        this.enterpriseLogo = enterpriseLogo;
    }
    
    
    public String getQqNumber() {
        return qqNumber;
    }

    
    public void setQqNumber(String qqNumber) {
        this.qqNumber = qqNumber;
    }
    
    
    public String getTypeName() {
        return typeName;
    }



    
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
    

    
    public String getIsTogetherNotice() {
        return isTogetherNotice;
    }



    
    public void setIsTogetherNotice(String isTogetherNotice) {
        this.isTogetherNotice = isTogetherNotice;
    }
    

    
    public String getNickName() {
        return nickName;
    }



    
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }



    
    public String getContactProfile() {
        return contactProfile;
    }



    
    public void setContactProfile(String contactProfile) {
        this.contactProfile = contactProfile;
    }



    
    public String getEnterpriseDetail() {
        return enterpriseDetail;
    }



    
    public void setEnterpriseDetail(String enterpriseDetail) {
        this.enterpriseDetail = enterpriseDetail;
    }



    
    public String getEnterpriseBusinessCircle() {
        return enterpriseBusinessCircle;
    }



    
    public void setEnterpriseBusinessCircle(String enterpriseBusinessCircle) {
        this.enterpriseBusinessCircle = enterpriseBusinessCircle;
    }



    
    public String getBusinessNameCardScan() {
        return businessNameCardScan;
    }



    
    public void setBusinessNameCardScan(String businessNameCardScan) {
        this.businessNameCardScan = businessNameCardScan;
    }



    
    public String getBusinessHours() {
        return businessHours;
    }



    
    public void setBusinessHours(String businessHours) {
        this.businessHours = businessHours;
    }



    
    public String getCPI() {
        return CPI;
    }



    
    public void setCPI(String cPI) {
        CPI = cPI;
    }



    
    public String getBusInfo() {
        return busInfo;
    }



    
    public void setBusInfo(String busInfo) {
        this.busInfo = busInfo;
    }



    
    public String getWebSite() {
        return webSite;
    }



    
    public void setWebSite(String webSite) {
        this.webSite = webSite;
    }



    
    public String getRemark() {
        return remark;
    }



    
    public void setRemark(String remark) {
        this.remark = remark;
    }



    
    public String getIsExistParking() {
        return isExistParking;
    }



    
    public void setIsExistParking(String isExistParking) {
        this.isExistParking = isExistParking;
    }



    
    public String getWriteStep() {
        return writeStep;
    }



    
    public void setWriteStep(String writeStep) {
        this.writeStep = writeStep;
    }



    
    public String getLng() {
        return lng;
    }



    
    public void setLng(String lng) {
        this.lng = lng;
    }



    
    public String getLat() {
        return lat;
    }



    
    public void setLat(String lat) {
        this.lat = lat;
    }



    
    public String getContactCellPhone() {
        return contactCellPhone;
    }



    
    public void setContactCellPhone(String contactCellPhone) {
        this.contactCellPhone = contactCellPhone;
    }
    
    public String getBusinessNameCardScan1() {
        return businessNameCardScan1;
    }



    
    public void setBusinessNameCardScan1(String businessNameCardScan1) {
        this.businessNameCardScan1 = businessNameCardScan1;
    }


    public String getEnterpriseInfoDetail() {
        return enterpriseInfoDetail;
    }



    
    public void setEnterpriseInfoDetail(String enterpriseInfoDetail) {
        this.enterpriseInfoDetail = enterpriseInfoDetail;
    }



    
    public String getIsNotice() {
        return isNotice;
    }



    
    public void setIsNotice(String isNotice) {
        this.isNotice = isNotice;
    }



    public String getRegistType() {
        return registType;
    }



    
    public void setRegistType(String registType) {
        this.registType = registType;
    }
    
    
    public String getContactBackCardImgSrc() {
        return contactBackCardImgSrc;
    }



    
    public void setContactBackCardImgSrc(String contactBackCardImgSrc) {
        this.contactBackCardImgSrc = contactBackCardImgSrc;
    }

    public String getEditEnterpriseDetail() {
		return editEnterpriseDetail;
	}

	public void setEditEnterpriseDetail(String editEnterpriseDetail) {
		this.editEnterpriseDetail = editEnterpriseDetail;
	}



	@Override
    public String toString() {
        return "Users [id=" + id + ", loginName=" + loginName + ", password=" + password + ", nickName=" + nickName
               + ", contactName=" + contactName + ", contactProfile=" + contactProfile + ", contactPhone="
               + contactPhone + ", contactCellPhone=" + contactCellPhone + ", contactEmail=" + contactEmail
               + ", contactCardId=" + contactCardId + ", contactCardImgSrc=" + contactCardImgSrc + ", enterpriseName="
               + enterpriseName + ", enterprisePhone=" + enterprisePhone + ", enterpriseDetail=" + enterpriseDetail
               + ", enterpriseAddressProvince=" + enterpriseAddressProvince + ", enterpriseAddressCity="
               + enterpriseAddressCity + ", enterpriseAddressArea=" + enterpriseAddressArea
               + ", enterpriseBusinessCircle=" + enterpriseBusinessCircle + ", enterpriseAddressDetail="
               + enterpriseAddressDetail + ", enterpriseIndustryType=" + enterpriseIndustryType
               + ", enterpriseInfoDetail=" + enterpriseInfoDetail + ", businessLicense=" + businessLicense
               + ", businessLicenseScan=" + businessLicenseScan + ", enterpriseJGH=" + enterpriseJGH
               + ", enterpriseLogo=" + enterpriseLogo + ", businessNameCardScan=" + businessNameCardScan
               + ", businessNameCardScan1=" + businessNameCardScan1 + ", businessHours=" + businessHours
               + ", registType=" + registType + ", userCode=" + userCode + ", accUUID=" + accUUID + ", state=" + state
               + ", accountType=" + accountType + ", createDate=" + createDate + ", qqNumber=" + qqNumber + ", CPI="
               + CPI + ", busInfo=" + busInfo + ", webSite=" + webSite + ", remark=" + remark + ", isSetPayPwd="
               + isSetPayPwd + ", isExistParking=" + isExistParking + ", writeStep=" + writeStep + ", lng=" + lng
               + ", lat=" + lat + ", verifyCode=" + verifyCode + ", isNotice=" + isNotice + ", isTogetherNotice="
               + isTogetherNotice + ", typeName=" + typeName + ", roles=" + roles + "]";
    }



    public Users(){
        super();
        // TODO Auto-generated constructor stub
    }



    public Users(String id, String loginName, String password, String nickName, String contactName,
                 String contactProfile, String contactPhone, String contactCellPhone, String contactEmail,
                 String contactCardId, String contactCardImgSrc, String enterpriseName, String enterprisePhone,
                 String enterpriseDetail, String enterpriseAddressProvince, String enterpriseAddressCity,
                 String enterpriseAddressArea, String enterpriseBusinessCircle, String enterpriseAddressDetail,
                 String enterpriseIndustryType, String enterpriseInfoDetail, String businessLicense,
                 String businessLicenseScan, String enterpriseJGH, String enterpriseLogo, String businessNameCardScan,
                 String businessNameCardScan1, String businessHours, String registType, String userCode,
                 String accUUID, String state, String accountType, String createDate, String qqNumber, String cPI,
                 String busInfo, String webSite, String remark, String isSetPayPwd, String isExistParking,
                 String writeStep, String lng, String lat, String verifyCode, String isNotice, String isTogetherNotice,
                 String typeName, List<Roles> roles){
        super();
        this.id = id;
        this.loginName = loginName;
        this.password = password;
        this.nickName = nickName;
        this.contactName = contactName;
        this.contactProfile = contactProfile;
        this.contactPhone = contactPhone;
        this.contactCellPhone = contactCellPhone;
        this.contactEmail = contactEmail;
        this.contactCardId = contactCardId;
        this.contactCardImgSrc = contactCardImgSrc;
        this.enterpriseName = enterpriseName;
        this.enterprisePhone = enterprisePhone;
        this.enterpriseDetail = enterpriseDetail;
        this.enterpriseAddressProvince = enterpriseAddressProvince;
        this.enterpriseAddressCity = enterpriseAddressCity;
        this.enterpriseAddressArea = enterpriseAddressArea;
        this.enterpriseBusinessCircle = enterpriseBusinessCircle;
        this.enterpriseAddressDetail = enterpriseAddressDetail;
        this.enterpriseIndustryType = enterpriseIndustryType;
        this.enterpriseInfoDetail = enterpriseInfoDetail;
        this.businessLicense = businessLicense;
        this.businessLicenseScan = businessLicenseScan;
        this.enterpriseJGH = enterpriseJGH;
        this.enterpriseLogo = enterpriseLogo;
        this.businessNameCardScan = businessNameCardScan;
        this.businessNameCardScan1 = businessNameCardScan1;
        this.businessHours = businessHours;
        this.registType = registType;
        this.userCode = userCode;
        this.accUUID = accUUID;
        this.state = state;
        this.accountType = accountType;
        this.createDate = createDate;
        this.qqNumber = qqNumber;
        CPI = cPI;
        this.busInfo = busInfo;
        this.webSite = webSite;
        this.remark = remark;
        this.isSetPayPwd = isSetPayPwd;
        this.isExistParking = isExistParking;
        this.writeStep = writeStep;
        this.lng = lng;
        this.lat = lat;
        this.verifyCode = verifyCode;
        this.isNotice = isNotice;
        this.isTogetherNotice = isTogetherNotice;
        this.typeName = typeName;
        this.roles = roles;
    }










}
