<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书信息维护</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jc/sku.js"></script>
  </head>
  
  <body>
    <div align="center">
		<h2 style="color:#0078CA">图书信息维护&nbsp;<span style="font-size:20px;color:#0078CA"><s:property value='#session.name'/></span></h2>
	</div>
	<div align="center" style="padding-top:5px;">
		<table id="data" class="easyui-datagrid" width='100%' data-options="collapsible:false,height:'auto',singleSelect:true,fitColumns: true,striped:true,rownumbers:true,
		border:true,toolbar:'#tb'">
			<thead>
				<tr>
					<th data-options="field:'id',width:80,checkbox:true">编号</th>
					<th data-options="field:'issuenumber',width:50">期号</th>
					<th data-options="field:'status',width:80">征订代码</th>
					<th data-options="field:'status',width:80">条码</th>
					<th data-options="field:'status',width:80">书名</th>
					<th data-options="field:'status',width:80">定价</th>
					<th data-options="field:'status',width:80">捆扎</th>
					<th data-options="field:'status',width:80">出版社</th>
					<th data-options="field:'status',width:80">添加人</th>
					<th data-options="field:'status',width:80">添加时间</th>
					<th data-options="field:'status',width:80">修订人</th>
					<th data-options="field:'status',width:80">修订时间</th>
				</tr>
			</thead>
		</table>
	</div>
	<!-- 工具栏 -->
	<div id="tb" style="text-align:center">
    	<a class="easyui-linkbutton" iconCls="icon-add" onClick="tool.add();">添加</a>
    	<a class="easyui-linkbutton" iconCls="icon-remove" onClick="tool.remove();">删除</a>
    </div>
    <!-- 增加期号信息窗口 -->
    <div id="w-addInfo" class="easyui-window" title="进行分发"
			data-options="modal:false,closed:true,iconCls:'icon-save'"
			style="width: 500px; height: 250px; padding: 10px;">
			<form id="addform" align="center" style="text-align:center;margin: 10px;line-height: 41px;">
				<h2>添加期号</h2>
				输入新的期号：<input class="easyui-textbox" type="text" id="issuenumber"/>
				<br>
				<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" id="addInfo" onclick="addInfo()">确认</a>
			</form>
		</div>
  </body>
</html>
