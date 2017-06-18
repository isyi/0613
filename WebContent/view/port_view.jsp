<%@page import="portit.model.dto.Portfolio"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="portfolio" class="portit.model.dao.Portfolio_ViewDao" />

<!-- 포트폴리오 구성 화면에 보여지는 내용들 -->

<% 
	List list = portfolio.portfolio_info(); 
%>

<!-- 포트폴리오  구성 화면 -->
<%
	for (int i = 0; i < list.size(); i++) {
		Portfolio port = (Portfolio) list.get(i);
%>
		ml_path: <%= port.getMl_path() %>	<br>	
		tag_name: <%= port.getTag_name() %><br>
		pf_title : <%= port.getPf_title() %> &nbsp;&nbsp;&nbsp;
		pf_like : <%= port.getPf_like() %>	<br>
		prof_name : <%= port.getProf_name() %><br>	
<%
	}
%>

