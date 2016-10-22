package com.pwx.video_sharing.common.util;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;


public class SessionUtil {

    private static SessionUtil instance;
    
    public static final String SESSION_USER_LOGIN_INFO = "SESSION_USER_LOGIN_INFO";
    
    public static final String SESSION_WECHATE_THIRD_ID = "SESSION_WECHATE_THIRD_ID";

    private SessionUtil (){}  
    
    public static SessionUtil getInstance() {  
        if (instance == null) {  
            instance = new SessionUtil();  
        }  
        return instance;  
    }
    
    /**
     * 
     * TODO 获取登录用户名.
     * @return
     */
    public static String getUserName(){
        
        String username = "";
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
          username = ((UserDetails)principal).getUsername();
        } else {
          username = principal.toString();
        }
        
        /*//获取上下文
        SecurityContext secContext = SecurityContextHolder.getContext();
        
        //获取认证信息
        Authentication auth = secContext.getAuthentication();
        
        //在认证对象中获取主体对象
        Object principal = auth.getPrincipal();
        
        String username = "";
        if(principal instanceof UserDetails){
            username = ((UserDetails) principal).getUsername();
        }else{
            username = principal.toString();
        }*/
        return username;
    }
    
    /**
     * 
     * TODO 获取权限信息.
     * @return
     */
    public static Object[] getAuthorities(){
        //获取上下文
        SecurityContext secContext = SecurityContextHolder.getContext();
        //获取认证信息
        Authentication auth = secContext.getAuthentication();
        //在认证对象中获取主体对象
        Object principal = auth.getPrincipal();
        Collection<? extends GrantedAuthority> access = null;
        if(principal instanceof UserDetails){
            access = ((UserDetails) principal).getAuthorities();
        }else{
//            username = principal.toString();
        }
        return access.toArray();
    }
    
    /**
     * 
     * TODO 从session获取登录用户的信息.
     * @param request
     * @return
     */
//    public static Member getUserLoginInfo(HttpServletRequest request) {
//        return (Member) request.getSession().getAttribute(SESSION_USER_LOGIN_INFO);
//    }
    
    /**
     * 
     * TODO 将登录用户信息存入session.
     * @param request
     * @param data
     */
    public static void setUserLoginInfo(HttpServletRequest request, Object data) {
        request.getSession().setAttribute(SESSION_USER_LOGIN_INFO, data);
    }
   
    /**
     * 
     * TODO 设置微信第三方授权的数据id
     * @param request
     * @param id
     */
    public static void setUserWeChateThirdId(HttpServletRequest request, Object id) {
        request.getSession().setAttribute(SESSION_WECHATE_THIRD_ID, id);
    }
    
    /**
     * 
     * TODO 取微信第三方授权的数据id
     * @param request
     * @param id
     * @return 
     */
    public static String getUserWeChateThirdId(HttpServletRequest request) {
        return (String) request.getSession().getAttribute(SESSION_WECHATE_THIRD_ID);
    }
    
    /**
     * 
     * TODO 将数据按键值对存入session.
     * @param request
     * @param key
     * @param value
     */
    public static void setDataToSession(HttpServletRequest request, String key, Object value) {
        request.getSession().setAttribute(key, value);
    }
    
    /**
     * 
     * TODO 按"键"取出在session中相对应的值.
     * @param request
     * @param key
     * @param clazz
     * @return
     */
    public static <T> T getDataFromSession(HttpServletRequest request, String key, Class<T> clazz) {
        return (T) request.getSession().getAttribute(key);
    }
    
    /**
     * 
     * TODO remove 按键值删除session中相对应的数据.
     * @param request
     * @param key
     */
    public static void removeSessionAttribut(HttpServletRequest request, String key) {
        request.getSession().removeAttribute(key);
    }
    
    
}
