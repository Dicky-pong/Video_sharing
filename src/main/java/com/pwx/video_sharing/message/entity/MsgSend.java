package com.pwx.video_sharing.message.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 
 * <短信验证码类>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * huxianmin 	1.0  	2015年6月26日 	Created
 *
 * </pre>
 * @since 1.
 */

@Entity
@Table(name = "MSGSEND")
public class MsgSend {
    
    @Id
    @Column(length = 32)
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;
    
    /**
     * 短信发送手机号
     */
    @Column(name = "sendPhone")
    private String sendPhone;
    
    /**
     * 验证码
     */
    @Column(name = "verifyCode")
    private String verifyCode; 
    
    /**
     * 短信发送时间
     */
    @Column(name = "sendDate")
    private String sendDate;
    
    /**
     * 发送内容
     */
    @Column(name = "sendContent")
    private String sendContent;
    
    /**
     * 验证码有效期
     */
    @Column(name = "verifyCodeValidity")
    private String verifyCodeValidity;
    
    /**
     * 操作类型 0:登录 1:注册 2:领取优惠券 3:发送领取信息 4:找回密码  5:邮箱找回密码 6:绑定手机号码  7:审核通过  8:审核未通过
     */
    @Column(name = "openType")
    private String operType;
    
    /**
     * 短信发送状态 0:未使用 1:已使用 2:失效 
     */
    @Column(name = "sendStatus")
    private String sendStatus;
    
    /**
     * 操作类型ID
     */
    @Column(name = "openTypeId")
    private String operTypeId;
    
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
     * 发送次数
     */
    @Column(name = "sendNumber")
    private int sendNumber;
    
    /**
     * 发送渠道名
     */
    @Column(name = "sendChannelName")
    private String sendChannelName;

    
    public MsgSend(){
        super();
    }


    public MsgSend(String id, String sendPhone, String verifyCode, String sendDate, String sendContent,
                   String verifyCodeValidity, String operType, String sendStatus, String operTypeId, String operId,
                   String operDate, int sendNumber, String sendChannelName){
        super();
        this.id = id;
        this.sendPhone = sendPhone;
        this.verifyCode = verifyCode;
        this.sendDate = sendDate;
        this.sendContent = sendContent;
        this.verifyCodeValidity = verifyCodeValidity;
        this.operType = operType;
        this.sendStatus = sendStatus;
        this.operTypeId = operTypeId;
        this.operId = operId;
        this.operDate = operDate;
        this.sendNumber = sendNumber;
        this.sendChannelName = sendChannelName;
    }


    @Override
    public String toString() {
        return "MsgSend [id=" + id + ", sendPhone=" + sendPhone + ", verifyCode=" + verifyCode + ", sendDate="
               + sendDate + ", sendContent=" + sendContent + ", verifyCodeValidity=" + verifyCodeValidity
               + ", operType=" + operType + ", sendStatus=" + sendStatus + ", operTypeId=" + operTypeId + ", operId="
               + operId + ", operDate=" + operDate + ", sendNumber=" + sendNumber + ", sendChannelName="
               + sendChannelName + "]";
    }


    public String getId() {
        return id;
    }

    
    public void setId(String id) {
        this.id = id;
    }

    
    public String getSendPhone() {
        return sendPhone;
    }

    
    public void setSendPhone(String sendPhone) {
        this.sendPhone = sendPhone;
    }

    
    public String getVerifyCode() {
        return verifyCode;
    }

    
    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    
    public String getSendDate() {
        return sendDate;
    }

    
    public void setSendDate(String sendDate) {
        this.sendDate = sendDate;
    }

    
    public String getSendContent() {
        return sendContent;
    }

    
    public void setSendContent(String sendContent) {
        this.sendContent = sendContent;
    }

    
    public String getVerifyCodeValidity() {
        return verifyCodeValidity;
    }

    
    public void setVerifyCodeValidity(String verifyCodeValidity) {
        this.verifyCodeValidity = verifyCodeValidity;
    }

    
    public String getOperType() {
        return operType;
    }

    
    public void setOperType(String operType) {
        this.operType = operType;
    }

    
    public String getSendStatus() {
        return sendStatus;
    }

    
    public void setSendStatus(String sendStatus) {
        this.sendStatus = sendStatus;
    }


    
    public String getOperTypeId() {
        return operTypeId;
    }


    
    public void setOperTypeId(String operTypeId) {
        this.operTypeId = operTypeId;
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


    
    public int getSendNumber() {
        return sendNumber;
    }


    
    public void setSendNumber(int sendNumber) {
        this.sendNumber = sendNumber;
    }

    
    public String getSendChannelName() {
        return sendChannelName;
    }

    
    public void setSendChannelName(String sendChannelName) {
        this.sendChannelName = sendChannelName;
    }
    
    
}
