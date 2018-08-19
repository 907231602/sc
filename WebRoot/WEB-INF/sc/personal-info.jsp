<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>个人信息 - My Info</title>
    
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
    <link rel="stylesheet" href="<%=basePath%>selectcourse/css/compiled/personal-info.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body onload="initial();">

    <!-- navbar -->
    <div class="navbar navbar-inverse">
        <div class="navbar-inner">
            <a class="brand" href="<%=basePath%>/index.jsp"><img src="<%=basePath%>selectcourse/img/logo.png" /></a>
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="active"><a href="<%=basePath%>home_getAllFile.action">首页</a></li>
                    <c:if test="${identity=='1'}">
                       <li><a href="<%=basePath%>enteringCourses_skipforwordjsp.action">课程录入</a></li>
                       <li><a href="<%=basePath%>selectAllcourse_publicCourse.action">选课管理</a></li>
                       <li> <a href="<%=basePath%>teacherAction_lookteacherInfo.action">个人信息</a> </li>
                    </c:if>
                    <c:if test="${identity=='2'}">
                    	 <li><a href="<%=basePath%>selectAllcourse_publicCourse.action">选课管理</a></li>
                         <li> <a href="<%=basePath%>studentInfo_lookMyselfInfo.action">个人信息</a> </li>
                    
                    </c:if>
                    <c:if test="${identity=='3'}">
                    <li><a href="<%=basePath%>manageStudentInfo_lookAllRegisteredStudent.action">用户管理</a></li>
                   		 <li><a href="<%=basePath%>enteringCourses_skipforwordjsp.action">课程录入</a></li>
                    		<li><a href="<%=basePath%>selectAllcourse_publicCourse.action">选课管理</a></li>
                    		<li> <a href="<%=basePath%>administratorAction_lookAdministratorInfo.action">个人信息</a> </li>
                   			<li> <a href="<%=basePath%>fileupload_findAllUploadedFile.action">上传</a> </li>
                    </c:if>
                    <li><a href="<%=basePath%>loginsc_quit.action">退出</a> </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- end navbar -->

<c:choose>
	<c:when test="${isOK=='OK'}">
	<script type="text/javascript">
	alert("恭喜你,密码修改成功");
	
	</script>
	</c:when>
	
	<c:when test="${isOK=='ERROR'}">
	<script type="text/javascript">
	alert("密码修改失败！请确认后操作");
	</script>
	</c:when>
</c:choose>



	<!-- main container .wide-content is used for this layout without sidebar :)  -->
    <div class="content wide-content">
        <div class="container-fluid">
            <div class="settings-wrapper" id="pad-wrapper">
                <!-- avatar column -->
                <div class="span3 avatar-box">
                   <%--  <div class="personal-image">
                        <img src="<%=basePath%>selectcourse/img/personal-info.png" class="avatar img-circle" />
                        <p>Upload a different photo...</p>
                        
                        <input type="file" />
                    </div> --%>
                    
                    
                </div>

                <!-- edit form column -->
                <div class="span7 personal-info">
                    <h5 class="personal-title">个人信息</h5>
                               
                <c:if test="${identity=='1'}">
                <form action="teacherAction_changeTeacherPasswd.action" onsubmit="return checkpass()" method="post">
					<c:forEach items="${teacherListinfo}" var="teacherlist">
                		 <div class="field-box">
                            <label>姓名:</label>
                            <input class="span5 inline-input" type="text" value="${teacherlist.teacherName}" readonly="readonly"/>
                        </div>
                        <div class="field-box">
                            <label>账号:</label>
                            <input class="span5 inline-input" type="text" value="${teacherlist.teacherId}" readonly="readonly"/>
                        </div>
                        <div class="field-box">
                            <label>学位:</label>
                            <input class="span5 inline-input" type="text" value="${teacherlist.teacherDegree}" readonly="readonly"/>
                        </div>
                        <div class="field-box">
                            <label>性别:</label>
                            <input class="span5 inline-input" type="text" value="${teacherlist.teacherSex}" readonly="readonly"/>
                        </div>
                        <div class="field-box">
                            <label>教授课程:</label>
                            <input class="span5 inline-input" type="text" value="${teacherlist.teachCourse}" readonly="readonly"/>
                        </div>
                         <div class="field-box">
                            <label>电话:</label>
                            <input class="span5 inline-input" type="text" value="${teacherlist.teacherPhone}" readonly="readonly"/>
                        </div>
                         <div class="field-box">
                            <label>新密码:</label>
                            <input class="span5 inline-input" type="password" id="passwd1" value="" />
                        </div>
                         <div class="field-box">
                            <label>确认密码:</label>
                            <input class="span5 inline-input" name="password" type="password" id="passwd2" value="" />
                        </div>
                		 <div class="span6 field-box actions">
                            <input type="submit"   class="btn-glow primary" value="保存修改"  />
                            
                            <!--<input type="reset" value="重置" class="reset" />-->
                            <input type="reset" value="重置" class="btn-glow primary" />
                        </div>
					 </c:forEach>
                </form>
                
                </c:if>  
                <c:if test="${identity=='2'}">
                 <form action="studentInfo_changeMyPasswd.action" onsubmit="return checkpass()" method="post">  
                    
                    <c:forEach items="${personInfo}" var="person">
                        <div class="field-box">
                            <label>姓名:</label>
                            <input class="span5 inline-input" type="text" value="${person.studentName}" readonly="readonly"/>
                        </div>
                        <div class="field-box">
                            <label>学号:</label>
                            <input class="span5 inline-input" type="text" value="${person.studentId}" readonly="readonly"/>
                        </div>
                        <div class="field-box">
                            <label>学院及专业:</label>
                            <input class="span5 inline-input" type="text" value="${person.academy},${person.majoyClass}" readonly="readonly"/>
                        </div>
                        <div class="field-box">
                            <label>邮箱:</label>
                            <input class="span5 inline-input" type="text" value="${person.email}" readonly="readonly"/>
                        </div>
                        <div class="field-box">
                            <label>性别:</label>
                               <input class="span5 inline-input" type="text" value="${person.studentSex}" readonly="readonly"/>
                        </div>
                        <div class="field-box">
                            <label>学号:</label>
                            <input class="span5 inline-input" type="text" value="${person.studentId}"  readonly="readonly"/>
                        </div>
                        <div class="field-box">
                            <label>修改密码:</label>
                            <input class="span5 inline-input"  type="password" id="passwd1" value="" />
                        </div>
                        <div class="field-box">
                            <label>确认密码:</label>
                            <input class="span5 inline-input" name="students.password" type="password" id="passwd2" value="" />
                        </div>
                        <div class="span6 field-box actions">
                            <input type="submit"   class="btn-glow primary" value="保存修改"  />
                            
                            <!--<input type="reset" value="重置" class="reset" />-->
                            <input type="reset" value="重置" class="btn-glow primary" />
                        </div>
                        </c:forEach>
                   </form>  
                </c:if> 
                <c:if test="${identity=='3'}">
                <form action="administratorAction_changeAdminPasswd.action" onsubmit="return checkpass()" method="post">
                  <c:forEach items="${listadmin}" var="admin">
                		 <div class="field-box">
                            <label>姓名:</label>
                            <input class="span5 inline-input" type="text" value="${admin.manageName}" readonly="readonly"/>
                        </div>
                        <div class="field-box">
                            <label>帐号:</label>
                            <input class="span5 inline-input" type="text" value="${admin.manageId}" readonly="readonly"/>
                        </div>
                        <div class="field-box">
                            <label>性别:</label>
                            <input class="span5 inline-input" type="text" value="${admin.manageSex}" readonly="readonly"/>
                        </div>
                        <div class="field-box">
                            <label>新密码:</label>
                            <input class="span5 inline-input" type="password" id="passwd1" value="" />
                        </div>
                       <div class="field-box">
                            <label>确认密码:</label>
                            <input class="span5 inline-input" name="password" type="password" id="passwd2" value="" />
                        </div>
                         <div class="span6 field-box actions">
                            <input type="submit"   class="btn-glow primary" value="保存修改"  />
                            <input type="reset" value="重置" class="btn-glow primary" />
                        </div>
                        </c:forEach>
                      </form>
                   </c:if>            
                   
                </div>
            </div>
        </div>
    </div>
    <!-- end main container -->

	<!-- scripts -->
	<script type="text/javascript">
	function checkpass(){
		
		var ps1=document.getElementById("passwd1").value ;
		if(ps1==""){alert("请输入要修改的密码"); return false;}
		var ps2=document.getElementById("passwd2").value ;
		if(ps2==""){alert("请输入确认密码"); return false;}
		if(ps1!=ps2){
			alert("您两次输入的账号密码不一致,请重新输入！");
			return false;
		}
		else{
			return true;
		};
		
	};
	

	
	
	</script>
    <script src="<%=basePath%>selectcourse/js/jquery-latest.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/theme.js"></script>

</body>
</html>