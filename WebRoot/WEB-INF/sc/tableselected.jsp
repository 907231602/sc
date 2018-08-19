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
	<title>已选课程- Tableselected</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
    <!-- bootstrap -->
    <link href="<%=basePath%>selectcourse/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="<%=basePath%>selectcourse/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="<%=basePath%>selectcourse/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>selectcourse/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>selectcourse/css/elements.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>selectcourse/css/icons.css" />

    <!-- libraries -->
    <link href="<%=basePath%>selectcourse/css/lib/font-awesome.css" type="text/css" rel="stylesheet" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="<%=basePath%>selectcourse/css/compiled/tables.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
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
               <%--  <li class="settings hidden-phone">
                    <a href="<%=basePath%>studentInfo_lookMyselfInfo.action" role="button">
                        <i class="icon-cog"></i>
                    </a>
                </li> --%>
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
            <li>                
                <a href="<%=basePath%>home_getAllFile.action">
                    <i class="icon-home"></i>
                    <span>首页</span>
                </a>
            </li>            
            <c:if test="${identity=='1'}">
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
            
            <li >
                <a class="dropdown-toggle" href="#">
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
                <a href="<%=basePath%>teacherAction_lookteacherInfo.action">
                    <i class="icon-cog"></i>
                    <span>个人信息</span>
                </a>
            </li>
            </c:if>
            
            <c:if test="${identity=='2'}">
            <li >
                <a class="dropdown-toggle" href="#">
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
            
            </c:if>
            
            <c:if test="${identity=='3'}">
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
            
            <li >
                <a class="dropdown-toggle" href="#">
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
               </c:if>
            <li>
                <a  href="<%=basePath%>loginsc_quit.action">
                    <i class="icon-share-alt"></i>
                    <span>退出</span>
                </a>
            </li>
        </ul>
    </div>
    <!-- end sidebar -->


	<!-- main container -->
    <div class="content">
        
        <!-- settings changer -->
        
        
        <div class="container-fluid">
            <div id="pad-wrapper">
                
                <!-- products table-->
                <!-- the script for the toggle all checkboxes from header is located in js/theme.js -->
                <div class="table-wrapper products-table section">
                    <div class="row-fluid head">
                        <div class="span12">
                            <h3>已选课程</h3>
                        </div>
                    </div>
				<br>
                   <!-- <div class="row-fluid filter-block">
                        <div class="pull-right">
                           	课程名： <div class="ui-select">
                                <select>
                                  <option />GYB
                                  <option />SYB
                                  <option />电子商务
                                </select>
                            </div>
                            <a class="btn-flat success new-product">查询</a>
                        </div>
                    </div>-->

                    <div class="row-fluid" style="overflow-x: auto;">
                        <table class="table table-hover" >
                            <thead>
                                <tr>
                                	 <th class="span3">
                                      <!--   <input type="checkbox" /> -->
                                    </th>
                                    <th class="span3">
                                                                                                                                                                       课程名称
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>任课教师
                                    </th>
                                   <th class="span3">
                                        <span class="line"></span>上课班级
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>上课地点
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>学分
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>起始结束周
                                    </th>
                                   
                                    <th class="span3">
                                        <span class="line"></span>操作
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                           
                                <!-- row -->
                               <%--  ${courseed} --%>
                                <c:forEach  items="${courseed}" var="course"   >
                                <%--   <c:forEach  items="${course}" var="course1"   > --%>
	                                 <%-- <c:out value="${ course1.courseId}"></c:out> --%>
	                                 <tr class="first">
	                                    <td><input type="checkbox" name="checkbox" value="<c:out value="${ course.courseId}"></c:out>"/></td>
	                                    <td class="description"><c:out value="${course.courseName}"></c:out></td>
	                                     <td class="description"><c:out value="${course.courseTeacher}"></c:out></td>
	                                     <td class="description"><c:out value="${course.courseClass}"></c:out></td>
	                                     <td class="description"><c:out value="${course.coursePlace}"></c:out></td>
	                                     <td class="description"><c:out value="${course.courseCredit}"></c:out></td>
	                                     <td class="description"><c:out value="${course.courseTime}"></c:out></td>
	                                     <td><input type="button" onclick="aa('${course.courseClass}')" value="退课"/></td>
	                                </tr>
                               <%--  </c:forEach>  --%>
                                </c:forEach>
                               <%--<c:forEach var="course" items="${courseed}">
                               
                                 <tr class="first">
                                    <td><input type="checkbox" name="checkbox" value="${course.courseId}"/></td>
                                    <td class="description">${course.courseName}</td>
                                     <td class="description">${course.courseTeacher}</td>
                                     <td class="description">${course.courseClass}</td>
                                     <td class="description">${course.coursePlace}</td>
                                     <td class="description">${course.courseCredit}</td>
                                     <td class="description">${course.courseTime}</td>
                                     <td><input type="button" onclick="aa()" value="退课"/></td>
                                </tr> 
                                </c:forEach>--%>
                                <!-- row -->
                                
                                <!-- row -->
                                
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- end products table -->
            </div>
        </div>
    </div>
    <!-- end main container -->

	<!-- scripts -->
	<script type="text/javascript">
     function aa(classid){
    	 
		 var r=document.getElementsByName("checkbox");
		 for(var i=0;i<r.length;i++){
		 if(r[i].checked){
			 var isSure=confirm("确定退选该课程");
			 if(isSure)
		 window.location.href="<%=basePath%>deleteCourseBycheck_deletecourseBycheckbox.action?chooseCourseId="+r[i].value+"&chooseCourseClass="+classid;
		 	}
		 	}
		 }
    </script>
    <script src="<%=basePath%>selectcourse/js/jquery-latest.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/theme.js"></script>

</body>
</html>