package com.likg.msg.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
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
public class InsideLetter {

	/**
	 * 记录号
	 */
	private int id;
	
	/**
	 * 用户名
	 */
	private String title;
	
	/**
	 * 密码
	 */
	@JsonIgnore
	private String content;
	
	/**
	 * 真实姓名
	 */
	private String createUsername;
	
	/**
	 * 创建时间
	 */
	private Timestamp createTime;
	
	/**
	 * 角色列表
	 */
	//private List<Role> roleList = new ArrayList<Role>();
	

}
