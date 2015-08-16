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

import com.likg.auth.domain.Resource;
import com.likg.auth.service.ResourceService;
import com.likg.common.Constants;

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
	public List<Map<String, String>> getResourceTree(String id){
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		
		if(id == null){
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", "0");
			map.put("text", "资源树");
			map.put("state", "closed");
			list.add(map);
			return list;
		}
		
		List<Resource> menuList = resourceService.getResourceList("0".equals(id) ? null : id);
		for(Resource r : menuList){
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", r.getId()+"");
			map.put("text", r.getResName());
			map.put("state", r.getIsLeaf() ? "open" : "closed");
			list.add(map);
		}
		
		
		
		return list;
	}
	
	
	@RequestMapping("toResourceFormView")
	public ModelAndView toResourceFormView(String id, String parentId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		Resource resource = null;
		//新增
		if(id == null) {
			resource = new Resource();
			//获取父节点信息，若父节点id为空则增加一级节点
			//String parentId = request.getParameter("parentId");
			if(parentId != null) {
				Resource parentResource = resourceService.get(parentId);
				resource.setParent(parentResource);
				resource.setParentId(parentId);
			}
			
			//设置层级
			//resource.setTreeLevel(Short.valueOf(request.getParameter("resourceLevel")));
		}
		else {
			resource = resourceService.get(id);
		}
		model.put("resource", resource);
		
		return new ModelAndView("view/auth/resource_form", model);
	}
	
	/**
	 * 跳转到资源详情页面
	 * @param objId 资源对象id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("toResourceDetailView")
	public ModelAndView toResourceDetailView(String id, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		Resource resource = resourceService.get(id);
		model.put("resource", resource);
		
		return new ModelAndView("view/auth/resource_detail", model);
	}
	
	@ResponseBody
	@RequestMapping("save")
	public Map<String, Object> save(Resource Resource, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//保存资源信息
		resourceService.saveResource(Resource);
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
		resourceService.removeAll(id);
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
	@RequestMapping(params="method=allotResource")
	public ModelAndView allotResource(String roleId, String[] resIds, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//分配资源
		//resourceService.allotResource(roleId, resIds);
		model.put(Constants.SUCCESS, true);
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
}
