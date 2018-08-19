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
	<title>修改课程</title>
    
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
        </div>
    </div> 
    <!-- end navbar -->


	<!-- main container -->
	 <c:if test="${updateOk!=null}">
	<script type="text/javascript">
	alert("修改成功");
	</script>
	
	</c:if> 
	
	
    <div class="content">
        
        <div class="container-fluid">
            <div id="pad-wrapper" class="form-page">
                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span8 column">
                        <form action="<%=basePath%>modifyCourse_modifyOldCourse.action" method="post">
                            <c:forEach items="${listcourse}" var="courses">
                              <h2>修改课程</h2>
                              <input style="display: none" name="courses.id"  value="${courses.id}">
                               <br> 
                            <div class="field-box">
                                <label>课程代码:</label>
                                <input class="span8 inline-input" name="courses.courseId" value="${courses.courseId}" type="text" />
                            </div>
                            <div class="field-box">
                                <label>课程名称:</label>
                                <input class="span8 inline-input" name="courses.courseName" value="${courses.courseName}" type="text" />
                            </div>                            
                            <div class="field-box">
                                <label>学分:</label>
                                <input class="span8 inline-input" name="courses.courseCredit" value="${courses.courseCredit}" type="text"   />
                            </div>
                            <div class="field-box">
                                <label>班级:</label>
                                <input class="span8 inline-input"  name="courses.courseClass" value="${courses.courseClass}"  type="text" />
                            </div> 
                            <div class="field-box">
                                <label>任课教师:</label>
                                    <input class="span8 inline-input" name="courses.courseTeacher" value="${courses.courseTeacher}" type="text" />
                            </div>
                            <div class="field-box">
                                <label>开课时间:</label>
                                <input class="span8 inline-input" name="courses.courseTime" value="${courses.courseTime}" type="text"  />
                            </div> 
                            <div class="field-box">
                                <label>上课地点:</label>
                                <input class="span8 inline-input" name="courses.coursePlace" value="${courses.coursePlace}" type="text"  />
                            </div> 
                            <div class="field-box">
                                <label>选课总人数:</label>
                                <input class="span8 inline-input" name="courses.courseCount" value="${courses.courseCount}" type="text" />
                            </div> 
                            <div class="field-box">
                                <label>备注:</label>
                                <input class="span8 inline-input" name="courses.courseRemark" value="${courses.courseRemark}" type="text"/>
                            </div>
                            <div class="field-box">
                                
                                <div class="wysi-column" >
                                	<button type="submit">提交</button> <button type="reset">重置</button> <button type="button" onclick="window.close()">关闭</button> 
                                </div>
                            </div>
                            </c:forEach>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end main container -->

	<!-- scripts for this page -->
    <script src="<%=basePath%>selectcourse/js/wysihtml5-0.3.0.js"> </script>
    <script src="<%=basePath%>selectcourse/js/jquery-latest.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap-wysihtml5-0.0.2.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap.datepicker.js"></script>
    <script src="<%=basePath%>selectcourse/js/jquery.uniform.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/select2.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/theme.js"></script>
</body>
</html>