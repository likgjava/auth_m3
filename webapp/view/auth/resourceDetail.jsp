<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>

<table border="1" class="ftable">
<tbody>
	<tr>
		<td class="flabel">上级资源:</td>
		<td class="fcontent"><span>${resource.parent.resName }</span></td>
	</tr>
	<tr>
		<td class="flabel">资源名称:</td>
		<td class="fcontent"><span>${resource.resName }</span></td>
	</tr>
	<tr>
		<td class="flabel">资源路径:</td>
		<td class="fcontent"><span>${resource.resUrl}</span></td>
	</tr>
	<tr>
		<td class="flabel">资源描述:</td>
		<td class="fcontent">${resource.resDesc }</td>
	</tr>
</tbody>
</table>
