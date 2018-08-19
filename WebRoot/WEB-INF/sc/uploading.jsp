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
	<title>上传- uploading</title>
    
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
#table table{width:100%}
#table table tr td{text-align: center;}
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
                <a href="<%=basePath%>teacherAction_lookteacherInfo.action">
                    <i class="icon-cog"></i>
                    <span>个人信息</span>
                </a>
            </li>
            
            </c:if>
            
            <c:if test="${identity=='2'}">
            
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
    <div class="content ">
        <div class="container-fluid "  id="body">
           <!--  <div id="pad-wrapper"> -->
           <br>
           <h3>上传</h3>
           <br>
				
    <form action="<%=basePath%>fileupload_fileUpload2.action" method="post" enctype="multipart/form-data">
    
        发布单位: <input type="text" name="username"><br>
       文件:  <input type="file" name="file"> 
        <input type="button" value="添加" id="button"><br>
        <div></div>
        <input type="submit" value="提交">
        <br> <br>
         <input type="button" value="查看" onclick="showTable()"/>
        
    </form>
        </div>
        <br>
        <hr  style="height:5px;border:none;border-top:5px ridge #3290EA;" >
        
        <div id="table"  >
                           <table >
	                           <tr>
		                           <th>公告标题</th>
		                           <th>发布单位</th>
		                           <th>发布时间</th>
		                           <th>操作</th>
	                           </tr>
	                           <c:if test="${listUploadedFiles!=''}">
	                           <c:forEach items="${listUploadedFiles}" var="list">
	                           
	                            <tr >
		                           <td>${list.fileName}</td>
		                           <td>${list.publishingUnit}</td>
		                           <td>${list.publishDate}</td>
		                           <td><button onclick="deletefile('${list.id}')">删除</button></td>
	                           </tr>
	                           
	                           </c:forEach>
                               </c:if>
                           </table>
        
        </div>
    </div>

<c:if test="${deleteOk!=null}">
<script type="text/javascript">
alert("恭喜你，该文件删除成功");
</script>
</c:if>


 <script type="text/javascript" src="<%=basePath%>selectcourse/js/jquery-1.8.1.js"></script>
    <script type="text/javascript">
            
        $(function()
        {
            $("#button").click(function()
            {
                var html = $("<input type='file' name='file'>");
                var button = $("<input type='button' name='button' value='删除'><br>");
                
                $("#body div").append(html).append(button);
                
                button.click(function()
                {
                    html.remove();
                    button.remove();
                });
            });
        });
        
        
        function deletefile(val){
        /* alert("val="+val); */
        var sure =confirm("确定要删除该文件");
        if(sure)
        window.location.href="<%=basePath%>fileupload_deleteFileById.action?choosefileId="+val;
        }
        
        
    
    </script>

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