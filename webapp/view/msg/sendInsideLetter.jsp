<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<html>
<head>
<%@ include file="/view/common/head.jsp" %>
</head>
<body>

<div class="mbody">
<form id="menuForm" action="${path}/MenuController/save.do" method="post">
	<input type="hidden" id="menuObjId" name="id" value="${menu.id }" />
	<input type="hidden" id="parentMenuObjId" name="parentId" value="${menu.parentId }" />
	<input type="hidden" name="treeLevel" value="${menu.treeLevel }" />
	<table border="1" class="ftable">
	<tbody>
		<tr>
			<td class="flabel"><span class="pn-frequired">*</span>标题:</td>
			<td class="fcontent">
				<input type="text" name="menuName" maxlength="100" class="required" value="${menu.menuName }">
			</td>
		</tr>
		<tr>
			<td class="flabel"><span class="pn-frequired">*</span>收件人:</td>
			<td class="fcontent">
				<input type="text" name="menuName" maxlength="100" class="required" value="${menu.menuName }">
			</td>
		</tr>
		<tr>
			<td class="flabel">内容:</td>
			<td class="fcontent"><textarea maxlength="255" name="menuDesc" rows="3" cols="30">${menu.menuDesc }</textarea></td>
		</tr>
		<tr>
			<td class="pn-fbutton" colspan="2"><input type="button" onclick="submit22();" class="submit" value="提交" /> &nbsp; <input type="reset" class="reset" value="重置" /></td>
		</tr>
	</tbody>
	</table>
</form>
</div>

</body>
</html>

<script type="text/javascript">
$(function(){
	
	$('#loginForm').submit(function(){
		var userName = $('#userName').val();
		var password = $('#password').val();
		if($.trim(userName) == ''){
			$('#tip').show().html('请输入用户名');
			return false;
		}
		if($.trim(password) == ''){
			$('#tip').show().html('请输入密码');
			return false;
		}
		
		$(this).ajaxSubmit({
			success: function(json) {
				if (json.success){
					window.location.href = '${path}/index.jsp';
				}else{
					//$.messager.alert('错误提示', json.result);
					$('#tip').show().html(json.result);
				}
			}
		});
		return false;
	});
});
</script>
