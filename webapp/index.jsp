<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<%@ page import="com.likg.auth.domain.User,com.likg.security.*" %>
<%
User user = AuthenticationHelper.getCurrentUser();
session.setAttribute("currentUser", user);

%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/view/common/head.jsp" %>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',split:true" style="height:60px;">
		<jsp:include page="/view/common/top.jsp" />
	</div>
	<div data-options="region:'west',title:'导航菜单',split:true" style="width:200px;">
		<jsp:include page="/view/common/navigate.jsp" />
	</div>
	<div data-options="region:'center'" style="overflow: hidden;">
		<iframe id="mainFrame" src="" style="width:100%;height:100%;border:0;"></iframe>
	</div>
</body>
</html>