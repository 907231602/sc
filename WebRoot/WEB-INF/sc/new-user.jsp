
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
	<title>添加用户- New User Form</title>
    
    <META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
    <META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
    
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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>selectcourse/css/lib/font-awesome.css" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="<%=basePath%>selectcourse/css/compiled/new-user.css" type="text/css" media="screen" />

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
           
            <li>
                <a class="dropdown-toggle"  href="#">
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
          
          			<li>
                <a class="dropdown-toggle"  href="#">
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
          
         
            <li class="active">
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-group"></i>
                    <span>用户管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="active submenu">
                    <li><a href="<%=basePath%>manageStudentInfo_lookAllRegisteredStudent.action">已注册学生</a></li>
                     <li><a href="<%=basePath%>manageStudentInfo_lookAllselectedStudent.action">已选课学生</a></li>
                     <li><a href="<%=basePath%>manageStudentInfo_skipforwardtoNewUser.action" class="active">添加用户</a></li> 
                   
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
                <a class="dropdown-toggle"  href="#">
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
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header">
                    <h3>添加教师用户</h3>
                </div>
					
					
					<c:if test="${isregister=='SUCCESS'}">
					<script type="text/javascript">
					alert("恭喜你，注册成功");
					</script>
					
					</c:if>


                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                            <form  action="manageStudentInfo_registerteacher.action" onsubmit="checkText()" method="post">
                                <div class="span12 field-box">
                                    <label>姓名:</label>
                                    <input class="span9" name="teachers.teacherName" type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>账号:</label>
                                   <input class="span9" id="teacherId" name="teachers.teacherId" type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>密码:</label>
                                    <input class="span9" id="teacherPassword" name="teachers.teacherPassword" type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>性别:</label>
                                    <input class="span9" name="teachers.teacherSex" type="text" />
                                </div>
                               
                                <div class="span12 field-box">
                                    <label>教授课程:</label>
                                    <input class="span9" name="teachers.teachCourse" type="text" />
                                </div>
                                  <div class="span12 field-box">
                                    <label>学位:</label>
                                    <input class="span9" name="teachers.teacherDegree" type="text" />
                                </div>
                                 <div class="span12 field-box">
                                    <label>电话:</label>
                                    <input class="span9" name="teachers.teacherPhone" type="text" />
                                </div>
                               <!--  <div class="span12 field-box textarea">
                                    <label>备注:</label>
                                    <textarea class="span9"></textarea>
                                </div> -->
                                <div class="span11 field-box actions">
                                    <input type="submit" class="btn-glow primary" value="提交" />
                                    
                                    <input type="reset" value="重置" class="btn-glow primary" />
                                </div>
                            </form>
                        </div>
                    </div>
				</div>
			</div>
		</div>
	</div>
                    <!-- side right column -->
                   
    <!-- end main container -->


	<!-- scripts -->
    <script src="<%=basePath%>selectcourse/js/jquery-latest.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/theme.js"></script>

    <script type="text/javascript">
    function checkText(){
    	  var teacherId= $("#teacherId").val();
   	   if(teacherId==""){alert("请输入正确账号"); return false;}
   	  var teacherPassword= $("#teacherPassword").val();
  	   if(teacherPassword==""){alert("请输入密码"); return false;}
  	   return true;
    }
    
    
        $(function () {

            // toggle form between inline and normal inputs
            var $buttons = $(".toggle-inputs button");
            var $form = $("form.new_user_form");

            $buttons.click(function () {
                var mode = $(this).data("input");
                $buttons.removeClass("active");
                $(this).addClass("active");

                if (mode === "inline") {
                    $form.addClass("inline-input");
                } else {
                    $form.removeClass("inline-input");
                }
            });
        });
    </script>

</body>
</html>