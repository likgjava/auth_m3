package com.likg.auth.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.likg.framework.MyDateSerializer;

public class Role implements Serializable {

	private static final long serialVersionUID = 1L;

	/**记录号*/
	private int id;
	
	/**角色名称*/
	private String roleName;
	
	/**角色中文名称*/
	private String roleChName;
	
	/**角色描述*/
	private String roleDesc;
	
	/**创建时间*/
	@JsonSerialize(using=MyDateSerializer.class)
	private Timestamp createTime;
	
	/**资源列表*/
	private Set<Resource> resourceSet = new HashSet<Resource>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleChName() {
		return roleChName;
	}

	public void setRoleChName(String roleChName) {
		this.roleChName = roleChName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Set<Resource> getResourceSet() {
		return resourceSet;
	}

	public void setResourceSet(Set<Resource> resourceSet) {
		this.resourceSet = resourceSet;
	}
	
}
