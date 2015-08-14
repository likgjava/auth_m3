package com.likg.auth.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 用户对象
 * 添加Spring Security功能，需要实现UserDetails接口
 * @author likaige
 * @create 2015年8月13日 上午9:35:30
 */
public class User implements UserDetails {

	private static final long serialVersionUID = 1L;

	/**
	 * 记录号
	 */
	private int id;
	
	/**
	 * 用户名
	 */
	private String userName;
	
	/**
	 * 密码
	 */
	@JsonIgnore
	private String password;
	
	/**
	 * 真实姓名
	 */
	private String realName;
	
	/**
	 * 使用状态[1:有效；2:禁用]
	 */
	private int status;
	
	/**
	 * 创建时间
	 */
	private Timestamp createTime;
	
	/**
	 * 角色列表
	 */
	private List<Role> roleList = new ArrayList<Role>();
	
	/**重写Spring security中UserDetails的方法*/
	//@Transient
	private Set<GrantedAuthority> authorities;
	//@Transient
	private boolean accountNonExpired;
	//@Transient
	private boolean accountNonLocked;
	//@Transient
	private boolean credentialsNonExpired;
	//@Transient
	private boolean enabled;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	
	

	public void setAuthorities(Set<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}

}
