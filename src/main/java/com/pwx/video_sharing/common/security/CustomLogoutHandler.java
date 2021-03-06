package com.pwx.video_sharing.common.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.stereotype.Repository;


@Repository("customLogoutSuccessHandler")
public class CustomLogoutHandler implements LogoutHandler{
    
    MyTokenBasedRememberMeServices myTokenBasedRememberMeServices = new MyTokenBasedRememberMeServices();

	@Override
	public void logout(HttpServletRequest arg0, HttpServletResponse arg1,
			Authentication arg2) {
	    
	    arg0.getSession().removeAttribute("CMS_USER_INFO");
//	    arg0.getSession().removeAttribute("CHILD_ACCOUNT_INFO");
	    myTokenBasedRememberMeServices.cancelCookies(arg0, arg1);
	}

}
