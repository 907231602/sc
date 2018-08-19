<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/struts-tags" prefix="s"%>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>首页- Home</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
    <!-- bootstrap -->
    <link href="<%=basePath%>selectcourse/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="<%=basePath%>selectcourse/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="<%=basePath%>selectcourse/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- libraries -->
    <link href="<%=basePath%>selectcourse/css/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>selectcourse/css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>selectcourse/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>selectcourse/css/elements.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>selectcourse/css/icons.css" />

    <!-- this page specific styles -->
    <link rel="stylesheet" href="<%=basePath%>selectcourse/css/compiled/index.css" type="text/css" media="screen" />    

    <!-- open sans font -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!-- lato font -->
    <link href='http://fonts.useso.com/css?family=Lato:300,400,700,900,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css' />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">

table{
width:100%;
}
.table1 thead th{
		padding: 15px;
		color:#fff;
		text-shadow: 1px 1px 1px #0b0606;
		border: 1px solid white;
		background:-moz-linear-gradient( center bottom, rgb(167,203,240) 2%, rgb(144,193,242) 51%, rgb(44,144,245) 87% );

    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
}

table .table1{
font-family: "Trebuchet MS", sans-serif;
font-size: 13px;
font-weight: bold;
line-height: 1em;
font-style: normal;
border-collapse: separate;
}

table tbody td{
padding: 10px;
text-align: center;
/* background-color: #EDEDED; */

border: 1px solid white;
-moz-border-radius: 2px;
-webkit-border-radius: 2px;
border-radius: 2px;
color: #666;
text-shadow: 1px 1px 1px #fff;
}

.Off{ background-color:#CBD9E6; padding:100px;}
.Up{background-color: #D1E8FF; padding:100px}
</style>

</head>

<body>

    <!-- navbar -->
    <div class="navbar navbar-inverse">
        <div class="navbar-inner">
            <button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            
            <a class="brand" href="<%=basePath%>/index.jsp"><img src="<%=basePath%>selectcourse/img/logo.png" /></a>

            <ul class="nav pull-right">   
                     
              <%--
                <li class="settings hidden-phone">
               
                     <a href="<%=basePath%>studentInfo_lookMyselfInfo.action" role="button">
                        <i class="icon-cog"></i>
                    </a> 
                </li>--%>
                <li class="settings hidden-phone">
                    <a href="<%=basePath%>loginsc_quit.action" role="button">
                        <i class="icon-share-alt" title="退出"></i>
                    </a>
                </li>
            </ul>            
        </div>
    </div>
    <!-- end navbar -->

    <!-- sidebar -->
      <div id="sidebar-nav">
        <ul id="dashboard-menu">
        
          <c:if test="${identity=='1'}">
			 <li class="active">
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
                <a href="<%=basePath%>home_getAllFile.action">
                    <i class="icon-home"></i>
                    <span>首页</span>
                </a>
            </li>  
            
              <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-edit"></i>
                    <span>课程录入</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="<%=basePath%>enteringCourses_skipforwordjsp.action">录入课程</a></li>
                    <li><a href="<%=basePath%>enteringCourses_lookTeacherEnteredCourse.action">查看已录入课程</a></li>
                </ul>
            </li>  
            
             <li>
                <a class="dropdown-toggle" href="#" >
                    <i class="icon-th-large"></i>
                    <span>选课管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                 <ul class="submenu">
                    <li><a href="<%=basePath%>selectAllcourse_publicTeacherCourse.action">选课管理</a></li>
                   <%--  <li><a href="<%=basePath%>selectAllcourse_selectedCourse.action">已选课程</a></li> --%>
                </ul>
            </li>  
             <li>
                <a href="<%=basePath%>teacherAction_lookteacherInfo.action">
                    <i class="icon-cog"></i>
                    <span>个人信息</span>
                </a>
            </li>
             <li>
                <a  href="<%=basePath%>loginsc_quit.action">
                    <i class="icon-share-alt"></i>
                    <span>退出</span>
                </a>
            </li>
	 </c:if>		
        
        <c:if test="${identity=='2'}">
        
            <li class="active">
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
                <a href="<%=basePath%>home_getAllFile.action">
                    <i class="icon-home"></i>
                    <span>首页</span>
                </a>
            </li> 
            
             <li>
                <a class="dropdown-toggle" href="#" >
                    <i class="icon-th-large"></i>
                    <span>选课管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                 <ul class="submenu">
                    <li><a href="<%=basePath%>selectAllcourse_publicCourse.action">选课管理</a></li>
                    <li><a href="<%=basePath%>selectAllcourse_selectedCourse.action">已选课程</a></li>
                </ul>
            </li>  
            
             <li>
                <a href="<%=basePath%>studentInfo_lookMyselfInfo.action">
                    <i class="icon-cog"></i>
                    <span>个人信息</span>
                </a>
            </li>
        
          <li>
                <a  href="<%=basePath%>loginsc_quit.action">
                    <i class="icon-share-alt"></i>
                    <span>退出</span>
                </a>
            </li>
        </c:if>
        
        <c:if test="${identity=='3'}">
            <li class="active">
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
                <a href="<%=basePath%>home_getAllFile.action">
                    <i class="icon-home"></i>
                    <span>首页</span>
                </a>
            </li>       
    
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-group"></i>
                    <span>用户管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="<%=basePath%>manageStudentInfo_lookAllRegisteredStudent.action">已注册学生</a></li>
                    <li><a href="<%=basePath%>manageStudentInfo_lookAllselectedStudent.action">已选课学生</a></li>
                    <li><a href="<%=basePath%>manageStudentInfo_skipforwardtoNewUser.action">添加用户</a></li> 
                </ul>
            </li>
      
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-edit"></i>
                    <span>课程录入</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="<%=basePath%>enteringCourses_skipforwordjsp.action">录入课程</a></li>
                    <li><a href="<%=basePath%>enteringCourses_lookEnteredCourse.action">查看已录入课程</a></li>
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle" href="#" >
                    <i class="icon-th-large"></i>
                    <span>选课管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                 <ul class="submenu">
                    <li><a href="<%=basePath%>selectAllcourse_publicCourse.action">选课管理</a></li>
                    <li><a href="<%=basePath%>selectAllcourse_selectedCourse.action">已选课程</a></li>
                </ul>
            </li>
            
            <li>
                <a href="<%=basePath%>administratorAction_lookAdministratorInfo.action">
                    <i class="icon-cog"></i>
                    <span>个人信息</span>
                </a>
            </li>
             <li>
                <a href="<%=basePath%>fileupload_findAllUploadedFile.action">
                    <i class="icon-share"></i>
                    <span>上传</span>
                </a>
            </li> 
            <li>
                <a  href="<%=basePath%>loginsc_quit.action">
                    <i class="icon-share-alt"></i>
                    <span>退出</span>
                </a>
            </li>
            </c:if>
        </ul>
    </div>
    <!-- end sidebar -->

   
	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
           <!--  <div id="pad-wrapper"> -->
           <br>
					<h3>通知公告</h3>
					<br>
					<c:if test="${identity=='2'}">
					hello
					</c:if>
			<p><marquee direction="left">欢迎<b><font color="red"><s:property value="#session.userName"/></font></b>登录北方民族大学创新创业学院选课系统！本学期可选课程有：
			<c:if test="${courseType!=''}">
				<c:forEach items="${courseType}" var="course">
				${course.courseName}
				</c:forEach>
			</c:if>
			</marquee></p>
                 <div  > 
                   <table  class="table1" >
                   <thead>
	                   <tr>
		                   <th ><font size="3px">公告标题</font></th>
		                   <th ><font size="3px">发布单位</font></th>
		                   <th ><font size="3px">发布时间</font></th>
	                   </tr>
                   </thead>
                   <tbody  >
                   <c:forEach items="${listfile}" var="fileName">
		                   <tr class=Off onMouseOut="this.className='Off'" onMouseOver="this.className='Up'">
			                   <td ><a href="<%=basePath%>filedownload.action?fileId=${fileName.id}"><b>${fileName.fileName} </b></a></td>
			                   <td>${fileName.publishingUnit}</td>
			                   <td>${fileName.publishDate}</td>
		                   </tr>
		                   
		            </c:forEach> 
		                  
                   </tbody>
                   </table>
                   </div>
        </div>
    </div>


	<!-- scripts -->
    <script src="<%=basePath%>selectcourse/js/jquery-latest.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/jquery-ui-1.10.2.custom.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/jquery.knob.js"></script>
    <script src="<%=basePath%>selectcourse/js/jquery.flot.js"></script>
    <script src="<%=basePath%>selectcourse/js/jquery.flot.stack.js"></script>
    <script src="<%=basePath%>selectcourse/js/jquery.flot.resize.js"></script>
    <script src="<%=basePath%>selectcourse/js/theme.js"></script>


</body>
</html>