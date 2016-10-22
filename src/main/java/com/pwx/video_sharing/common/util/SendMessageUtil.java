package com.pwx.video_sharing.common.util;

import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class SendMessageUtil {

    /*private static final String msgName  = "yidiandian";
    private static final String password = "123123";*/
    private static final String msgName  = "yidiandian88";
    private static final String password = "sigfcfn2";
    private static final String url      = "http://www.jc-chn.cn/smsSend.do";

    

    /**
     * 获取6位随机码
     * 
     * @return
     */
    public static String createRandomVcode() {
        // 验证码
        String vcode = "";
        for (int i = 0; i < 6; i++) {
            vcode = vcode + (int) (Math.random() * 9);
        }
        return vcode;
    }

    /** 获取两个时间的时间差 如1天2小时30分钟 */
    public static Long getDatePoor(Date nowDate, Date compareDate) {

        long nd = 1000 * 24 * 60 * 60;
        long nh = 1000 * 60 * 60;
        long nm = 1000 * 60;
        // long ns = 1000;
        // 获得两个时间的毫秒时间差异
        long diff = nowDate.getTime() - compareDate.getTime();
        // 计算差多少天
        long day = diff / nd;
        // 计算差多少小时
        long hour = diff % nd / nh;
        // 计算差多少分钟
        long min = diff % nd % nh / nm;
        // 计算差多少秒//输出结果
        return min;
    }
    
    /** 获取两个时间的时间差 如1天2小时30分钟 */
    public static long getDateDay(Date nowDate, Date compareDate) {

        long nd = 1000 * 24 * 60 * 60;
        long nh = 1000 * 60 * 60;
        long nm = 1000 * 60;
        // long ns = 1000;
        // 获得两个时间的毫秒时间差异
        long diff = (nowDate.getTime() - compareDate.getTime());
        // 计算差多少天
        long day = diff / nd;
        // 计算差多少小时
        long hour = diff % nd / nh;
        // 计算差多少分钟
        long min = diff % nd % nh / nm;
        // 计算差多少秒//输出结果
        return day;
    }
    
}
