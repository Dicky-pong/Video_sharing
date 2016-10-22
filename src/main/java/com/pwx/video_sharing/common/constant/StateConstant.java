package com.pwx.video_sharing.common.constant;


public class StateConstant {
    
    /**
     * 成功
     */
    public static final String SUCCESS = "0";
    
    /**
     * 系统异常
     */
    public static final String ERROR = "-1";
    
    /**
     * 超时
     */
    public static final String TIMEOUT = "99";
    
    
    /** =================    MSG STATE   =========================*/
    
    /**
     * 不存在该验证码
     */
    public static final String MSG_STATE_NOT_EXIST = "1";
    
    /**
     * 验证码有误
     */
    public static final String MSG_STATE_ERROR = "2";
    
    /**
     * 验证码已过有效期
     */
    public static final String MSG_STATE_TIMEOUT = "3";
    
    /**
     * 操作类型有误
     */
    public static final String MSG_STATE_OPER_ERROR = "4";
    
    /**
     * 操作类型ID有误
     */
    public static final String MSG_STATE_OPERID_ERROR = "5";
    
    /**
     * 验证码已失效
     */
    public static final String MSG_STATE_INVALID = "6";
    
    /**
     * 更改短信渠道信息失败
     */
    public static final String MSG_STATE_UPDATE_ERROR = "7";
    
    /**
     * 短信发送失败
     */
    public static final String MSG_STATE_SEND_ERROR = "8";
    
    /**
     * 短信剩余条数不足，无法发送
     */
    public static final String MSG_STATE_MSGNUMBER_SHORTAGE = "9";
    
    /**
     * 短信状态不可用，无法发送
     */
    public static final String MSG_STATE_NOT_AVAILABLE = "10";
    
    /**
     * 短信渠道不存在
     */
    public static final String MSG_STATE_CHANNL_NOT_EXIST = "11";
    
    
    /** =================    USERS STATE   =========================*/
    
    /**
     * 用户名格式错误：错误的手机号码
     */
    public static final String USERS_STATE_PHONENUMBER_ERROR = "12";
    
    /**
     * 用户名密码格式错误：小于6位
     */
    public static final String USERS_STATE_PASSWORD_ERROR = "13";
    
    /**
     * 用户已存在
     */
    public static final String USERS_STATE_EXIST = "14";
    
    /**
     * 用户不存在
     */
    public static final String USERS_STATE_NOT_EXIST = "16";
    
    
    /** =================    REG STATE   =========================*/
    
    /**
     * 注册失败
     */
    public static final String REG_STATE_ERROR = "15";
    
    /**
     * 注册失败
     */
    public static final String YACCOUNT_REG_STATE_ERROR = "30";
    
    
    /** =================    NOTICE STATE   =========================*/
    
    /**
     * 关注失败
     */
    public static final String NOTICE_STATE_ERROR = "17";
    
    /**
     * 已关注
     */
    public static final String NOTICE_STATE_EXIST = "28";
    
    /**
     * 取消关注失败
     */
    public static final String NOTICE_STATE_DELETE_ERROR = "29";
    
    
    /**
     * 关注信息不存在
     */
    public static final String NOTICE_STATE_NOT_EXIST = "31";
    
    
    /** =================    CART STATE   =========================*/
    
    
    /**
     * 商品信息不存在
     */
    public static final String CART_STATE_NOT_EXIST = "18";
    
    /**
     * 加入购物失败
     */
    public static final String CART_STATE_ADD_ERROR = "19";
    
    /**
     * 删除购物车信息失败
     */
    public static final String CART_STATE_DELETE_ERROR = "20";
    
    /**
     * 修改购物车信息失败
     */
    public static final String CART_STATE_UPDATE_ERROR = "35";
    
    /**
     * 优惠券已存在
     */
    public static final String CART_STATE_EXIST = "21";
    
    
    /** =================    SHARESERIAL STATE   =========================*/
    
    
    /**
     * 分享流水信息不存在
     */
    public static final String SHARE_STATE_NOT_EXIST = "22";
    
    /**
     * 新增流水失败
     */
    public static final String SHARE_STATE_ADD_ERROR = "23";
    
    /**
     * 修改流水失败
     */
    public static final String SHARE_STATE_UPDATE_ERROR = "24";
    
    
    
    /** =================    MYSHARE STATE   =========================*/
    
    
    /**
     * 我的推广信息不存在
     */
    public static final String MYSHARE_STATE_NOT_EXIST = "25";
    
    /**
     * 删除我的推广信息失败
     */
    public static final String MYSHARE_STATE_DELETE_ERROR = "26";
    
    
    /** =================    FORGETPASSWORD STATE   =========================*/
    
    /**
     * 验证密码与确认密码不相同
     */
    public static final String CHECK_PWDISNOTEQUAL = "27";
    
    
    
    /** =================    STORECOMMODITY STATE   =========================*/
    
    /**
     * 商品已存在
     */
    public static final String STORECOMMODITY_STATE_EXIST = "32";
    
    /**
     * 商品不存在
     */
    public static final String STORECOMMODITY_STATE_NOT_EXIST = "33";
    
    /**
     * 不能添加自己的商品
     */
    public static final String STORECOMMODITY_STATE_NO_ADD_MY = "34";
    
    
    
    /** =================    ADDRESS STATE   =========================*/
    
    
    /**
     * 地址不存在
     */
    public static final String ADDRESS_STATE_NOT_EXIST = "36";
    
    /**
     * 地址不存在
     */
    public static final String ADDRESS_STATE_PARAM_ERROR = "37";
    
    /**
     * 系统异常
     */
    public static final String ADDRESS_STATE_EXCEPTION = "38";
    
    
    /**
     * 会员卡图片尺寸有误
     */
    public static final String VIP_CARD_IMAGES_SIZE_ERROR = "39";
    
    /**
     * 会员卡图片不存在
     */
    public static final String VIP_CARD_IMAGES_NOT_EXIST = "40";
    
    
    
}
