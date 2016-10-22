package com.pwx.video_sharing.common.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.pwx.video_sharing.common.util.MD5Util;
import com.pwx.video_sharing.user.entity.Cms_Roles;
import com.pwx.video_sharing.user.entity.Cms_Users;
import com.pwx.video_sharing.user.service.ICmsUserService;




@Repository("CmsUserDetailService")
public class CmsUserDetailService implements UserDetailsService {
    
	@Resource
	private ICmsUserService cmsUserService;
	
//	@Resource
//    private IChildAccountService childAccountService;
	
	@Resource
	private HttpServletRequest request;
	
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
	    
	    UserDetails user = null;
	    
	    String password = request.getParameter("password");
	    String password1 = request.getParameter("password");
	    String loginName = request.getParameter("username");
	    //注册成功直接登录效验
	    String md5Username = username;
        String registerStatus = (String) request.getParameter("register_Return_Status");
	    //密码加密验证
	    try {
	        password = MD5Util.md5Encode(password);
	        md5Username = MD5Util.md5Encode(username);
        } catch (Exception e) {
            request.getSession().setAttribute("ErrorMessage", "用户名或密码不存在");
            return user;
        }
	    
	    if(username==null && "".equals(username)){
	        request.getSession().setAttribute("ErrorMessage", "用户名为空");
	        return user;
	    }else if(password==null && "".equals(password)){
	        request.getSession().setAttribute("ErrorMessage", "密码为空");
            return user;
	    }else if(registerStatus!=null && !"".equals(registerStatus)){
	        //登录状态返回值与用户名加密相等 则是注册后直接跳转可不用验证码登录
	        if(registerStatus.equals(md5Username)){
	            
	        }else{
	            if(!verifyCodeIsTrue(request)){
	                request.getSession().setAttribute("errorUsername", username);
	                return user;
	            }
	                
	        }
	    }else if(!verifyCodeIsTrue(request)){
	        request.getSession().setAttribute("errorUsername", username);
	        return user;
	    }else{
	        
	    }

	    //获取用户
	    Cms_Users cmsUsers = cmsUserService.findUserByuserName(username);
        
        if (cmsUsers != null) {
            if(password.equals(cmsUsers.getPassword())){
                request.getSession().setAttribute("CMS_USER_INFO", cmsUsers);
                try {
                    user = new org.springframework.security.core.userdetails.User(
                        username, cmsUsers.getPassword(), true, true, true, true,
                        findUserAuthorities(cmsUsers));
                    if(user.getAuthorities().size()>0){
                        request.getSession().removeAttribute("ErrorMessage");
                    }else{
                        request.getSession().setAttribute("ErrorMessage", "抱歉,您没有权限进入");
                    }
                } catch (Exception e) {
                    request.getSession().setAttribute("ErrorMessage", "系统异常");
                    e.printStackTrace();
                }
            }else{
                request.getSession().setAttribute("ErrorMessage", "用户名或密码有误");
            }
        }else{
            request.getSession().setAttribute("ErrorMessage", "该号码尚未注册,请先注册");
        }
        
		return user;
	}

	/**
	 * 
	 * TODO 获取当前用户登录权限信息.
	 * @param user
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public Collection<GrantedAuthority> findUserAuthorities(Cms_Users user) {
		List<GrantedAuthority> autthorities = new ArrayList<GrantedAuthority>();
		List<Cms_Roles> roles = user.getCms_roles();
		for (Cms_Roles role : roles) {
			autthorities.add(new GrantedAuthorityImpl(role.getRoleCode()));
		}
		/*if(autthorities.size()==1){
		    //最低权限, 为刚注册时的权限
		    String role = "ROLE_COMM".toUpperCase();
		    if(role.equals(autthorities.get(0).toString())){
		        request.getSession().setAttribute("UserState", "false");
		    } 
		}else{
		    request.getSession().setAttribute("UserState", "true");
		}*/
		return autthorities;
	}
	
	public static boolean verifyCodeIsTrue(HttpServletRequest request){
	    //验证码生成时 存放的session -->validateCode
	    String validateC = (String) request.getSession().getAttribute("validateCode");
	    String veryCode = request.getParameter("veryCode");
	    validateC = validateC.toUpperCase();
	    if(veryCode != null)
	        veryCode = veryCode.toUpperCase();
	    
        if(veryCode==null||"".equals(veryCode)){
            request.getSession().setAttribute("ErrorMessage", "验证码为空");
            return false;
        }else{    
            if(validateC.equals(veryCode)){
                return true;
            }else{
                request.getSession().setAttribute("ErrorMessage", "验证码错误");
                return false;
            }
        }
	}
	

}
