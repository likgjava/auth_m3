<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>

<table border="1" class="ftable">
<tbody>
	<tr>
		<td class="flabel">上级资源:</td>
		<td class="fcontent">${resource.parent.resName }</td>
	</tr>
	<tr>
		<td class="flabel">资源ID:</td>
		<td class="fcontent">${resource.id }</td>
	</tr>
	<tr>
		<td class="flabel">资源名称:</td>
		<td class="fcontent">${resource.resName }</td>
	</tr>
	<tr>
		<td class="flabel">资源路径:</td>
		<td class="fcontent">${resource.resUrl}</td>
	</tr>
	<tr>
		<td class="flabel">资源描述:</td>
		<td class="fcontent">${resource.resDesc }</td>
	</tr>
</tbody>
</table>
