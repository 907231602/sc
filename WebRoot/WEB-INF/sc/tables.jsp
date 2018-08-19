<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.util.*"%>
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
	<title>选课- Tables</title>
    
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
                    <li><a href="<%=basePath%>enteringCourses_lookTeacherEnteredCourse.action">查看已录入课程</a></li>
                </ul>
            </li>
            
            <li >
                <a class="dropdown-toggle" href="#">
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
                <a href="<%=basePath%>loginsc_quit.action">
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
                            <h3>选课</h3>
                        </div>
                    </div>

                    <div class="row-fluid filter-block">
                        <div class="pull-right">
                           	课程名： <div class="ui-select">
                                <select id="selct">
                                 <!--  <option value="GYB">GYB</option>
                                  <option value="SYB">SYB</option>
                                  <option value="电子商务">电子商务</option>
                                  <option value="创业管理">创业管理</option> -->
                                </select>
                            </div>
                           <!-- <input type="text" class="search" />-->
                            <a class="btn-flat success new-product" id="selectButton">查询</a>
                        </div>
                    </div>

                    <div class="row-fluid" style="overflow-x: auto;">
                        <table class="table table-hover" id="tableId" >
                            <thead>
                       <!-- row -->
                                <tr>
                                	 <th class="span3">
                                       <!--  <input type="checkbox" /> -->
                                    </th>
                                    <th class="span3">
                                                                                                                                                                        课程名称
                                    </th>
                                    <!--<th class="span3">
                                        <span class="line"></span>课程代码
                                    </th>-->
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
                                        <span class="line"></span>容量
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>余量
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>操作
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                       <%--    aaa: <s:property value="#session.AS"/>  --%> 
                          
                           <c:if test="${identity=='1'}">
                           1
                                <!-- row -->
                                <c:forEach var="allcourse" items="${allCourse}" varStatus="st" >
                                  <tr class="first">
                                    <td>  <input type="checkbox" name="checkbox" id="ids" value="${allcourse.courseId}"/> </td>
                                     <td class="description"><a onclick="lookSelectedStudent('${allcourse.courseId}','${allcourse.courseClass}')" href="#">${allcourse.courseName}</a> </td>
                                     <td class="description">${allcourse.courseTeacher}</td>
                                     <td class="description">${allcourse.courseClass}</td>
                                     <td class="description">${allcourse.coursePlace}</td>
                                     <td class="description">${allcourse.courseCredit} </td>
                                     <td class="description">${allcourse.courseTime}</td>
                                     <td class="description">${allcourse.courseCount}</td>
                                     <td class="description">${allcourse.courseOverplus} </td>
                                   <%--  <td>  <input type="button" onclick="aa('${allcourse.courseClass}')" id="choose" value="选课"></td> --%>
                                  </tr>
                                </c:forEach>
                           </c:if>  
                          
                          
                          <c:if test="${identity=='2'}">
                          2
                                <!-- row -->
                                <c:forEach var="allcourse" items="${allCourse}" varStatus="st" >
                                  <tr class="first">
                                    <td>  <input type="checkbox" name="checkbox" id="ids" value="${allcourse.courseId}"/> </td>
                                    <td class="description">${allcourse.courseName} </td>
                                    <td class="description">${allcourse.courseTeacher}</td>
                                     <td class="description">${allcourse.courseClass}</td>
                                     <td class="description">${allcourse.coursePlace}</td>
                                     <td class="description">${allcourse.courseCredit} </td>
                                     <td class="description">${allcourse.courseTime}</td>
                                     <td class="description">${allcourse.courseCount}</td>
                                     <td class="description">${allcourse.courseOverplus} </td>
                                    <td>  <input type="button" onclick="aa('${allcourse.courseClass}')" id="choose" value="选课"></td>
                                  </tr>
                                </c:forEach>
                           </c:if>  
                           
                            <c:if test="${identity=='3'}">
                                <!-- row -->
                                3
                                <c:forEach var="allcourse" items="${allCourse}" varStatus="st" >
                                  <tr class="first">
                                    <td>  <input type="checkbox" name="checkbox" id="ids" value="${allcourse.courseId}"/> </td>
                                   <td class="description"><a onclick="lookSelectedStudent('${allcourse.courseId}','${allcourse.courseClass}')" href="#">${allcourse.courseName}</a> </td>
                                    <td class="description">${allcourse.courseTeacher}</td>
                                     <td class="description">${allcourse.courseClass}</td>
                                     <td class="description">${allcourse.coursePlace}</td>
                                     <td class="description">${allcourse.courseCredit} </td>
                                     <td class="description">${allcourse.courseTime}</td>
                                     <td class="description">${allcourse.courseCount}</td>
                                     <td class="description">${allcourse.courseOverplus} </td>
                                   <%--  <td>  <input type="button" onclick="aa('${allcourse.courseClass}')" id="choose" value="选课"></td> --%>
                                  </tr>
                                </c:forEach>
                           </c:if>  
                           
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
    
    
    	<c:if test="${courseType=='SELECTED'}">
	    	<script type="text/javascript">
	    		alert("仅能选一门课程,你已选了一门课程");
	    	</script>
    	</c:if>
    	
    	<c:if test="${AS=='PEOPLEOVER'}">
	    	<script type="text/javascript">
	    	 alert("人数已满");
	    	</script>
    	</c:if>
    	
    	<c:if test="${selectOk=='selectOk'}">
	    	<script type="text/javascript">
	    	 alert("恭喜你，已选了一门课程");
	    	</script>
    	</c:if>
                            
	<!-- scripts -->
    <script src="<%=basePath%>selectcourse/js/jquery-latest.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/theme.js"></script>

     <script type="text/javascript">
     $(document).ready(function(){
    		   $("#selectButton").click(function() {
    		        var isshow = $("#selct ").val();
    		   window.location.href="<%=basePath%>selectCourseByoption_selectcourseByValue.action?chooseCourse="+isshow;  
    	        });
     });
     
     
     $(document).ready(function(){
    	 $.ajax({
			   type: "POST",		
			   url: "<%=basePath%>selectCourseByoption_chooseCourseTypeTojsp.action",									    
             dataType:"json",
			   success: function(msg){
			     var str = "<option>请选择</option>";  
             $("#selct").html("");  
                for ( var i = 0; i < msg.length; i++) {  
              str += "<option value='" + msg[i].courseName
              + "'>" + msg[i].courseName  
              + "</option>";  
            }  
             $("#selct").append(str);  
			   },
			   
			   error: function(msg){
								alert("error"+msg);
								
				}
			  
			});
    	 
    	 
    	}); 
    </script>
    
     <script type="text/javascript">
     function aa(a){
    	
		 var r=document.getElementsByName("checkbox");
		 for(var i=0;i<r.length;i++){
		 if(r[i].checked){
		/*  alert(r[i].value); */
		var isSure=confirm("确定选择该课程");
		if(isSure)
		 window.location.href="<%=basePath%>selectCourseByoption_selectedcourseBycheckbox.action?chooseCourseId="+r[i].value+"&chooseCourseClass="+a;
	     
		 	}
		 	}
		 }
     
     function lookSelectedStudent(a,b){
    	 /* alert(a+","+b); */
    	 window.open("<%=basePath%>selectCourseByoption_lookSCStudents.action?chooseCourseId="+a+"&chooseCourseClass="+b,"_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=800px, height=900px");

     }
     
     /* $(function(){
    	
    		 $("#choose").click(function(){
    			   alert("是否选定此课");
    			   var tableElement = document.getElementById("tableId");
    		  		var size = tableElement.rows.length;
    		  		alert(size);
    		  	$("input[name='checkbox']:checked").each(function () {
    	                    alert(this.value);
    	                });
    		   }); 
    		   }); */
    </script>
</body>
</html>