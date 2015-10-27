package com.tatvasoft.intercepter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;



public class LoginIntercepter implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object arg2, Exception arg3)
					throws Exception {
		System.out.println("inside after completion!!");

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2, ModelAndView arg3) throws Exception {
		System.out.println("inside post handler!!");

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		System.out.println("inside prehandler!!");
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);


		String url=request.getRequestURI();
		HttpSession session=request.getSession();
		
		if (session.getAttribute("user") != null) {
			
			if (url.contains("register") || url.contains("login")) {
				response.sendRedirect("listUser");
			} else {
				return true ;
			}
			
		} else {
			if(url.contains(".css") || url.contains("login")|| url.contains("images") || 
					url.contains(".js") || url.contains("register") ) {
				return true ;
			} else {
				response.sendRedirect("login");
			}
		}
		
		
		/*if(url.contains(".css") ||( url.contains("login")  && session.getAttribute("user") == null)|| url.contains("images") || 
				url.contains(".js") || url.contains("/register") )
		{
			return true ;
		} 
		else if(session.getAttribute("user") != null && !url.contains("login")){
			return true;
		} */
		return false;
	}



}
