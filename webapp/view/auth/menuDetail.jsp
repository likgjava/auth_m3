<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>

<form>
	<table class="ftable" border="1">
	<tbody>
		<tr>
			<td class="flabel">上级菜单:</td>
			<td class="fcontent" colspan="3"><span>${menu.parent.menuName }</span></td>
		</tr>
		<tr>
			<td class="flabel">菜单名称:</td>
			<td class="fcontent" colspan="3"><span>${menu.menuName }</span></td>
		</tr>
		<tr>
			<td class="flabel">菜单资源:</td>
			<td class="fcontent" colspan="3"><span>${menu.resource.resName}</span></td>
		</tr>
		<tr>
			<td class="flabel">菜单描述:</td>
			<td class="fcontent" colspan="3">${menu.menuDesc }</td>
		</tr>
	</tbody>
	</table>
</form>