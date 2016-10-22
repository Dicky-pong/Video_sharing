package com.pwx.video_sharing.common.constant;


/**
 * 
 * <对外接口错误编码类>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * tanchao 	1.0  		2016年3月22日 	Created
 *
 * </pre>
 * @since 1.
 */
public class ErrorCode {
    
    /**
     * 操作成功
     */
    public static final String SUCCESS = "0";
    public static final String SUCCESS_EXPLAIN = "success";
    
    /**
     * 参数错误
     */
    public static final String PARAM_ERROR = "10001";
    public static final String PARAM_ERROR_EXPLAIN = "param is error";
    
    /**
     * 系统错误
     */
    public static final String SYETEM_ERROR = "99999";
    public static final String SYETEM_ERROR_EXPLAIN = "系统错误";
    
    /**
     * 存在关联，无法删除
     */
    public static final String PARAM_CONNECT = "10002";
    public static final String PARAM_CONNECT_EXPLAIN = "存在关联，无法删除";
    
    /**
     * 属性、规格添加超过限制
     */
    public static final String PARAM_LIMIT = "10005";
    public static final String PARAM_LIMIT_EXPLAIN = "超过限制添加数量";
    
    /**
     * 已存在
     */
    public static final String PARAM_EXIST = "10006";
    public static final String PARAM_EXIST_EXPLAIN = "已存在，无法添加";
    
    
    /**
     * 用户名已存在
     */
    public static final String LOGIN_EXIST = "10003";
    public static final String LOGIN_EXIST_EXPLAIN = "登录名已存在";
    
}
