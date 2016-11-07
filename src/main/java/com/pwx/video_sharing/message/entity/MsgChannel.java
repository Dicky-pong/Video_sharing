package com.pwx.video_sharing.message.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 
 * <短信渠道信息类>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * huxianmin 	1.0  	2015年7月15日 	Created
 *
 * </pre>
 * @since 1.
 */

@Entity
@Table(name = "MSGCHANNEL")
public class MsgChannel {

    @Id
    @Column(length = 32)
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;
    
    /**
     * 渠道编码
     */
    @Column(name = "c_code")
    private String c_code;
    
    /**
     * 渠道名称
     */
    @Column(name = "c_name")
    private String c_name;
    
    /**
     * 渠道用户名
     */
    @Column(name = "msgUserName")
    private String msgUserName;
    
    /**
     * 渠道用户密码
     */
    @Column(name = "msgPassword")
    private String msgPassword;
    
    /**
     * 渠道地址
     */
    @Column(name = "c_url")
    private String c_url;
    
    /**
     * 短信剩余条数
     */
    @Column(name = "msgNumber")
    private Integer msgNumber;
    
    /**
     * 渠道使用对象 1:一点点  2:智惠联盟  3:智汇联通  4:代理商  5:商户  6:智惠客 7:Y账户  8:渠道管理系统 9:其他
     */
    @Column(name = "msgUseObj")
    private String msgUseObj;
    
    /**
     * 状态 0:启用 1:关闭
     */
    @Column(name = "state")
    private String state;
    
    /**
     * 短信级别
     */
    @Column(name = "msgLevel")
    private String msgLevel;
    
    /**
     * 是否进行过分配
     */
    @Column(name = "tranNumber")
    private Integer tranNumber;
    
    /**
     * 短信签名
     */
    @Column(name = "msgSign")
    private String msgSign;
    

    
    public String getId() {
        return id;
    }

    
    public void setId(String id) {
        this.id = id;
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

    
    public String getMsgPassword() {
        return msgPassword;
    }

    
    public void setMsgPassword(String msgPassword) {
        this.msgPassword = msgPassword;
    }

    
    public String getC_url() {
        return c_url;
    }

    
    public void setC_url(String c_url) {
        this.c_url = c_url;
    }

    
    public Integer getMsgNumber() {
        return msgNumber;
    }

    
    public void setMsgNumber(Integer msgNumber) {
        this.msgNumber = msgNumber;
    }

    
    public String getMsgUseObj() {
        return msgUseObj;
    }

    
    public void setMsgUseObj(String msgUseObj) {
        this.msgUseObj = msgUseObj;
    }

    
    public String getState() {
        return state;
    }

    
    public void setState(String state) {
        this.state = state;
    }
    
    
    public String getMsgLevel() {
        return msgLevel;
    }

    
    public void setMsgLevel(String msgLevel) {
        this.msgLevel = msgLevel;
    }

    
    public Integer getTranNumber() {
        return tranNumber;
    }

    
    public void setTranNumber(Integer tranNumber) {
        this.tranNumber = tranNumber;
    }
    
    
    public String getMsgSign() {
        return msgSign;
    }


    
    public void setMsgSign(String msgSign) {
        this.msgSign = msgSign;
    }


    public MsgChannel(){
        super();
        // TODO Auto-generated constructor stub
    }


    public MsgChannel(String id, String c_code, String c_name, String msgUserName, String msgPassword, String c_url,
                      Integer msgNumber, String msgUseObj, String state, String msgLevel, Integer tranNumber, String msgSign){
        super();
        this.id = id;
        this.c_code = c_code;
        this.c_name = c_name;
        this.msgUserName = msgUserName;
        this.msgPassword = msgPassword;
        this.c_url = c_url;
        this.msgNumber = msgNumber;
        this.msgUseObj = msgUseObj;
        this.state = state;
        this.msgLevel = msgLevel;
        this.tranNumber = tranNumber;
        this.msgSign = msgSign;
    }
    
    
    
    
    
}
