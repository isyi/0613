<%@page import="portit.model.dto.Portfolio"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="search" class="portit.model.dao.SearchDao" />
<jsp:useBean id="dto" class=portit.model.dto.Portfolio>
	<jsp:setProperty name="dto" property="*" />
</jsp:useBean>
<!-- 통합 검색시 검색되는 포트폴리오 -->
<% 
	String keyword = request.getParameter("search");
	List list = search.searchAll(keyword); 
	
%>
<input type = "hidden" value="<%=keyword %>" />
<!-- 미디어 패스  -->
<%
	for (int i = 0; i < list.size(); i++) {
		Portfolio port = (Portfolio) list.get(i);
		
%>
		ml_path: <%= port.getMl_path() %><br>			
		tag_name: <%= port.getTag_name() %>	<br>
		pf_title : <%= port.getPf_title() %> &nbsp;&nbsp;&nbsp;
		pf_like : <%= port.getPf_like() %>	<br>	
		prof_name : <%= port.getProf_name() %><br>
<%
	}
%>

