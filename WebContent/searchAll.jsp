<%@page import="portit.model.dto.Project"%>
<%@page import="portit.model.dto.Developer"%>
<%@page import="java.util.List"%>
<%@page import="portit.model.dto.Portfolio"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<jsp:useBean id="portfolio" class="portit.model.dao.Portfolio_ViewDao" />
<jsp:useBean id="developer" class="portit.model.dao.Developer_ViewDao" />
<jsp:useBean id="project" class="portit.model.dao.Proj_viewDao" />

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
			<div class="sidebar-toggle-box">
				<div class="fa fa-bars tooltips" data-placement="right"
					data-original-title="Toggle Navigation"></div>
			</div>
			<!--logo start-->
			<a href="index.html" class="logo"><b>DASHGUM FREE</b></a>
			<!--logo end-->
			<div class="nav notify-row" id="top_menu">
				<!--  notification start -->
				<ul class="nav top-menu">
					<!-- settings start -->
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="index.html#"> <i
							class="fa fa-tasks"></i> <span class="badge bg-theme">4</span>
					</a>
						<ul class="dropdown-menu extended tasks-bar">
							<div class="notify-arrow notify-arrow-green"></div>
							<li>
								<p class="green">You have 4 pending tasks</p>
							</li>
							<li><a href="index.html#">
									<div class="task-info">
										<div class="desc">DashGum Admin Panel</div>
										<div class="percent">40%</div>
									</div>
									<div class="progress progress-striped">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%">
											<span class="sr-only">40% Complete (success)</span>
										</div>
									</div>
							</a></li>
							<li><a href="index.html#">
									<div class="task-info">
										<div class="desc">Database Update</div>
										<div class="percent">60%</div>
									</div>
									<div class="progress progress-striped">
										<div class="progress-bar progress-bar-warning"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: 60%">
											<span class="sr-only">60% Complete (warning)</span>
										</div>
									</div>
							</a></li>
							<li><a href="index.html#">
									<div class="task-info">
										<div class="desc">Product Development</div>
										<div class="percent">80%</div>
									</div>
									<div class="progress progress-striped">
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
											style="width: 80%">
											<span class="sr-only">80% Complete</span>
										</div>
									</div>
							</a></li>
							<li><a href="index.html#">
									<div class="task-info">
										<div class="desc">Payments Sent</div>
										<div class="percent">70%</div>
									</div>
									<div class="progress progress-striped">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="70" aria-valuemin="0"
											aria-valuemax="100" style="width: 70%">
											<span class="sr-only">70% Complete (Important)</span>
										</div>
									</div>
							</a></li>
							<li class="external"><a href="#">See All Tasks</a></li>
						</ul></li>
					<!-- settings end -->
					<!-- inbox dropdown start-->
					<li id="header_inbox_bar" class="dropdown"><a
						data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
							<i class="fa fa-envelope-o"></i> <span class="badge bg-theme">5</span>
					</a>
						<ul class="dropdown-menu extended inbox">
							<div class="notify-arrow notify-arrow-green"></div>
							<li>
								<p class="green">You have 5 new messages</p>
							</li>
							<li><a href="index.html#"> <span class="photo"><img
										alt="avatar" src="assets/img/ui-zac.jpg"></span> <span
									class="subject"> <span class="from">Zac Snider</span> <span
										class="time">Just now</span>
								</span> <span class="message"> Hi mate, how is everything? </span>
							</a></li>
							<li><a href="index.html#"> <span class="photo"><img
										alt="avatar" src="assets/img/ui-divya.jpg"></span> <span
									class="subject"> <span class="from">Divya Manian</span>
										<span class="time">40 mins.</span>
								</span> <span class="message"> Hi, I need your help with this. </span>
							</a></li>
							<li><a href="index.html#"> <span class="photo"><img
										alt="avatar" src="assets/img/ui-danro.jpg"></span> <span
									class="subject"> <span class="from">Dan Rogers</span> <span
										class="time">2 hrs.</span>
								</span> <span class="message"> Love your new Dashboard. </span>
							</a></li>
							<li><a href="index.html#"> <span class="photo"><img
										alt="avatar" src="assets/img/ui-sherman.jpg"></span> <span
									class="subject"> <span class="from">Dj Sherman</span> <span
										class="time">4 hrs.</span>
								</span> <span class="message"> Please, answer asap. </span>
							</a></li>
							<li><a href="index.html#">See all messages</a></li>
						</ul></li>
					<!-- inbox dropdown end -->
				</ul>
				<!--  notification end -->
			</div>
			<div class="top-menu">
				<ul class="nav pull-right top-menu">
					<li><a class="logout" href="login.html">Logout</a></li>
				</ul>
			</div>
		</header>
		<!--header end-->


		<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
		<!--main content start-->
		<section class="container">
			<section class="wrapper site-min-height">
				<div class="col-md-12 mt search" id="search">
					<h2>
						<span class="fa fa-search"></span>
						<span class="keyword">${param.search}</span>						
					</h2>
					<!-- 조건 검색 box -->					
					<div class="searchSorting col-md-12 mt">	
						<form class="" method="post" action="">
							
							<div class="">
								<div class="sortKey col-md-1"><b>구분</b></div>
								<div class="col-md-11">
									<a href="#pfResult">포트폴리오</a>
									<a href="#memResult">인물</a> 
									<a href="#projResult">프로젝트</a>					
								</div>
							</div>
							<br><br>
							<!-- 						
							<div class="mb">
								<span class="sortKey">정렬</span>
									<a href="#" class="active">최신순</a>
									<a href="#">인기순</a>
									<a href="#">랜덤</a>
							</div>
							 -->							
							
							<div class="sortKey col-md-1"><b>태그</b></div>										
							<div class="col-md-11">	
								<!-- 인기 태그 6개 띄우기 -->							
								<input class="btn poptag" type="button"  value="java" onclick="fnAppendItem()"/>
								<input class="btn poptag" type="button"  value="c" onclick="fnAppendItem()"/>
								<input class="btn poptag" type="button"  value="c++" onclick="fnAppendItem()"/>
								<input class="btn poptag" type="button"  value="c#" onclick="fnAppendItem()"/>
								<input class="btn poptag" type="button"  value="jsp" onclick="fnAppendItem()"/>
								<input class="btn poptag" type="button"  value="servlet" onclick="fnAppendItem()"/>								
								.....
							</div>
							<br><br>
							<div class="col-md-offset-1 col-md-4">
								<input type="text" class="form-control taginput" id="language" placeholder="검색하고 싶은 태그를 입력하세요." onchange="fnAppendItem2()" />
							</div>		
							<br><br>
							<hr />
							<div id="itemList" class="col-md-9"></div>		
							<button type="submit" class="btn common col-md-2">조건 검색하기</button>									
						</form>
					</div> <!-- END - 조건 검색 box -->	
					<br>	
					<br>
					<hr class="resultLine" id="pfResult"/>
					<!-- 포트폴리오 결과 -->
					<div class="pfResult mt mb" id="pfResult">
						<h4>포트폴리오(200개)&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-double-right"></i></h4>
						
<%
	List list = portfolio.portfolio_info();
	//request.setAttribute("list", list);
	for (int i = 0; i < 4; i++) {
		Portfolio port = (Portfolio) list.get(i);
%>	
						<!-- 첫번째 포트폴리오 -->
						<div class="col-md-3 mb">
							<div class="portfolio-simple">
								<div class="pfImg"></div>
								<div class="pfInfo">
									<div class="simple-content">
										<div class="pfTag">
											<a href="">#<%=port.getTag_name() %>&nbsp;</a>
										</div>
										<div class="pfTitle">
											<a href=""><%=port.getPf_title() %> 제목</a>
										</div>
										<div class="pfBottom">
											<span class="pfmemName"><a href=""><%=port.getProf_name() %></a></span> <span
												class="pfLikeCount"><span class="fa fa-heart"></span>&nbsp;&nbsp;<%=port.getPf_like() %></span>
										</div>
									</div>
								</div>
							</div>
						</div>
<%} %>
			
						<div class="text-right">
							<button type="button" class="btn moreBtn" onclick="location.href='port_search.html'">더 보기</button>							
						</div>
					</div>
				
					<hr class="resultLine" id="memResult"/>

					<!-- 인물 결과 -->
					<div class="memResult mt mb" >
						<h4>인물(150명)&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-double-right"></i></h4>
<%
	List list2 = developer.developer_info();
	//request.setAttribute("list", list);
	for (int i = 0; i < 4; i++) {
		Developer dev = (Developer) list2.get(i);
%>		
						<!-- 첫 번째 member-->
						<div class="col-md-3 mb">
	          				<div class="member-simple">
		          				<div class="simple-content text-center">	      
			          				<img class="memImg img-circle" alt="avatar" src="<%=dev.getProf_img()%>"/>   
			         				<div>
			         					<div class="memName"><a href=""><%=dev.getProf_name() %></a></div>
			         					<div class="memTag"><a href="">#<%=dev.getTag_name() %>&nbsp;</a></div>
			         					<div class="memFollow">
			         						<span class="fa fa-user"></span>&nbsp;&nbsp;
			         						<span class="memFollowCount"><%=dev.getProf_follower() %></span>
			         					</div>
			         				</div>
		          				</div>          				
	          				</div>
	          			</div> 
<%} %>	          			
							
						<div class="text-right">
							<button type="button" class="btn moreBtn" onclick="location.href='person_search.html'">더 보기</button>							
						</div>
					</div>
						
					<hr class="resultLine" id="projResult"/>

					<!-- 프로젝트 결과 -->
					<div class="projResult mt mb" >
						<h4>프로젝트(60건)&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-double-right"></i></h4>
<%
	List list3 = project.project_info();
	//request.setAttribute("list", list);
	for (int i = 0; i < list3.size(); i++) {
		Project proj = (Project) list3.get(i);
	
%>	
						<!-- 첫번째 프로젝트 -->
						<div class="col-md-12 mb">
	          				<div class="project-list">
		          				<span class="pjInfoText">
		          					<div class="pjTitle"><a href=""><%=proj.getProj_title() %></a></div>
		          					<div class="pjmemName"><span class="fa fa-user"></span>&nbsp;&nbsp;<a href="">개설자 이름</a></div>
		          					<div class="pjIntro">프로젝트 소개글이 출력됩니다. 글자 수는 제한합니다............</div>
		          					<div class="pjTag"><a href="">#<%=proj.getTag_name() %>&nbsp;</a></div>         					
	          					</span>
	          					<span class="pjInfoTable">
	          						<table class="table text-center">
	          							<tr><td>백엔드개발자</td></tr>
	          							<tr><td>3 명</td></tr>
	          							<tr><td>마감일까지 D&nbsp;-&nbsp;5</td></tr>
	          							<tr><td></td></tr>
	          						</table>
	          					</span>
	          				</div>          			
						</div>
						<br><br>
<%} %>
					
						<div class="text-right">
							<button type="button" class="btn moreBtn" onclick="location.href='proj_search.html'">더 보기</button>							
						</div>
					</div>
				</div>
			</section>
			<!--/wrapper -->
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
	
</body>
</html>