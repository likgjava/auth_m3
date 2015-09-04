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
public class InsideLetterUser {

	/**
	 * 记录号
	 */
	private int id;
	
	/**
	 * 用户名
	 */
	private int insideLetterId;
	
	/**
	 * 密码
	 */
	private int userId;
	
	/**
	 * 真实姓名
	 */
	private boolean isRead;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getInsideLetterId() {
		return insideLetterId;
	}

	public void setInsideLetterId(int insideLetterId) {
		this.insideLetterId = insideLetterId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public boolean isRead() {
		return isRead;
	}

	public void setRead(boolean isRead) {
		this.isRead = isRead;
	}
	

}
