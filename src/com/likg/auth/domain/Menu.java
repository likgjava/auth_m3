package com.likg.auth.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Menu {

	private static final long serialVersionUID = 1638300741655156017L;

	/**记录号*/
	private String id;
	
	/**记录号*/
	private String parentId;
	
	/**父菜单*/
	private Menu parent;
	
	/**关联资源*/
	private String resId;
	
	/**关联资源*/
	private Resource resource;
	
	/**菜单名称*/
	private String menuName;
	
	/*菜单描述*/
	private String menuDesc;
	
	/**菜单级别*/
	private Short treeLevel;
	
	/**是否叶子节点*/
	private Boolean isLeaf;
	
	/**菜单样式*/
	private String menuCss;
	
	/**创建人*/
	private User createUser;
	
	/**创建时间*/
	private Date createTime;
	
	private Set<Menu> children = new HashSet<Menu>();

	public String getId() {
		return id;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getResId() {
		return resId;
	}

	public void setResId(String resId) {
		this.resId = resId;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Menu getParent() {
		return parent;
	}

	public void setParent(Menu parent) {
		this.parent = parent;
	}

	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuDesc() {
		return menuDesc;
	}

	public void setMenuDesc(String menuDesc) {
		this.menuDesc = menuDesc;
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

	public String getMenuCss() {
		return menuCss;
	}

	public void setMenuCss(String menuCss) {
		this.menuCss = menuCss;
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

	public Set<Menu> getChildren() {
		return children;
	}

	public void setChildren(Set<Menu> children) {
		this.children = children;
	}


}
