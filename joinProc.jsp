<%@ page import="org.json.simple.JSONObject"%>
<%@ page contentType="application/json; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="mem" class="com.ezen.web.hello.Member">
	<jsp:setProperty name="mem" property="*"/>
</jsp:useBean>

<jsp:useBean id="svc" class="com.ezen.web.hello.MemberService">
	<jsp:setProperty name="svc" property="member" value="<%=mem%>"/>
</jsp:useBean>

<%
	boolean added = svc.addMember();
	JSONObject jsObj = new JSONObject();
	jsObj.put("added", added);
%>

<%=jsObj.toJSONString()%>