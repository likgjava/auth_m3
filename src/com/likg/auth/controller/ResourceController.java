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
import com.likg.common.domain.EasyuiTree;

@Controller
@RequestMapping("/ResourceController")
public class ResourceController {
	
	@javax.annotation.Resource
	private ResourceService resourceService;
	
	/**
	 * 跳转到资源管理页面
	 * @return
	 * @author likaige
	 * @create 2015年8月26日 上午9:02:36
	 */
	@RequestMapping("/toList")
	public String toList() {
		return "view/auth/resourceList";
	}
	
	/**
	 * 加载资源树
	 * @param id
	 * @return
	 * @author likaige
	 * @create 2015年8月18日 下午5:17:20
	 */
	@ResponseBody
	@RequestMapping("getResourceList")
	public List<EasyuiTree> getResourceList(String id){
		List<EasyuiTree> list = new ArrayList<EasyuiTree>();
		
		//首次加载
		if(id == null){
			EasyuiTree root = new EasyuiTree();
			root.setId("0");
			root.setText("资源树");
			root.setState("open");
			list.add(root);
			
			//获取一级菜单
			List<Resource> menuList = resourceService.getResourceList(null);
			for(Resource r : menuList){
				EasyuiTree node = new EasyuiTree();
				node.setId(r.getId()+"");
				node.setText(r.getResName());
				node.setState(r.getIsLeaf() ? "open" : "closed");
				root.getChildren().add(node);
			}
		}else{
			List<Resource> menuList = resourceService.getResourceList("0".equals(id) ? null : id);
			for(Resource r : menuList){
				EasyuiTree node = new EasyuiTree();
				node.setId(r.getId()+"");
				node.setText(r.getResName());
				node.setState(r.getIsLeaf() ? "open" : "closed");
				list.add(node);
			}
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
		
		return new ModelAndView("view/auth/resourceForm", model);
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
		
		return new ModelAndView("view/auth/resourceDetail", model);
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
	
	
	
	
	
	@RequestMapping("toAllotResourceView")
	public ModelAndView toAllotResourceView(String roleId, String[] resIds, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//分配资源
		//resourceService.allotResource(roleId, resIds);
		model.put(Constants.SUCCESS, true);
		
		return new ModelAndView("view/auth/allotResource", model);
	}
	
	
	
}
