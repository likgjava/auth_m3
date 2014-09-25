package com.likg.auth.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.likg.auth.domain.EasyuiPage;
import com.likg.auth.domain.Role;
import com.likg.auth.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	private static Logger log = Logger.getLogger(RoleController.class);
	
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
		return "view/auth/roleList";
	}
	
	/**
	 * 分页获取列表数据
	 * @param role
	 * @param page
	 * @param rows
	 * @return
	 * @author likaige
	 * @create 2014年3月13日 下午5:05:55
	 */
	@ResponseBody
	@RequestMapping("/getPage")
	public EasyuiPage<Role> getPage(Role role, EasyuiPage<Role> page) {
		try {
			page = roleService.getPage(page, role);
		} catch (Exception e) {
			log.error("出现异常：", e);
		}
		return page;
	}
	
	/**
	 * 跳转到维护页面
	 * @param id
	 * @return
	 * @author likaige
	 * @create 2014年3月13日 下午5:06:31
	 */
	@RequestMapping("/toRoleForm")
	public ModelAndView toRoleForm(Integer id) {
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			Role role = new Role();
			if(id != null) {
				role = roleService.getRole(id);
			}
			model.put("role", role);
		} catch (Exception e) {
			log.error("出现异常：", e);
		}
		return new ModelAndView("view/auth/roleForm", model);
	}
	
	/**
	 * 保存
	 * @param role
	 * @return
	 * @author likaige
	 * @create 2014年3月13日 下午4:48:41
	 */
	@RequestMapping("/save")
	public void save(HttpServletResponse response, Role role) {
		String result = "success";
		try {
			roleService.saveRole(role);
		} catch (Exception e) {
			result = e.toString();
			log.error("出现异常：", e);
		}
		this.renderText(response, result);
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
	public Map<String, Object> delete(int id) {
		String result = "success";
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			roleService.delete(id);
		} catch (Exception e) {
			result = e.toString();
			log.error("出现异常：", e);
		}
		model.put("result", result);
		return model;
	}
	
	/**
	 * 返回文本信息
	 * @param text 文本内容
	 * @author likaige
	 * @create 2014年3月4日 上午10:10:37
	 */
	private void renderText(HttpServletResponse response, String text) {
		response.setContentType("text/plain;charset=UTF-8");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		try {
			response.getWriter().write(text);
		} catch (IOException e) {
			log.error("出现异常：", e);
		}
	}
}
