<%@page import="portit.model.dto.Project"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="project" class="portit.model.dao.Proj_viewDao" />

 <!-- 프로젝트 구성 화면에 보여지는 내용들 -->

 <%  
	List list = project.project_info(); 
%>


<%
	for (int i = 0; i < list.size(); i++) {
		Project proj = (Project) list.get(i);
		
%>
		tag_name: <%= proj.getTag_name() %><br>		
		proj_title: <%= proj.getProj_title() %><br>		
		proj_to: <%= proj.getProj_to() %><br>		
<%
	}
%>