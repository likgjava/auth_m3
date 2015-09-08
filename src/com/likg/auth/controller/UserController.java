package com.likg.auth.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.likg.auth.domain.Role;
import com.likg.auth.domain.User;
import com.likg.auth.service.RoleService;
import com.likg.auth.service.UserService;
import com.likg.common.domain.EasyuiPage;
import com.likg.common.domain.JsonResult;
import com.likg.security.AuthenticationHelper;

@Controller
@RequestMapping("/UserController")
public class UserController {
	
	private static Logger log = Logger.getLogger(UserController.class);
	
	@Resource
	private UserService userService;
	@Resource
	private RoleService roleService;

	/**
	 * 跳转到列表页面
	 * @return
	 * @author likaige
	 * @create 2014年3月13日 下午5:05:17
	 */
	@RequestMapping("/toList")
	public String toList() {
		
		User user = AuthenticationHelper.getCurrentUser();
		
		System.out.println(user.getUsername());
	
		return "view/auth/userList";
	}
	
	/**
	 * 分页获取列表数据
	 * @param user 查询参数
	 * @param page 分页信息
	 * @return
	 * @author likaige
	 * @create 2014年9月24日 下午3:10:29
	 */
	@ResponseBody
	@RequestMapping("/getPage")
	public EasyuiPage<User> getPage(User user, EasyuiPage<User> page) {
		try {
			page = userService.getPage(page, user);
		} catch (Exception e) {
			log.error("出现异常：", e);
		}
		return page;
	}
	
	/**
	 * 跳转到用户详情页面
	 * @param id
	 * @return
	 * @author likaige
	 * @create 2014年3月13日 下午5:06:31
	 */
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(Integer id) {
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			//获取用户信息
			User user = userService.get(id);
			model.put("user", user);
			
			//获取用户已分配的角色
			List<Role> allottedRoleList = roleService.getRoleListByUser(user.getId());
			user.setRoleList(allottedRoleList);
		} catch (Exception e) {
			log.error("出现异常：", e);
		}
		return new ModelAndView("view/auth/userDetail", model);
	}
	
	/**
	 * 跳转到维护页面
	 * @param id
	 * @return
	 * @author likaige
	 * @create 2014年3月13日 下午5:06:31
	 */
	@RequestMapping("/toFormView")
	public ModelAndView toFormView(Integer id) {
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			//获取所有角色列表数据
			List<Role> allRoleList = roleService.getRoleList();
			model.put("allRoleList", allRoleList);
			
			User user = new User();
			if(id != null) {
				//获取用户信息
				user = userService.get(id);
				
				//获取用户已分配的角色
				List<Role> allottedRoleList = roleService.getRoleListByUser(user.getId());
				model.put("allottedRoleList", allottedRoleList);
			}
			model.put("user", user);
		} catch (Exception e) {
			log.error("出现异常：", e);
		}
		return new ModelAndView("view/auth/userForm", model);
	}
	
	/**
	 * 保存
	 * @param user
	 * @return
	 * @author likaige
	 * @create 2014年3月13日 下午4:48:41
	 */
	@ResponseBody
	@RequestMapping("/save")
	public JsonResult save(User user) {
		JsonResult result = JsonResult.getInstance();
		try {
			userService.saveUser(user);
		} catch (Exception e) {
			result = JsonResult.getFailResult(e.toString());
			log.error("出现异常：", e);
		}
		return result;
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 * @author likaige
	 * @create 2014年3月13日 下午5:00:06
	 */
	@ResponseBody
	@RequestMapping("/delete")
	public JsonResult delete(int id) {
		JsonResult result = JsonResult.getInstance();
		try {
			userService.delete(id);
		} catch (Exception e) {
			result = JsonResult.getFailResult(e.toString());
			log.error("出现异常：", e);
		}
		return result;
	}
	
}
