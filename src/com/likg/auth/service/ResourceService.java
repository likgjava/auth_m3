package com.likg.auth.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.likg.auth.dao.ResourceMapper;
import com.likg.auth.domain.Menu;
import com.likg.auth.domain.Resource;

@Service
public class ResourceService  {
	@javax.annotation.Resource
	private ResourceMapper resourceMapper;
	
	public List<Resource> getResourceList(){
		List<Resource> list =this.resourceMapper.getResourceList(); 
		return list;
	}

	public List<Resource> getResourceList(Integer parentId) {
		return resourceMapper.getResourceListByParentId(parentId==null ? 0 : parentId);
	}

	public Resource get(int id) {
		return resourceMapper.get(id);
	}

	public void saveResource(Resource resource) {
		resourceMapper.saveResource(resource);
	}
}
