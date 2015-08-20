package com.likg.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.likg.auth.domain.User;
import com.likg.auth.service.UserService;

public class MyUsernamePasswordAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MyUsernamePasswordAuthenticationFilter.class);
	
	public static final String USERNAME = "userName";
	public static final String PASSWORD = "password";

	private UserService userService;
	//private ImageCaptchaService imageCaptchaService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) 
			throws AuthenticationException {
		if (!request.getMethod().equals("POST")) {
			throw new AuthenticationServiceException("Authentication method not supported: " + request.getMethod());
		}
		
		// 获取用户名和密码
		String username = obtainUsername(request).trim();
		String password = obtainPassword(request);
		
		try {
			// 判断验证码是否正确
			//String captcha = request.getParameter("captcha");
//			if (!imageCaptchaService.validateResponseForID(request.getSession().getId(), captcha)) {
//				request.getRequestDispatcher("/LoginController.do?method=captchaError").forward(request, response);
//				return null;
//			}
			
			//获取用户信息
			User user = this.userService.getUserByUserName(username);
			
			//用户不存在
			if (user == null) {
				request.getRequestDispatcher("/LoginController.do?method=userNameNotFound").forward(request, response);
				return null;
			}
			//密码不正确
			else if (!password.equals(user.getPassword())) {
				request.getRequestDispatcher("/LoginController.do?method=passwordError").forward(request, response);
				return null;
			}
			
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// UsernamePasswordAuthenticationToken实现 Authentication
		UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password);

		// 允许子类设置详细属性
		setDetails(request, authRequest);

		// 运行UserDetailsService的loadUserByUsername 再次封装Authentication
		return this.getAuthenticationManager().authenticate(authRequest);
	}

	

	@Override
	protected String obtainUsername(HttpServletRequest request) {
		Object obj = request.getParameter(USERNAME);
		return null == obj ? "" : obj.toString();
	}

	@Override
	protected String obtainPassword(HttpServletRequest request) {
		Object obj = request.getParameter(PASSWORD);
		return null == obj ? "" : obj.toString();
	}

}
