<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<html>
<head>
<%@ include file="/view/common/head.jsp" %>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',split:true" style="height:60px;">
		买卖宝...datasource
		<a href="${path}//LoginController/logout.do">退出</a>
	</div>
	<div data-options="region:'west',title:'导航菜单',split:true" style="width:200px;">
		<jsp:include page="/view/common/navigate.jsp" />
	</div>
	<div data-options="region:'center'" style="overflow: hidden;">
		<iframe id="mainFrame" src="" style="width:100%;height:100%;border:0;">
		http://www.baidu.com
		</iframe>
	</div>
</body>
</html>