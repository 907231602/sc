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
	<title>课程录入- Form Showcase</title>
    
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
    <link rel="stylesheet" href="<%=basePath%>selectcourse/css/compiled/form-showcase.css" type="text/css" media="screen" />

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
                    <li><a href="<%=basePath%>enteringCourses_skipforwordjsp.action" class="active">录入课程</a></li>
                    <li><a href="<%=basePath%>enteringCourses_lookTeacherEnteredCourse.action">查看已录入课程</a></li>
                </ul>
            </li>
            
            <li>
                <a  class="dropdown-toggle" href="#">
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
           	<li>
                <a  class="dropdown-toggle" href="#">
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
                    <li><a href="<%=basePath%>enteringCourses_skipforwordjsp.action" class="active">录入课程</a></li>
                    <li><a href="<%=basePath%>enteringCourses_lookEnteredCourse.action">查看已录入课程</a></li>
                </ul>
            </li>
            
            <li>
                <a  class="dropdown-toggle" href="#">
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
            <div id="pad-wrapper" class="form-page">
                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <h3>课程录入</h3>
                    <br>
                    <div class="span8 column">
                        <form action="<%=basePath%>enteringCourses_enteringNewCourse.action" onsubmit="return checkCourse()" method="post">
                            <div class="field-box">
                                <label>课程代码:</label>
                                <input class="span8 inline-input" id="courseId" name="courses.courseId" placeholder="课程代码"  />
                            </div>
                            <div class="field-box">
                                <label>课程名称:</label>
                                <input class="span8 inline-input" id="courseName" name="courses.courseName" placeholder="课程名称"  />
                            </div>                            
                            <div class="field-box">
                                <label>学分:</label>
                                <input class="span8 inline-input" id="courseCredit" name="courses.courseCredit" placeholder="学分"  />
                            </div>
                            <div class="field-box">
                                <label>班级:</label>
                                <input class="span8 inline-input" id="courseClass"  name="courses.courseClass" placeholder="班级"   />
                            </div> 
                            <div class="field-box">
                                <label>任课教师:</label>
                                    <input class="span8 inline-input" id="courseTeacher" name="courses.courseTeacher" placeholder="任课教师" />
                            </div>
                            <div class="field-box">
                                <label>开课时间:</label>
                                <input class="span8 inline-input" id="courseTime" name="courses.courseTime" placeholder="开课时间"   />
                            </div> 
                            <div class="field-box">
                                <label>上课地点:</label>
                                <input class="span8 inline-input" id="coursePlace" name="courses.coursePlace" placeholder="上课地点"   />
                            </div> 
                            <div class="field-box">
                                <label>选课总人数:</label>
                                <input class="span8 inline-input" id="courseCount" name="courses.courseCount" placeholder="选课总人数"  />
                            </div> 
                            <div class="field-box">
                                <label>备注:</label>
                                <textarea class="span8" name="courses.courseRemark" rows="4"></textarea>
                            </div>
                            <div class="field-box">
                                
                                <div class="wysi-column" >
                                	<!-- <button>提交</button> <button >重置</button>  -->
                                <button type="submit">提交</button>
                                	 <button type="reset">重置</button>
                                </div>
                                
                            </div>
                        </form>
                    </div>

                    <!-- right column -->
                    <div class="span4 column pull-right">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end main container -->

	<!-- scripts for this page -->
    <script src="<%=basePath%>selectcourse/js/wysihtml5-0.3.0.js"></script>
    <script src="<%=basePath%>selectcourse/js/jquery-latest.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap-wysihtml5-0.0.2.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap.datepicker.js"></script>
    <script src="<%=basePath%>selectcourse/js/jquery.uniform.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/select2.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/theme.js"></script>

    <!-- call this page plugins -->
    <script type="text/javascript">
       function checkCourse(){
    	   var courseId= $("#courseId").val();
    	   if(courseId==""){alert("请输入课程代码"); return false;}
    	   var courseName= $("#courseName").val();
    	   if(courseName==""){alert("请输入课程名称"); return false;}
    	   var courseCredit= $("#courseCredit").val();
    	   if(courseCredit==""){alert("请输入课程的学分"); return false;}
    	   var courseClass= $("#courseClass").val();
    	   if(courseClass==""){alert("请输入课程的班级"); return false;}
    	   var courseTeacher= $("#courseTeacher").val();
    	   if(courseTeacher==""){alert("请输入该课程老师"); return false;}
    	   var courseTime= $("#courseTime").val();
    	   if(courseTime==""){alert("请输入课程上课时间"); return false;}
    	   var coursePlace= $("#coursePlace").val();
    	   if(coursePlace==""){alert("请输入课程上课地点"); return false;}
    	   var courseCount= $("#courseCount").val();
    	   if(courseCount==""){alert("请输入课程上课总人数"); return false;}
    	  
    	   return true;
       }
    </script>

</body>
</html>