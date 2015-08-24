<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>

<table class="ftable" border="1">
<tbody>
	<tr>
		<td class="flabel">上级菜单:</td>
		<td class="fcontent"><span>${menu.parent.menuName }</span></td>
	</tr>
	<tr>
		<td class="flabel">菜单名称:</td>
		<td class="fcontent"><span>${menu.menuName }</span></td>
	</tr>
	<tr>
		<td class="flabel">菜单资源:</td>
		<td class="fcontent"><span>${menu.resource.resName}</span></td>
	</tr>
	<tr>
		<td class="flabel">菜单描述:</td>
		<td class="fcontent">${menu.menuDesc }</td>
	</tr>
</tbody>
</table>
