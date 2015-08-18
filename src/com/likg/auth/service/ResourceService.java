package com.likg.auth.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.likg.auth.dao.ResourceMapper;
import com.likg.auth.domain.Resource;
import com.likg.common.dao.TreeDao;

@Service
public class ResourceService  {
	@javax.annotation.Resource
	private ResourceMapper resourceMapper;
	
	@javax.annotation.Resource
	private TreeDao treeDao;
	
	public List<Resource> getResourceList(){
		List<Resource> list =this.resourceMapper.getResourceList(); 
		return list;
	}

	public List<Resource> getResourceList(String parentId) {
		return resourceMapper.getResourceListByParentId(parentId);
	}

	public Resource get(String id) {
		return resourceMapper.get(id);
	}

	public void saveResource(Resource resource) {
		//新增
		if(StringUtils.isBlank(resource.getId())) {
			//修改父节点isLeaf的属性值
			String parentId = resource.getParentId();
			if(!StringUtils.isBlank(parentId)) {
				Resource parentResource = resourceMapper.get(parentId);
				if(parentResource.getIsLeaf()) {
					parentResource.setIsLeaf(false);
					resourceMapper.update(parentResource);
				}
			}
			
			//保存节点对象
			resource.setIsLeaf(true);
			if(StringUtils.isBlank(parentId)) {
				resource.setParentId(null);
			}
			String prefix = (StringUtils.isBlank(parentId) ? treeDao.RESOURCE_PREFIX : parentId);
			resource.setId(treeDao.getSequenceNo("auth_resource", prefix));
			resourceMapper.save(resource);
			
		}
		//修改
		else {
			Resource oldResource = resourceMapper.get(resource.getId());
			oldResource.setResName(resource.getResName());
			oldResource.setResDesc(resource.getResDesc());
			oldResource.setResUrl(resource.getResUrl());
			resourceMapper.update2(oldResource);
		}
	}
	
	/**
	 * 删除节点及其所有子孙节点
	 * @param objId
	 */
	@Transactional
	public void removeAll(String objId) throws Exception {
		//删除节点及其所有子孙节点
		treeDao.removeAll(objId, "auth_resource");
		
	}

	public List<Resource> getAllResourceList() {
		return resourceMapper.getAllResourceList();
	}

	public List<Resource> getResourceListByRole(Integer roleId) {
		return resourceMapper.getResourceListByRole(roleId);
	}
}
