package com.likg.auth.domain;

import java.io.Serializable;
import java.sql.Timestamp;

//AUTH_ROLE
public class Role implements Serializable {

	private static final long serialVersionUID = -8261510674390717923L;

	/**记录号*/
	private int id;
	
	/**角色名称*/
	//@Column(name="ROLE_NAME", length=20)
	private String roleName;
	
	/**角色中文名称*/
	//@Column(name="ROLE_CH_NAME", length=40)
	private String roleChName;
	
	/*角色描述*/
	//@Column(name="ROLE_DESC", length=100)
	private String roleDesc;
	
	/*创建时间*/
	//@Temporal(TemporalType.TIMESTAMP)
	//@Column(name="CREATE_TIME")
	private Timestamp createTime;

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
	
}
