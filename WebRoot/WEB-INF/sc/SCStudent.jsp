<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>查看已录选课学生名单- Form Wizard</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
    <!-- bootstrap -->
    <link href="<%=basePath%>selectcourse/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="<%=basePath%>selectcourse/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="<%=basePath%>selectcourse/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- libraries -->
    <link href="<%=basePath%>selectcourse/css/lib/bootstrap-wysihtml5.css" type="text/css" rel="stylesheet" />
    <link href="<%=basePath%>selectcourse/css/lib/uniform.default.css" type="text/css" rel="stylesheet" />
    <link href="<%=basePath%>selectcourse/css/lib/select2.css" type="text/css" rel="stylesheet" />
    <link href="<%=basePath%>selectcourse/css/lib/bootstrap.datepicker.css" type="text/css" rel="stylesheet" />
    <link href="<%=basePath%>selectcourse/css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>selectcourse/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>selectcourse/css/elements.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>selectcourse/css/icons.css" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="<%=basePath%>selectcourse/css/compiled/form-wizard.css" type="text/css" media="screen" />
  <link rel="stylesheet" href="<%=basePath%>selectcourse/css/compiled/index.css" type="text/css" media="screen" />    
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
               <%--  <li class="settings hidden-phone">
                    <a href="<%=basePath%>loginsc_quit.action" role="button">
                        <i class="icon-share-alt" title="退出"></i>
                    </a>
                </li> --%>
            </ul>            
        </div>
    </div>
    <!-- end navbar -->

    <!-- sidebar -->
   <%--  <div id="sidebar-nav">
        <ul id="dashboard-menu">
            <li>                
                <a href="<%=basePath%>home_getAllFile.action">
                    <i class="icon-home"></i>
                    <span>首页</span>
                </a>
            </li>            
          <c:if test="${identity=='1'}">
          	<li class="active">
                <a class="dropdown-toggle" href="#">
                    <div class="pointer">
                        <div class="arrow"></div>
                        <div class="arrow_border"></div>
                    </div>
                    <i class="icon-edit"></i>
                    <span>课程录入</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="active submenu">
                    <li><a href="<%=basePath%>enteringCourses_skipforwordjsp.action">录入课程</a></li>
                    <li><a href="<%=basePath%>enteringCourses_lookEnteredCourse.action" class="active">查看已录入课程</a></li>
                </ul>
            </li>
           
            <li >
                <a class="dropdown-toggle"  href="#">
                    <i class="icon-th-large"></i>
                    <span>选课管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                 <ul class="submenu">
                    <li><a href="<%=basePath%>selectAllcourse_publicCourse.action">选课管理</a></li>
                    <li><a href="<%=basePath%>selectAllcourse_selectedCourse.action">已选课程</a></li>
                </ul>
                </a>
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
                <a class="dropdown-toggle"  href="#">
                    <i class="icon-th-large"></i>
                    <span>选课管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                 <ul class="submenu">
                    <li><a href="<%=basePath%>selectAllcourse_publicCourse.action">选课管理</a></li>
                    <li><a href="<%=basePath%>selectAllcourse_selectedCourse.action">已选课程</a></li>
                </ul>
                </a>
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
            <li class="active">
                <a class="dropdown-toggle" href="#">
                    <div class="pointer">
                        <div class="arrow"></div>
                        <div class="arrow_border"></div>
                    </div>
                    <i class="icon-edit"></i>
                    <span>课程录入</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="active submenu">
                    <li><a href="<%=basePath%>enteringCourses_skipforwordjsp.action">录入课程</a></li>
                    <li><a href="<%=basePath%>enteringCourses_lookEnteredCourse.action" class="active">查看已录入课程</a></li>
                </ul>
            </li>
           
            <li >
                <a class="dropdown-toggle"  href="#">
                    <i class="icon-th-large"></i>
                    <span>选课管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                 <ul class="submenu">
                    <li><a href="<%=basePath%>selectAllcourse_publicCourse.action">选课管理</a></li>
                    <li><a href="<%=basePath%>selectAllcourse_selectedCourse.action">已选课程</a></li>
                </ul>
                </a>
            </li>
            <li>
                <a href="<%=basePath%>administratorAction_lookAdministratorInfo.action">
                    <i class="icon-cog"></i>
                    <span>个人信息</span>
                </a>
            </li>
            <li>
	                <a href="<%=basePath%>fileupload_findAllUploadedFile.action">
	                    <i class="icon-cog"></i>
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
    </div> --%>
    <!-- end sidebar -->


	<!-- main container -->
      <div class="content">
          <div class="table-products">
        <div class="container-fluid">
            <div id="pad-wrapper">
				<h3>已录入课程</h3>
				<br>
                <div class="row-fluid" style="overflow-x: auto;">
                
                  <table class="table table-hover" >
                            <thead>
                                <tr>
                                <th>
                                <input type="checkbox" />
                                </th>
                                    <th class="span3">
                                      		  学生学号    
                                    </th>
                                    <th class="span3">
                                       		 学生姓名
                                    </th>
                                    <th class="span3">
                                       		性别
                                    </th>
                                    <th class="span3">
                                        	学院
                                    </th>
                                    <th class="span3">
                                       		专业班级
                                    </th>
                                      <th class="span3">
                                        	电话
                                    </th>
                                     <th class="span3">
                                        		课程编号
                                    </th>
                                    <th class="span3">
                                        		课程名称
                                    </th>
                                    <th class="span3">
                                        		上课班级
                                    </th> 
                                     <th class="span3">
                                        		学分
                                    </th> 
                                    <th class="span3">
                                        		上课时间
                                    </th> 
                                </tr>
                            </thead>
                            <tbody>
                                <!-- row -->
                               <%--  ${addStu} --%>
                               <c:forEach items="${addStu}" var="course" varStatus="i">
                                <tr class="first">
                                 <td>  <input type="checkbox" name="checkbox" id="ids" value="${course[0].studentId}"/> </td>
                                    <td>
                                      ${course[0].studentId}
                                    </td>
                                   <td  class="description">
                                      ${course[0].studentName}
                                    </td>
                                     <td>
                                       ${course[0].studentSex}
                                    </td>
                                    <td class="description">
                                         ${course[0].academy}
                                    </td>
                                    <td class="description">
                                        ${course[0].majoyClass}
                                    </td>
                                     <td>
                                        ${course[0].email}
                                    </td> 
                                     <td>
                                        ${course[0].courseId}
                                    </td> 
                                     <td>
                                        ${course[0].courseName}
                                    </td> 
                                     <td>
                                        ${course[0].courseClass}
                                    </td> 
                                     <td>
                                        ${course[0].courseCredit}
                                    </td> 
                                     <td>
                                        ${course[0].courseTime}
                                    </td> 
                                   <%--  <td class="description">
                                        ${course.coursePlace}
                                    </td>
                                     <td>
                                       ${course.courseCount}
                                    </td>
                                    <td class="description">
                                        ${course.courseRemark}
                                    </td> --%>
                                   <!--  <td>
                                       
                                        <ul class="actions">
                                            <li><i class="table-edit" id="aa"   onclick="bianji()" title="编辑" ></i></li>
                 							<li><i class="table-settings" title="发布"  onclick="fabu()"></i></li>
                                            <li class="last"><i class="table-delete"   onclick="shanchu()" title="删除"></i></li>
                                   
                                        </ul>
                                    </td> -->
                                </tr>
                                </c:forEach> 
                            </tbody>
                          <input type="button" onclick="doExportExcel()" value="导出">
                        </table>
                </div>
            </div>
        </div>
            </div>
    </div>  
    <!-- end main container -->

<script type="text/javascript">
	function doExportExcel(){
		var r=document.getElementsByName("checkbox");
		  var str="";
		for(var i=0;i<r.length;i++){
		 if(r[i].checked){
		
		 	str+=r[i].value+",";
		 	 }
		 	}
		 	
		 	 <%-- $.ajax({
			   type: "POST",		
			   url: "<%=basePath%>selectAllcourse_exportExcel.action",	
			   data:{
			   "chooseStudentId":str
			   },								    
             dataType:"json",
			   success: function(msg){
			   alert(msg);
			  
			   },
			}); --%>
      		 window.open("selectAllcourse_exportExcel.action?chooseStudentId="+str); 
      	}
</script>
	<!-- scripts for this page -->
    <script src="<%=basePath%>selectcourse/js/jquery-latest.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/theme.js"></script>
    <script src="<%=basePath%>selectcourse/js/fuelux.wizard.js"></script>

    <script type="text/javascript">
        $(function () {
            var $wizard = $('#fuelux-wizard'),
                $btnPrev = $('.wizard-actions .btn-prev'),
                $btnNext = $('.wizard-actions .btn-next'),
                $btnFinish = $(".wizard-actions .btn-finish");

            $wizard.wizard().on('finished', function(e) {
                // wizard complete code
            }).on("changed", function(e) {
                var step = $wizard.wizard("selectedItem");
                // reset states
                $btnNext.removeAttr("disabled");
                $btnPrev.removeAttr("disabled");
                $btnNext.show();
                $btnFinish.hide();

                if (step.step === 1) {
                    $btnPrev.attr("disabled", "disabled");
                } else if (step.step === 4) {
                    $btnNext.hide();
                    $btnFinish.show();
                }
            });

            $btnPrev.on('click', function() {
                $wizard.wizard('previous');
            });
            $btnNext.on('click', function() {
                $wizard.wizard('next');
            });
        });
    </script>

</body>
</html>