package com.pwx.video_sharing.common.util;

import java.util.List;

public class MsgJson {

    //操作信息
    private String msg;

    //操作码
    private String msgCode;
    
    private String downloadUrl;
    
    //泛型  返回列表操作数据list
    private List<?> data;
    
    //对象  返回单个对象数据object
    private Object object;

    
    public String getDownloadUrl() {
		return downloadUrl;
	}


	public void setDownloadUrl(String downloadUrl) {
		this.downloadUrl = downloadUrl;
	}


	public String getMsg() {
        return msg;
    }

    
    public void setMsg(String msg) {
        this.msg = msg;
    }

    
    public String getMsgCode() {
        return msgCode;
    }

    
    public void setMsgCode(String msgCode) {
        this.msgCode = msgCode;
    }

    
    public List<?> getData() {
        return data;
    }

    
    public void setData(List<?> data) {
        this.data = data;
    }

    
    public Object getObject() {
        return object;
    }

    
    public void setObject(Object object) {
        this.object = object;
    }
   
    
    public MsgJson(){
        super();
    }


    @Override
    public String toString() {
        return "MsgJson [msg=" + msg + ", msgCode=" + msgCode + ", data=" + data + ", object=" + object + "]";
    }


    public MsgJson(String msg, String msgCode, List<?> data, Object object){
        super();
        this.msg = msg;
        this.msgCode = msgCode;
        this.data = data;
        this.object = object;
    }
    
    
}
