package com.likg.auth.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.likg.auth.domain.Menu;
import com.likg.auth.service.MenuService;

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
	
	@ResponseBody
	@RequestMapping("getMenuTree")
	public List<Map<String, String>> getMenuTree(Integer id){
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		
		List<Menu> menuList = menuService.getMenuList(id);
		for(Menu menu : menuList){
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", menu.getId()+"");
			map.put("text", menu.getMenuName());
			map.put("state", menu.getIsLeaf() ? "open" : "closed");
			map.put("url", menu.getResource().getResUrl());
			list.add(map);
		}
		
		//[{"id":"1","text":"Node 1","state":"closed"},{"id":"2","text":"Node 2","state":"open"},{"id":"3","text"
		//:"Node 3","state":"open"},{"id":"4","text":"Node 4","state":"open"}]
		/*if(id == null){
			Map<String, String> map1 = new HashMap<String, String>();
			map1.put("id", "1");
			map1.put("text", "1111");
			map1.put("state", "closed");
			map1.put("url", "http://www.163.com");
			list.add(map1);
			
			Map<String, String> map2 = new HashMap<String, String>();
			map2.put("id", "2");
			map2.put("text", "22222");
			map2.put("state", "open");
			map2.put("url", "/UserController/toList.do");
			list.add(map2);
		}else{
			Map<String, String> map1 = new HashMap<String, String>();
			map1.put("id", "3");
			map1.put("text", "3333");
			map1.put("state", "open");
			map1.put("url", "http://www.qq.com");
			list.add(map1);
			
		}*/
		
		
		return list;
	}
	
	
	
}
