<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>选课学生名单  course-Student</title>
    
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
<body onload="loadwork()">

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
		         <li>                
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
            <li>
                <a  href="<%=basePath%>loginsc_quit.action">
                    <i class="icon-share-alt"></i>
                    <span>退出</span>
                </a>
            </li>
        </c:if>
        <c:if test="${identity=='2'}">
            <li>                
                <a href="<%=basePath%>home_getAllFile.action">
                    <i class="icon-home"></i>
                    <span>首页</span>
                </a>
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
            <li>                
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
                     <li><a href="<%=basePath%>manageStudentInfo_lookAllselectedStudent.action" class="active">已选课学生</a></li>
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
        
        <!-- settings changer -->
        
        
        <div class="container-fluid">
            <div id="pad-wrapper">
                
                <!-- products table-->
                <!-- the script for the toggle all checkboxes from header is located in js/theme.js -->
                <div class="table-wrapper products-table section">
                    <div class="row-fluid head">
                        <div class="span12">
                            <h3>已选课学生名单</h3>
                        </div>
                    </div>

                    <div class="row-fluid filter-block">
                        <div class="pull-right">
                           	课程名： <div class="ui-select">
                                <select id="select" onchange="changeName(this.value)"  >
                                <option>请选择课程</option>
                                </select>
                            </div>
                            
                              <div class="pull-right">
                           	班级： <div class="ui-select">
                                <select id="selectClassNum"  >
                               		<option value="">请选择班级</option>
                                </select>
                            </div>
                           <!-- <input type="text" class="search" />-->
                            <a class="btn-flat success new-product" onclick="selectButtons()">查询</a>
                        </div>
                    </div>

                   
                </div>
                <!-- end products table -->

                <!-- orders table -->
                <div class="table-wrapper orders-table section">
                    <div class="row-fluid" style="overflow-x: auto;">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="span2" >
                                       	 学号
                                    </th>
                                    <th class="span3">
                                     	   姓名
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>
                                       	 课程名
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>
                                                                                                      上课时间
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>
                                     	    上课班级
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>
                                     	  学院专业
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- row -->
                                <c:if test="${studentList!=null}">
                                <s:iterator value="studentList" id="stulist">
                                <tr class="first">
                                    <td>
                                        <s:property value="#stulist.studentId"/>
                                    </td>
                                    <td>
                                         <s:property value="#stulist.studentName"/>
                                    </td>
                                    <td>
                                        <s:property value="#stulist.courseName"/>
                                    </td>
                                    <td>
                                       <s:property value="#stulist.courseTime"/>
                                    </td>
                                    <td>
                                        <s:property value="#stulist.courseClass"/>
                                    </td>
                                    <td>
                                       <s:property value="#stulist.academy"/> <s:property value="#stulist.majoyClass"/>
                                    </td>
                                </tr>
                                </s:iterator>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                   </div>
                </div>
                 <div class="pagination pull-right">
                                                                 共
                     	<c:if test="${recordCount!=''}">
                     	${recordCount}
                     	</c:if>
                     	条;&nbsp;&nbsp;每页${countPerpage3}条
                     
                     	&nbsp;&nbsp;
                     <ul>
                     	
                        <li><a href="#">&#8249;</a></li>
                        <c:if test="${pageCount!=''}">
                        	<c:forEach var="s"  begin="1" end="${pageCount}">
									<li><a href="<%=basePath%>manageStudentInfo_lookAllselectedStudent.action?pageNum3=${s}">${s}</a></li> 
							</c:forEach>
                        </c:if>
                      <!--   <li><a class="active" href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li> -->
                        <li><a href="#">&#8250;</a></li>
                    </ul>
                </div>
                <!-- end users table -->
            </div>
        </div>
    </div>
    <!-- end main container -->

	<!-- scripts -->
	<script type="text/javascript">
	
	
	
	function selectButtons (){
	var val = $("#select").val();
	var val2=$("#selectClassNum").val();
    				/*  alert("zhi="+val+" val2="+val2);   */
   window.location.href="<%=basePath%>manageStudentInfo_selectedSCInfoByValue.action?selectCourseName="+val+"&selectCourseClass="+val2;
    	       
	}
	
	function changeName(name){
	/* alert("name="+name); */
							 $.ajax({
									   type: "POST",		
									 				  
									   url: "<%=basePath%>manageStudentInfo_findChooseCourseClass.action?selectCourseName="+name,									    
                                       
                                      dataType : "json",  
									   success : function(msg){
									  
									     alert( "Data Saved: " + msg );
									     
									        var str = "<option value=''>请选择</option>";   
                                       $("#selectClassNum").html("");  
                                          for ( var i = 0; i < msg.length; i++) {  
                                        str += "<option value='" + msg[i].courseClass
                                        + "'>" + msg[i].courseClass 
                                        + "</option>";  
                                      }  
                                       $("#selectClassNum").append(str);  
									   },
									   
									   error: function(msg){
														alert("error"+msg);
														
										}  
									  
									});
	
	
	}
	
	
	

	function loadwork(){
	/* alert("ready"); */
						  $.ajax({
									   type: "GET",		
									 				  
									   url: "<%=basePath%>manageStudentInfo_chooseCourseType.action",									    
                                       
                                       dataType:"json",
									   success: function(msg){
									   
									  /*    alert( "Data Saved: " + msg.length );  */
									     
									     var str = "<option value=''>请选择</option>";  
                                        $("#select").html("");  
                                          for ( var i = 0; i < msg.length; i++) {  
                                        str += "<option value='" + msg[i].courseName
                                        + "'>" + msg[i].courseName  
                                        + "</option>";  
                                      }  
                                       $("#select").append(str);  
									   },
									   
									   error: function(msg){
														alert("error"+msg);
														
										}
									  
									}); 
								}
	
	
	</script>
	
	
    <script src="<%=basePath%>selectcourse/js/jquery-latest.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/theme.js"></script>

</body>
</html>