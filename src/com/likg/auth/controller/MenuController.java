package com.likg.auth.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.likg.auth.domain.Menu;
import com.likg.auth.domain.User;
import com.likg.auth.service.MenuService;
import com.likg.common.Constants;
import com.likg.security.AuthenticationHelper;

/**
 * @springmvc.view value="menuFormView" url="view/auth/menu/menu_form.jsp"
 * @springmvc.view value="menuDetailView" url="view/auth/menu/menu_detail.jsp"
 * @springmvc.view value="secondLevelMenuListView" url="/view/auth/desktop/left.jsp"
 *
 */
@Controller
@RequestMapping("/MenuController")
public class MenuController {
	@javax.annotation.Resource
	private MenuService menuService;
	
	@RequestMapping("/toList")
	public String toList() {
		return "view/auth/menuList";
	}
	
	
	/**
	 * 获取导航菜单树
	 * @param id 父节点的id
	 * @return
	 * @author likaige
	 * @create 2015年8月18日 上午8:44:54
	 */
	@ResponseBody
	@RequestMapping("getNavigateMenuTree")
	public List<Map<String, String>> getNavigateMenuTree(String id){
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		
		User user = AuthenticationHelper.getCurrentUser();
		
		List<Menu> menuList = menuService.getNavigateMenuTree(id, user.getId());
		for(Menu menu : menuList){
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", menu.getId()+"");
			map.put("text", menu.getMenuName());
			map.put("state", menu.getIsLeaf() ? "open" : "closed");
			map.put("url", menu.getResource().getResUrl());
			list.add(map);
		}
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("getMenuList")
	public List<Map<String, String>> getMenuList(String id){
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		
		if(id == null){
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", "0");
			map.put("text", "菜单树");
			map.put("state", "closed");
			list.add(map);
			return list;
		}
		
		List<Menu> menuList = menuService.getMenuList("0".equals(id) ? null : id);
		for(Menu r : menuList){
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", r.getId()+"");
			map.put("text", r.getMenuName());
			map.put("state", r.getIsLeaf() ? "open" : "closed");
			list.add(map);
		}
		return list;
	}
	
	@RequestMapping("toMenuFormView")
	public ModelAndView toMenuFormView(String id, String parentId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		Menu Menu = null;
		//新增
		if(id == null) {
			Menu = new Menu();
			//获取父节点信息，若父节点id为空则增加一级节点
			//String parentId = request.getParameter("parentId");
			if(parentId != null) {
				Menu parentMenu = menuService.get(parentId);
				Menu.setParent(parentMenu);
				Menu.setParentId(parentId);
			}
			
			//设置层级
			//Menu.setTreeLevel(Short.valueOf(request.getParameter("MenuLevel")));
		}
		else {
			Menu = menuService.get(id);
		}
		model.put("menu", Menu);
		
		return new ModelAndView("view/auth/menuForm", model);
	}
	
	/**
	 * 跳转到资源详情页面
	 * @param objId 资源对象id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("toMenuDetailView")
	public ModelAndView toMenuDetailView(String id, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		Menu Menu = menuService.get(id);
		model.put("menu", Menu);
		
		return new ModelAndView("view/auth/menuDetail", model);
	}
	
	@ResponseBody
	@RequestMapping("save")
	public Map<String, Object> save(Menu menu, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//保存资源信息
		menuService.saveMenu(menu);
		model.put(Constants.SUCCESS, true);
		
		return model;
	}
	
	/**
	 * 删除节点及其所有子孙节点
	 * @param objId 节点id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("removeAll")
	public Map<String, Object> removeAll(String id, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//删除节点及其所有子孙节点
		menuService.removeAll(id);
		model.put(Constants.SUCCESS, true);
		
		return model;
	}
	
	
	/**
	 * 分配角色，保存用户角色信息
	 * @param userId 用户id
	 * @param roleIds 角色ids
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=allotMenu")
	public ModelAndView allotMenu(String roleId, String[] resIds, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//分配资源
		//menuService.allotMenu(roleId, resIds);
		model.put(Constants.SUCCESS, true);
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	
}
