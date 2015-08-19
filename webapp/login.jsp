<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<html>
<head>
<%@ include file="/view/common/head.jsp" %>
<script type="text/javascript">

$(function(){
	$('#loginForm').submit(function(){
		var userName = $('#userName').val();
		var password = $('#password').val();
		
		
		
		$(this).ajaxSubmit({
			success: function(json) {
				if (json.success){
					window.location.href = '${path}/index.jsp';
				}else{
					$.messager.alert('错误提示', json.result);
				}
			}
		});
		return false;
	});
});


</script>
<style type="text/css">
.username{
	width:180px;
}
.submitbut{
	width:180px;
}
</style>
</head>
<body>
<div style="margin:0 auto; width:350px;">
<div class="easyui-panel" title="Login" style="padding:30px 70px 20px 70px;">
<form id="loginForm" action="${path}/j_spring_security_check" method="post" style="text-align:center;">
	<div style="margin-bottom:10px">
		<input type="text" id="userName" name="userName" class="username" placeholder="用户名" />
	</div>
	<div style="margin-bottom:10px">
		<input type="password" id="password" name="password" class="username" placeholder="密码" />
	</div>
	
	<div style="margin-bottom:10px">
		<input type="submit" class="submitbut" value="登录" />
	</div>
</form>
</div>
</div>
</body>
</html>