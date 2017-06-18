<%@page import="java.util.List"%>
<%@page import="portit.model.dto.Developer"%>

<%@ page contentType="text/html; charset=UTF-8"%>
 
<jsp:useBean id="developer" class="portit.model.dao.Developer_ViewDao" />

 <!-- 개발자 구성 화면에 보여지는 내용들 -->
 <%  
	List list = developer.developer_info();
%>
<!-- 태그명 -->
<%
	
	for (int i = 0; i < list.size(); i++) {
		Developer developer_info = (Developer) list.get(i);
		
%>
		tag_name: <%= developer_info.getTag_name() %><br>	
		prof_img : <%= developer_info.getProf_img() %><br>
		prof_name : <%= developer_info.getProf_name() %><br>
		prof_follower : <%= developer_info.getProf_follower() %><br>	
<%
	}	
%>