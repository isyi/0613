<%@page import="portit.model.dto.Profile"%>
<%@page import="portit.model.dto.Tag"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
 
 <jsp:useBean id="developer" class="portit.model.dao.Developer_ViewDao" />
 
 <!-- 개발자 구성 화면에 보여지는 내용들 -->

 <%  
	List tag_name = developer.tag_load();
	List prof = developer.prof_load(); 
%>

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
	for (int i = 0; i < prof.size(); i++) {
		Profile profile = (Profile) prof.get(i);
		
%>
		prof_img : <%= profile.getProf_img() %><br>
		prof_name : <%= profile.getProf_name() %><br>
		prof_follower : <%= profile.getProf_follower() %><br>
<%
	}
%>