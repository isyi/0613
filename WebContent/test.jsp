<%@page import="portit.model.dto.Portfolio"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

${list[0]}<br><br>
${param.list.tag_name}<br>
${paramValues.list.tag_name[0]}<br>
°Ë»ö¾î : ${search }<br>
${list[0].tag_name}<br>
${list[1].tag_name}<br>
${list[2].tag_name}<br><br>


<c:forEach begin="1" end="${list.size() }" var="i" >
		${list[i].tag_name}
		${list[i].pf_title} 
		${list[i].prof_name}
		${list[i].pf_like}	<br>					
</c:forEach>

