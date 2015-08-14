package com.likg.auth.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.likg.auth.domain.Resource;
import com.likg.auth.service.ResourceService;

/**
 * @springmvc.view value="resourceFormView" url="view/auth/resource/resource_form.jsp"
 * @springmvc.view value="resourceDetailView" url="view/auth/resource/resource_detail.jsp"
 *
 */

@Controller
@RequestMapping("/ResourceController")
public class ResourceController {
	
	@javax.annotation.Resource
	private ResourceService resourceService;
	
	@RequestMapping("/toList")
	public String toList() {
		return "view/auth/resourceList";
	}
	
	
	@ResponseBody
	@RequestMapping("getResourceTree")
	public List<Map<String, String>> getResourceTree(Integer id){
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		
		List<Resource> menuList = resourceService.getResourceList(id);
		for(Resource r : menuList){
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", r.getId()+"");
			map.put("text", r.getResName());
			map.put("state", r.getIsLeaf() ? "open" : "closed");
			list.add(map);
		}
		
		
		
		return list;
	}
}
