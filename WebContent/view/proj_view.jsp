<%@page import="portit.model.dto.Tag"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="project" class="portit.model.dao.Proj_viewDao" />

 <!-- ������Ʈ ���� ȭ�鿡 �������� ����� -->

 <%  
	List tag_name = project.tag_load();
	List proj = project.proj_load(); 
%>

<!-- �±׸� -->
<%
	for (int i = 0; i < tag_name.size(); i++) {
		Tag tag = (Tag) tag_name.get(i);
		
%>
		tag_name: <%= tag.getTag_name() %><br>		
<%
	}
%>
<hr>