package com.likg.common.domain;

import java.util.ArrayList;
import java.util.List;

public class EasyuiTree {

	private String id;
	
	private String text;
	
	private String state;
	
	private boolean checked;
	
	private List<EasyuiTree> children = new ArrayList<EasyuiTree>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public List<EasyuiTree> getChildren() {
		return children;
	}

	public void setChildren(List<EasyuiTree> children) {
		this.children = children;
	}
	
}
