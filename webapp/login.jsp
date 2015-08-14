<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<html>
<head>
<%@ include file="/view/common/head.jsp" %>
<script type="text/javascript">
function login(){
	//$('#loginForm').submit(function(){});
	/*
	$('#loginForm').form('submit',{
		//url: '${path}/buyReturnWarnRemindController/saveBuyReturnWarnRemind.mmx',
		onSubmit: function(param){
			return true;
		},
		success: function(json){
			alert(json);
			if (json.success){
				$.messager.alert('', '添加成功！','',function(){
				});
			}else{
				$.messager.alert('错误提示', json.result);
			}
		}
	});
	*/
	
	$('#loginForm').ajaxSubmit({
		success: function(json) {
			if (json.success){
				window.location.href = '${path}/index.jsp';
			}else{
				$.messager.alert('错误提示', json.result);
			}
		}
	});
}
</script>
</head>
<body>
<div style="margin:0 auto; width:400px;">
<div class="easyui-panel" title="Login to system" style="padding:30px 70px 20px 70px;">
<form id="loginForm" action="${path}/j_spring_security_check" method="post">
	<div style="margin-bottom:10px">
		<input name="userName" class="easyui-textbox" style="width:100%;height:40px;padding:12px" 
			data-options="prompt:'用户名',iconCls:'icon-man',iconWidth:38">
	</div>
	<div style="margin-bottom:20px">
		<input name="password" class="easyui-textbox" type="password" style="width:100%;height:40px;padding:12px" 
			data-options="prompt:'密码',iconCls:'icon-lock',iconWidth:38" />
	</div>
	<div style="margin-bottom:20px">
		<input type="checkbox" checked="checked">
		<span>Remember me</span>
	</div>
	<div>
		<a href="javascript:login();" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:100%;">
			<span style="font-size:14px;">登录</span>
		</a>
	</div>
</form>
</div>
</div>
</body>
</html>