package com.likg.auth.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Resource {

	private static final long serialVersionUID = 1L;

	/**记录号*/
	private String id;
	
	/**记录号*/
	private String parentId;
	
	/**父资源*/
	private Resource parent;
	
	/**资源名称*/
	private String resName;
	
	/**资源路径*/
	private String resUrl;
	
	/**资源描述*/
	private String resDesc;
	
	/**资源级别*/
	private Short treeLevel;
	
	/**是否叶子节点*/
	private Boolean isLeaf;
	
	/**创建人*/
	private User createUser;
	
	/**创建时间*/
	private Date createTime;
	
	/**角色资源中间表*/
	//private Set<Role> roles = new HashSet<Role>();

	private Set<Resource> children = new HashSet<Resource>();

	public String getId() {
		return id;
	}

	public void setId(String objId) {
		this.id = objId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public Resource getParent() {
		return parent;
	}

	public void setParent(Resource parent) {
		this.parent = parent;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getResUrl() {
		return resUrl;
	}

	public void setResUrl(String resUrl) {
		this.resUrl = resUrl;
	}

	public String getResDesc() {
		return resDesc;
	}

	public void setResDesc(String resDesc) {
		this.resDesc = resDesc;
	}

	public Short getTreeLevel() {
		return treeLevel;
	}

	public void setTreeLevel(Short treeLevel) {
		this.treeLevel = treeLevel;
	}

	public Boolean getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(Boolean isLeaf) {
		this.isLeaf = isLeaf;
	}

	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Set<Resource> getChildren() {
		return children;
	}

	public void setChildren(Set<Resource> children) {
		this.children = children;
	}

}
