<%@page import="portit.model.dto.Project"%>
<%@page import="portit.model.dto.Portfolio"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>DASHGUM - Bootstrap Admin Template</title>

<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/style-responsive.css" rel="stylesheet">
<link href="assets/css/custom.css" rel="stylesheet">
<link href="assets/css/search.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<section id="container">
		<!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
		<!--header start-->
		<header class="header black-bg">
			<!--logo start-->
			<a href="index.html" class="logo"><b>Port IT</b></a>
			<!--logo end-->
			<div class="nav notify-row" id="top_menu">
				<!--  menu start -->
				<ul class="nav top-menu">
					<!-- settings start -->
					<li><a href="">Member</a></li>
					<li><a href="">Portfolio</a></li>
					<li><a href="">Project</a>
					<li>
					<li><a href="">Community</a></li>
				</ul>
				<!--  menu end -->
			</div>

			<div class="top-menu-right">
				<ul class="nav pull-right top-menu">
					<li>
						<form class="form-inline top-menu-search" method="post"
							action="/PortIT/search?cmd=SEARCH">
							<div class="input-group">
								<input type="text" class="form-control round-form" name="search"
									size="20" placeholder="���� �˻�" /> <span class="input-group-btn">
									<button type="submit" class="btn btn-default round-form">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</form>
					</li>
					<li id="header_inbox_bar" class="dropdown"><a
						data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
							<i class="fa fa-bell"></i> <span class="badge bg-theme"></span>
					</a>
						<ul class="dropdown-menu extended inbox">
							<div class="notify-arrow notify-arrow-yellow"></div>
							<li>
								<p class="yellow">Notification</p>
							</li>
							<li><a href=""> <span>����</span>&nbsp;/&nbsp; <span
									class="time">Just now</span> <span class="message">[��������]����
										�� ��Ʈ�������� �����մϴ�.</span>
							</a></li>
							<li><a href="">������</a></li>
						</ul></li>
					<li id="header_inbox_bar" class="dropdown mypage"><a
						data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
							<img alt="avatar" src="assets/img/ui-danro.jpg"
							class="img-circle">
					</a>
						<ul class="dropdown-menu extended inbox">
							<div class="notify-arrow notify-arrow-yellow"></div>
							<li>
								<p class="yellow">����� ��</p>
							</li>
							<li><a href="">�� ������</a></li>
							<li><a href="">�ȷ����� ���</a> <a href="">�ϸ�ũ�� ��Ʈ������</a></li>
							<li><a href="">�������� ����</a></li>
							<li><a class="logout" href="login.html">�α׾ƿ�</a></li>
						</ul></li>
				</ul>
			</div>
		</header>
		<!--header end-->
	</section>


	<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
	<!--main content start-->
	<section class="container">
		<section class="wrapper site-min-height">
			<div class="col-md-12 mt search" id="searchPf">
				<!-- �˻��� �˻� �� -->

				<div class="col-md-12 mt mb">
					<form class="col-md-10 searchKeyword" method="post"
						action="/PortIT/pfSearch?cmd=PROJSEARCH">
						<div class="form-group col-md-11">
							<input type="text" class="form-control" name="projSearch" value="${sessionScope.search}"/>
						</div>
						<button type="submit" class="col-md-1 btn common" id="pfsubmit">
							<i class="fa fa-search"></i>
						</button>
					</form>
					<div class="col-md-2 collapsed sortingBtn text-right"
						data-toggle="collapse" data-parent="#searchPf"
						href="#searchSorting">
						<button type="button" class="btn common updown">
							���� �˻�&nbsp;&nbsp;<i class="fa fa-chevron-down"></i>
						</button>
					</div>
				</div>
				<!-- ���� �˻� box -->
				<div class="searchSorting col-md-12 collapse" id="searchSorting">
					<form class="" method="post" action="/PortIT/detailSearch?cmd=DETAILSEARCH">
						<div class="">
							<div class="sortKey col-md-1">
								<b>����</b>
							</div>
							<div class="col-md-11">
								<a href="#">�ֽż�</a> 
								<a href="javascript:fnRead()">�α��</a> 
								<a href="#">����</a>
							</div>
						</div>
						<br> <br>
						<div class="sortKey col-md-1">
							<b>�±�</b>
						</div>
						<div class="col-md-11">
							<!-- �α� �±� 6�� ���� -->
							<input class="btn poptag" type="button" value="JAVA" name="language" onclick="fnAppendItem()" /> 
							<input class="btn poptag" type="button" value="C" name="language" onclick="fnAppendItem()" /> 
							<input class="btn poptag" type="button" value="c++" name="language" onclick="fnAppendItem()" /> 
							<input class="btn poptag" type="button" value="c#" name="language" onclick="fnAppendItem()" /> 
							<input class="btn poptag" type="button" value="jsp" name="language" onclick="fnAppendItem()" /> 
							<input class="btn poptag" type="button" value="servlet" name="language" onclick="fnAppendItem()" /> .....
						</div>
						<br> <br>
						<div class="col-md-offset-1 col-md-4">
							<input type="text" class="form-control taginput" id="language" name="language2"
								placeholder="�˻��ϰ� ���� �±׸� �Է��ϼ���." onchange="fnAppendItem2()" />
						</div>
						<br> <br>
						<hr />
						<div id="itemList" class="col-md-9"></div>
						<button type="submit" class="btn common col-md-2">���� �˻��ϱ�</button>
					</form>
				</div>
				<!-- END - ���� �˻� box -->
				
<jsp:useBean id="proj_search" class="portit.model.dao.SearchDao" />
<%	
	String projSearch = request.getParameter("projSearch");
	List list = proj_search.searchAll_proj(projSearch);

	// ����¡ ��� �߰�
		int totalRecord = list.size();	//��ü ���� ����
		int numPerPage = 2;				//�� �������� ������ ���� ����
		int totalPage = 0;				//��ü ������ ��
		int nowPage = 0;				//���� ������(�����ִ�) ������ ��ȣ
		int beginPerPage = 401;			//�� �������� ���۹�ȣ(���� ��� �� �������� 5���� ��´ٸ� 2�������� ���� 6 3�������� 11)
		int pagePerBlock = 3;			//�� ��ϴ� ���� ������ �� (���� 3�̹Ƿ� 1,2,3 / 4,5,6 / ..�������� ����)
		int totalBlock = 0;				//��ü �� ����
		int nowBlock = 0;				//���� ��
		
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		
		if(request.getParameter("nowPage")!=null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		if(request.getParameter("nowBlock")!=null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
		
		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		
		beginPerPage = nowPage * numPerPage;
		
		if(list.size() == 0){

		}
		else{
			for(int i=beginPerPage; i< numPerPage+beginPerPage; i++){
				if(i == totalRecord){	//������ �������� �Խñ��� 5���� �ƴ� �� ������ ���� �� ����
					break;
			}
		Project proj = (Project) list.get(i);
%>

				<!-- ù��° ������Ʈ -->
					<div class="col-md-12 mb">
          				<div class="project-list">
	          				<span class="pjInfoText">
	          					<div class="pjTitle"><a href=""><%=proj.getProj_title() %></a></div>
	          					<div class="pjmemName"><span class="fa fa-user"><%=proj.getProf_name() %></span>
	          						&nbsp;&nbsp;<a href=""></a></div>     		
	          					<div class="pjIntro"><%=proj.getProj_intro() %></div>
	          					<div class="pjTag"><a href=""># <%=proj.getTag_name() %>&nbsp;</a></div>         					
          					</span>
          					<span class="pjInfoTable">
          						<table class="table text-center">
          							<tr><td>�鿣�尳����</td></tr>
          							<tr><td><%=proj.getProj_to() %> ��</td></tr>
          							<tr><td>�����ϱ��� D&nbsp;-&nbsp;5</td></tr>
          							<tr><td></td></tr>
          						</table>
          					</span>
          				</div>          			
					</div>	
<%
		}
	}
%>							
				</div>

				<!-- ���������̼� -->
	<div align="center">		
		<% if(nowBlock > 0){%>
			<a href="projSearch.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=pagePerBlock*(nowBlock+1)%>">����<%=pagePerBlock%>��</a>
		<% }%> 
		:::
		<%
			for(int i=0; i<pagePerBlock; i++){
				if((nowBlock*pagePerBlock)+i == totalPage)
					break;
		%>
				<a href="projSearch.jsp?nowPage=<%=(nowBlock*pagePerBlock)+i%>&nowBlock=<%=nowBlock%>"><%= (nowBlock*pagePerBlock)+i+1%></a>&nbsp;&nbsp;&nbsp;
		<%
			}
		%>
		::: 
		<% if(totalBlock > nowBlock+1){%>
			<a href="projSearch.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=pagePerBlock*(nowBlock+1)%>">����<%=pagePerBlock%>��</a>
		<% }%>
	</div>	
		
		</section>
		<! --/wrapper -->
	</section>

	<!--main content end-->
	<!--footer start-->
	<footer class="site-footer">
		<div class="text-center">
			2014 - Alvarez.is <a href="blank.html#" class="go-top"> <i
				class="fa fa-angle-up"></i>
			</a>
		</div>
	</footer>
	<!--footer end-->
	</section>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
	<script class="include" type="text/javascript"
		src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="assets/js/jquery.scrollTo.min.js"></script>
	<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="assets/js/jquery-3.2.1.min.js"></script>
	
	<!--common script for all pages-->
	<script src="assets/js/common-scripts.js"></script>

	<!-- detail search bar -->
	<script src="assets/js/search.js"></script>

	<!--script for this page-->
	<script>
		$(document).ready(
				function() {
					$('.updown').on(
							'click',
							function() {
								var icon = $(this).find('i');

								if (icon.hasClass("fa-chevron-down")) {
									icon.addClass("fa-chevron-up").removeClass(
											"fa-chevron-down");
								} else {
									icon.addClass("fa-chevron-down")
											.removeClass("fa-chevron-up");
								}
							});
				});
	</script>
	
	<script>
		$(document).ready(function(){
			event.stopPropagation();
			$("#pfsubmit").trigger("click");
		});
		
	</script>
</body>
</html>