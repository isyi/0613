<%@page import="portit.model.dto.Profile"%>
<%@page import="portit.model.dto.Tag"%>
<%@page import="portit.model.dto.Media"%>
<%@page import="portit.model.dto.Portfolio"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="port" class="portit.model.dao.Portfolio_ViewDao" />

<!-- 포트폴리오 구성 화면에 보여지는 내용들 -->

<% 
	List ml_path = port.media_load(); 
	List tag_name = port.tag_load(); 
	List pf = port.pf_load(); 
	List prof = port.prof_load(); 
%>

<!-- 미디어 패스  -->
<%
	for (int i = 0; i < ml_path.size(); i++) {
		Media media = (Media) ml_path.get(i);
		
%>
		ml_path: <%= media.getMl_path() %>	<br>		
<%
	}
%>
<hr>
<!-- 태그명 -->
<%
	for (int i = 0; i < tag_name.size(); i++) {
		Tag tag = (Tag) tag_name.get(i);
		
%>
		tag_name: <%= tag.getTag_name() %><br>
<%
	}
%>
<hr>
<!-- 포트폴리오 제목 / 좋아요 수 -->
<%
	for (int i = 0; i < pf.size(); i++) {
		Portfolio portfolio = (Portfolio) pf.get(i);
		
%>
		pf_title : <%= portfolio.getPf_title() %> &nbsp;&nbsp;&nbsp;
		pf_like : <%= portfolio.getPf_like() %>	<br>	
<%
	}
%>
<hr>
<!-- 등록자 이름 -->
<%
	for (int i = 0; i < prof.size(); i++) {
		Profile profile = (Profile) prof.get(i);
		
%>
		prof_name : <%= profile.getProf_name() %><br>
<%
	}
%>

