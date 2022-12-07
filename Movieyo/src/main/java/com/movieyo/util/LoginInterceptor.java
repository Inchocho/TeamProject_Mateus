package com.movieyo.util;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.movieyo.user.dto.UserDto;
 
public class LoginInterceptor extends HandlerInterceptorAdapter{
 
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("userDto");

        if(userDto == null){
        	
            response.sendRedirect(request.getContextPath() + "/auth/login.do");
            return false;
        }

        
        return true;
    }
 
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler
    		, ModelAndView modelAndView) throws Exception {
    	
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response
    		, Object handler, Exception ex) throws Exception {
    }
    
}


 