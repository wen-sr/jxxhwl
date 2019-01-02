package com.jxxhwl.jc.filter;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.jxxhwl.common.dao.UserDao;
import com.jxxhwl.common.entity.User;

import java.io.IOException;


public class LoginFilter implements Filter {
	@Autowired
	UserDao userDao;

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        User sysUser = (User)request.getSession().getAttribute("user");
        if (sysUser == null) {
        	Cookie[] cookies = request.getCookies();
            if(null!=cookies) {
                for (Cookie cookie : cookies) {
                	if("userId".equals(cookie.getName()) && cookie.getValue() != ""){
                		String id = cookie.getValue();
                		sysUser = userDao.getUser(id);
                		if(sysUser != null){
                			session.setAttribute("name", sysUser.getUsername());
                			session.setAttribute("id", sysUser.getId());
                			session.setAttribute("user", sysUser);
                			break;
                		}
                	}
                }
            }
            if(sysUser.getId() == null) {
            	response.sendRedirect("/login");
            }
        	
//            String path = "/login";
//            resp.sendRedirect(path);
            return;
        }
        filterChain.doFilter(servletRequest, servletResponse);
        return;
    }

    public void destroy() {

    }
}
