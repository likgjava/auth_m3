package com.likg.msg.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
	private String content;
	
	/**
	 * 真实姓名
	 */
	private String createUsername;
	
	private int sendUserId;
	
	/**
	 * 创建时间
	 */
	private Timestamp createTime;
	
	/**
	 * 角色列表
	 */
	//private List<Role> roleList = new ArrayList<Role>();
	
	private String recipient;
	
	//收件人列表
	//private List<Integer> recipientList = new ArrayList<Integer>();
	private List<InsideLetterUser> recipientList = new ArrayList<InsideLetterUser>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSendUserId() {
		return sendUserId;
	}

	public void setSendUserId(int sendUserId) {
		this.sendUserId = sendUserId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreateUsername() {
		return createUsername;
	}

	public void setCreateUsername(String createUsername) {
		this.createUsername = createUsername;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public List<InsideLetterUser> getRecipientList() {
		return recipientList;
	}

	public void setRecipientList(List<InsideLetterUser> recipientList) {
		this.recipientList = recipientList;
	}
	
}
