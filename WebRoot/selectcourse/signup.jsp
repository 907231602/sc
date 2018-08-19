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
<html class="login-bg">
<head>
	<title>注册 - Sign up</title>
    
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
    <link rel="stylesheet" href="<%=basePath%>selectcourse/css/compiled/signup.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body onload="loadOK()">
    <div class="header">
            <img src="<%=basePath%>selectcourse/img/logo.png" class="logo" />
    </div>
    
    <c:if test="${ERRORINFO=='REGISTERED'}">
    <script type="text/javascript">
    alert("对不起，该学号已被注册");
    </script>
    </c:if>
    
    <div class="row-fluid login-wrapper">
        <div class="box">
        <form action="<%=basePath%>rigister_zhuce.action" onsubmit="return checkform()" method="post">
            <div class="content-wrap">
                <h6>注册</h6>
                 <input class="span12" type="text" id="studentName" name="students.studentName" placeholder="姓名" />
                <input class="span12" type="text" id="studentId" name="students.studentId" placeholder="学号" />
                <input class="span12" type="password" id="password" name="students.password" placeholder="密码" />
                <select onchange="changword()" class="span12" name="students.academy" id="academy"></select>
               <!--  <input class="span12" type="text" id="academy" name="students.academy" placeholder="学院" /> -->
                <br/>
                <select class="span12" id="majoyClass" name="students.majoyClass" >
                		<option value="">专业班级</option></select>
                <!-- <input class="span12" type="text" id="majoyClass" name="students.majoyClass" placeholder="专业班级" /> -->
              <br>
               <select class="span12"  id="studentSex" name="students.studentSex">
               		<option value="男">男</option>
               		<option value="女">女</option>
               </select>
               <!-- <input class="span12" type="text" id="studentSex" name="students.studentSex" placeholder="性别" /> -->
                 <input class="span12" type="text" id="email" name="students.email" placeholder="邮箱" /> 
                 <input class="span12" type="text" id="phone" name="students.phone" placeholder="电话" /> 
               
                <div  class="action">
                <input type="submit" class="btn-glow primary signup" value="注册">
                <input type="reset" class="btn-glow primary signup" value="重置">
                </div>                
            </div>
            </form>
        </div>

        <div class="span4 already">
            <p>已拥有账号?</p>
            <a href="<%=basePath%>selectcourse/signin.jsp">登陆</a>
        </div>
    </div>

	<!-- scripts -->
    <script src="<%=basePath%>selectcourse/js/jquery-latest.js"></script>
    <script src="<%=basePath%>selectcourse/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>selectcourse/js/theme.js"></script>
    
<script type="text/javascript">
function checkform(){
	var studentName=$("#studentName").val();
	if(studentName==""){alert("请输入姓名"); return false;}
	var studentId=$("#studentId").val();
	if(studentId==""){alert("请输入学号"); return false;}
	var password=$("#password").val();
	if(password==""){alert("请输入密码"); return false;}
	var academy=$("#academy").val();
	if(academy==""){alert("请输入学院"); return false;}
	var majoyClass=$("#majoyClass").val();
	if(majoyClass==""){alert("请输入专业班级"); return false;}
	var studentSex=$("#studentSex").val(); 
	if(studentSex==""){alert("请输入性别"); return false;}
	var email=$("#email").val();  
	if(email==""){alert("请输入邮箱"); return false;}
	return true;
}

function loadOK(){
	$.ajax({
		   	type: "POST",		
		   	url: "<%=basePath%>rigister_getAllCollege.action",									    
     		dataType:"json",
		    success: function(msg){
		    var str = "<option>请选择学院</option>";  
		      $("#academy").html("");  
		         for ( var i = 0; i < msg.length; i++) {  
		       str += "<option  value='" + msg[i].college
		       + "'>" + msg[i].college  
		       + "</option>";  
		     }  
		     $("#academy").append(str);  
				   },
				   error: function(msg){
									alert("error"+msg);
					}
				});
	 
    }

		function changword(){
			var vaule=$("#academy").find("option:selected").val();
			$.ajax({
			   	type: "POST",		
			   	url: "<%=basePath%>rigister_getMajoyClassByCollege.action",	
			   	data: {
			   		"selectAcademy":vaule
			   	},
	     		dataType:"json",
			    success: function(msg){
			    var str = "<option>请选择专业班级</option>";  
			      $("#majoyClass").html("");  
			         for ( var i = 0; i < msg.length; i++) {  
			      			 str += "<option  value='" + msg[i].majorClass
			      				 + "'>" + msg[i].majorClass  
			      			 + "</option>";  
			    			 }  
			     		$("#majoyClass").append(str);  
					   },
					   error: function(msg){
									//	alert("error"+msg);
						}
					});
		 
		}
</script>

</body>
</html>