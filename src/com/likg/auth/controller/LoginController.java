package com.likg.auth.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.likg.auth.domain.User;
import com.likg.common.Constants;
import com.likg.security.AuthenticationHelper;

@Controller
@RequestMapping("/LoginController")
public class LoginController {
	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LoginController.class);
	
	/**
	 * 处理spring security验证“用户名不存在”的结果
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(params={"method=userNameNotFound"})
	public Map<String, Object> userNameNotFound() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put(Constants.SUCCESS, false);
		model.put(Constants.RESULT, "用户名不存在");
	    return model;
	}
	
	/**
	 * 处理spring security验证“验证码不正确”的结果
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params={"method=captchaError"})
	public ModelAndView captchaError() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put(Constants.SUCCESS, false);
		model.put(Constants.RESULT, "验证码不正确");
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	
	/**
	 * 处理spring security验证“密码不正确”的结果
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(params={"method=passwordError"})
	public Map<String, Object> passwordError() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put(Constants.SUCCESS, false);
		model.put(Constants.RESULT, "密码不正确");
		return model;
	}

	/**
	 * Spring security 验证登录成功后调用该方法
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(params="method=login")
	public Map<String, Object> login(HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//获取当前用户的信息
		User user = AuthenticationHelper.getCurrentUser();
		model.put(Constants.SUCCESS, true);
		
		Object o = request.getParameterNames();
		
	System.out.println(user == null);
		
		//把当前用户的信息放到session中
		request.getSession().setAttribute("currentUser", user);
		
		return model;
	}
	
	/**
	 * 退出系统，并重定向到首页
	 */
	@RequestMapping("logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//设置session失效
		request.getSession().invalidate();
		
		//重定向到首页
		response.sendRedirect(request.getContextPath());
	}

}
