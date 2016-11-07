package com.pwx.video_sharing.message.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * 
 * <短信渠道与用户关联类>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * Administrator 	1.0  		2015年7月17日 	Created
 *
 * </pre>
 * @since 1.
 */
@Entity
@Table(name = "MsgUser")
public class MsgUser {

    @Id
    @Column(length = 32)
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;
    
    /**
     *短信渠道信息Id
     */
    @Column(name = "msgChannelId")
    private String msgChannelId;
    
    /**
     * 用户信息Id
     */
    @Column(name = "userId")
    private String userId;
    
    /**
     * 短信申请名称
     */
    @Column(name = "msgName")
    private String msgName;
    
    /**
     * 短信密码
     */
    @Column(name = "msgPwd")
    private String msgPwd;
    
    /**
     * 短信申请条数
     */
    @Column(name = "msgUserNumber")
    private String msgUserNumber;
    
    /**
     * 创建时间
     */
    @Column(name = "createDate")
    private String createDate;
    
    /**
     * 操作人
     */
    @Column(name = "operId")
    private String operId;
    
    /**
     * 操作时间
     */
    @Column(name = "operDate")
    private String operDate;
    
    /**
     * 支付金额
     */
    @Column(name = "payAmt")
    private Integer payAmt;
    
    /**
     * 状态 0：审核通过 1：审核未通过 2:未审核
     */
    @Column(name = "msgUserState")
    private String msgUserState;
    
    /**
     * 审核后短信剩余条数
     */
    @Column(name = "verifyMsgNumber")
    private String verifyMsgNumber;
    
    /**
     * 短信签名
     */
    @Column(name = "msgSign")
    private String msgSign;
    
    /**
     * 用户信息表 Users 
     */
    @Transient
    private String name;
    
    @Transient
    private String contactName;
    
    @Transient
    private String contactPhone;
    
    @Transient
    private String enterpriseName;
    
    @Transient
    private String enterpriseJGH;
    
    
    /**
     * 短信渠道信息表 MsgChannel
     */
    @Transient
    private String c_code;
    
    @Transient
    private String c_name;
    
    @Transient
    private String msgUserName;
    
    @Transient
    private String c_url;
    
    @Transient
    private String msgNumber;
    
    @Transient
    private String state;

    
    public String getId() {
        return id;
    }

    
    public void setId(String id) {
        this.id = id;
    }

    
    public String getMsgChannelId() {
        return msgChannelId;
    }

    
    public void setMsgChannelId(String msgChannelId) {
        this.msgChannelId = msgChannelId;
    }

    
    public String getUserId() {
        return userId;
    }

    
    public void setUserId(String userId) {
        this.userId = userId;
    }

    
    public String getMsgName() {
        return msgName;
    }

    
    public void setMsgName(String msgName) {
        this.msgName = msgName;
    }

    
    public String getMsgPwd() {
        return msgPwd;
    }

    
    public void setMsgPwd(String msgPwd) {
        this.msgPwd = msgPwd;
    }

    
    public String getMsgUserNumber() {
        return msgUserNumber;
    }

    
    public void setMsgUserNumber(String msgUserNumber) {
        this.msgUserNumber = msgUserNumber;
    }

    
    public String getCreateDate() {
        return createDate;
    }

    
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    
    public String getOperId() {
        return operId;
    }

    
    public void setOperId(String operId) {
        this.operId = operId;
    }

    
    public String getOperDate() {
        return operDate;
    }

    
    public void setOperDate(String operDate) {
        this.operDate = operDate;
    }

    
    public Integer getPayAmt() {
        return payAmt;
    }

    
    public void setPayAmt(Integer payAmt) {
        this.payAmt = payAmt;
    }

    
    public String getMsgUserState() {
        return msgUserState;
    }

    
    public void setMsgUserState(String msgUserState) {
        this.msgUserState = msgUserState;
    }

    
    public String getVerifyMsgNumber() {
        return verifyMsgNumber;
    }

    
    public void setVerifyMsgNumber(String verifyMsgNumber) {
        this.verifyMsgNumber = verifyMsgNumber;
    }

    
    public String getName() {
        return name;
    }

    
    public void setName(String name) {
        this.name = name;
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

    
    public String getEnterpriseName() {
        return enterpriseName;
    }

    
    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }

    
    public String getEnterpriseJGH() {
        return enterpriseJGH;
    }

    
    public void setEnterpriseJGH(String enterpriseJGH) {
        this.enterpriseJGH = enterpriseJGH;
    }

    
    public String getC_code() {
        return c_code;
    }

    
    public void setC_code(String c_code) {
        this.c_code = c_code;
    }

    
    public String getC_name() {
        return c_name;
    }

    
    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    
    public String getMsgUserName() {
        return msgUserName;
    }

    
    public void setMsgUserName(String msgUserName) {
        this.msgUserName = msgUserName;
    }

    
    public String getC_url() {
        return c_url;
    }

    
    public void setC_url(String c_url) {
        this.c_url = c_url;
    }

    
    public String getMsgNumber() {
        return msgNumber;
    }

    
    public void setMsgNumber(String msgNumber) {
        this.msgNumber = msgNumber;
    }

    
    public String getState() {
        return state;
    }

    
    public void setState(String state) {
        this.state = state;
    }
    
    
    public String getMsgSign() {
        return msgSign;
    }

    
    public void setMsgSign(String msgSign) {
        this.msgSign = msgSign;
    }


    public MsgUser(){
        super();
        // TODO Auto-generated constructor stub
    }


    public MsgUser(String id, String msgChannelId, String userId, String msgName, String msgPwd, String msgUserNumber,
                   String createDate, String operId, String operDate, Integer payAmt, String msgUserState,
                   String verifyMsgNumber, String msgSign, String name, String contactName, String contactPhone, String enterpriseName,
                   String enterpriseJGH, String c_code, String c_name, String msgUserName, String c_url,
                   String msgNumber, String state){
        super();
        this.id = id;
        this.msgChannelId = msgChannelId;
        this.userId = userId;
        this.msgName = msgName;
        this.msgPwd = msgPwd;
        this.msgUserNumber = msgUserNumber;
        this.createDate = createDate;
        this.operId = operId;
        this.operDate = operDate;
        this.payAmt = payAmt;
        this.msgUserState = msgUserState;
        this.verifyMsgNumber = verifyMsgNumber;
        this.msgSign = msgSign;
        this.name = name;
        this.contactName = contactName;
        this.contactPhone = contactPhone;
        this.enterpriseName = enterpriseName;
        this.enterpriseJGH = enterpriseJGH;
        this.c_code = c_code;
        this.c_name = c_name;
        this.msgUserName = msgUserName;
        this.c_url = c_url;
        this.msgNumber = msgNumber;
        this.state = state;
    }
    
}
