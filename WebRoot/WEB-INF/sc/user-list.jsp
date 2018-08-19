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
	<title>已注册学生- User list</title>
    
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
    <link rel="stylesheet" href="<%=basePath%>selectcourse/css/compiled/user-list.css" type="text/css" media="screen" />

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
           
            
            <li >
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
                <a href="<%=basePath%>teacherAction_lookteacherInfo.action">
                    <i class="icon-cog"></i>
                    <span>个人信息</span>
                </a>
            </li>
            </c:if>
            
            <c:if test="${identity=='2'}">
            	<li >
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
                    <li><a href="<%=basePath%>manageStudentInfo_lookAllRegisteredStudent.action" class="active">已注册学生</a></li>
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
        
        <div class="container-fluid">
            <div id="pad-wrapper" class="users-list">
                <div class="row-fluid header">
                    <h3>已注册学生名单</h3>
                   <!--  <div class="span10 pull-right">
                       	 研讨班： <input type="text"  placeholder="10" />
                                                                 课程名：
                                                          
                                        <select>
                                            <option>GYB</option>
                                            <option>GYB</option>
                                            <option>GYB</option>
                                            <option>GYB</option>
                                        </select>
                                      
                        <input type="button" class="btn-flat success pull-right" value="查询"/>
                         
                    </div> -->
                </div>

                <!-- Users table -->
                <div class="row-fluid table">
                    <table class="table table-hover" >
                        <thead>
                            <tr >
                            	<th>
                            	</th>
                                <th class="span4 sortable" >
                                    						姓名
                                </th>
                                <th class="span3 sortable">
                                    <span class="line"></span>学号
                                </th>
                                <th class="span3 sortable">
                                    <span class="line"></span>学院
                                </th>
                                <th class="span3 sortable">
                                    <span class="line"></span>专业班级
                                </th>
                                 <th class="span3 sortable">
                                    <span class="line"></span>性别
                                </th> 
                                <th class="span3 sortable">
                                    <span class="line"></span>邮箱
                                </th> 
                                <th class="span3 sortable ">
                                    <span class="line"></span>操作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <c:forEach items="${registerstudent}" var="register">
                        <tr >
                            <th>
                            	</th>
                            <td>
                                 ${register.studentName} 
                            </td>
                             <td>
                               ${register.studentId}
                            </td>
                            <td>
                          		${register.academy}
                            </td>
                            <td class="align-center">
                               ${register.majoyClass} 
                            </td>
                             <td>
                             ${register.studentSex} 
                            </td>
                            <td>
                                 ${register.email} 
                            </td>
                            <td >
                               <button onclick="deleteStu('${register.id}','${register.studentId}','${register.studentName}')">删除</button>
                            </td>
                        </tr>
                        </c:forEach>
                        <!-- row -->
                      
                        </tbody>
                    </table>
                </div>
                
                
                
                <div class="pagination pull-right">
                	<c:if test="${recordCount!=''}">
                     	${recordCount}
                     	</c:if>
                     	条;&nbsp;&nbsp;每页${countPerpage3}条
                     
                     	&nbsp;&nbsp;
                
                    <ul>
                        <li><a href="#">&#8249;</a></li>
                        <!-- <li><a class="active" href="#">1</a></li> -->
                         <c:if test="${pageCount!=''}">
                        	<c:forEach var="s"  begin="1" end="${pageCount}">
									<li><a href="<%=basePath%>manageStudentInfo_lookAllRegisteredStudent.action?pageNum3=${s}">${s}</a></li> 
							</c:forEach>
                        </c:if>
                        <!-- <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li> -->
                        <li><a href="#">&#8250;</a></li>
                    </ul>
                </div>
                <!-- end users table -->
            </div>
        </div>
    </div>
    <!-- end main container -->

<script type="text/javascript">
function deleteStu(a,b,c){
	
	var isdel=confirm("确定要删除学号为"+b+" 姓名为"+c+" 的学生");
	if(isdel){
		window.location.href="<%=basePath%>manageStudentInfo_deleteSelectedStudentByID.action?students.id="+a+"&students.studentId="+b;
	}
	else{
		
	}
	
}
 
</script>
	<!-- scripts -->
    <script src="<%=basePath%>selectcourse/js/jquery-latest.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/theme.js"></script>

</body>
</html>