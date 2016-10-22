/**
 * Copyright © 2014 Winit Corp. All rights reserved.
 * This software is proprietary to and embodies the confidential
 * technology of Winit Corp.  Possession, use, or copying
 * of this software and media is authorized only pursuant to a
 * valid written license from Winit Corp or an authorized sublicensor.
 */
package com.pwx.video_sharing.common.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;

/**
 * <描述这个类>
 * 
 * @version 
 * Ajax请求的Session超时处理(超时后返回首页)
 * Author	Version		Date		Changes
 * bianwc 	1.0  		2016年4月6日 	Created
 *
 * </pre>
 * @since 1.
 */

public class AjaxSessionTimeoutFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;  
        HttpServletResponse res = (HttpServletResponse) response;  
        // 判断session里是否有用户信息  
        if (req.getSession().getAttribute("CMS_USER_INFO") == null){
            // 如果是ajax请求响应头会有，x-requested-with；  
            if (req.getHeader("x-requested-with") != null && req.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){
            	if(null != SecurityContextHolder.getContext().getAuthentication()) {
            		res.sendError(68001, "登录超 时或无效！");
            		res.setHeader("sessionstatus", "timeout");
            	}
            }else{
                chain.doFilter(req, res);
            }
        }else{
            chain.doFilter(req, res);  
        }
	}

	@Override
	public void destroy() {
	}

}
