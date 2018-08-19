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
	<title>登录- Sign in</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
    <!-- bootstrap -->
    <link href="<%=basePath%>WEB-INF/sc/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="<%=basePath%>WEB-INF/sc/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="<%=basePath%>WEB-INF/sc/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>WEB-INF/sc/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>WEB-INF/sc/css/elements.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>WEB-INF/sc/css/icons.css" />

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>WEB-INF/sc/css/lib/font-awesome.css" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="<%=basePath%>WEB-INF/sc/css/compiled/signin.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>


    <!-- background switcher -->
    <div class="bg-switch visible-desktop">
        <div class="bgs">
            <a href="#" data-img="landscape.jpg" class="bg active">
                <img src="<%=basePath%>WEB-INF/sc/img/bgs/landscape.jpg" />
            </a>
            <a href="#" data-img="blueish.jpg" class="bg">
                <img src="<%=basePath%>WEB-INF/sc/img/bgs/blueish.jpg" />
            </a>            
            <a href="#" data-img="7.jpg" class="bg">
                <img src="<%=basePath%>WEB-INF/sc/img/bgs/7.jpg" />
            </a>
            <a href="#" data-img="8.jpg" class="bg">
                <img src="<%=basePath%>WEB-INF/sc/img/bgs/8.jpg" />
            </a>
            <a href="#" data-img="9.jpg" class="bg">
                <img src="<%=basePath%>WEB-INF/sc/img/bgs/9.jpg" />
            </a>
            <a href="#" data-img="10.jpg" class="bg">
                <img src="<%=basePath%>WEB-INF/sc/img/bgs/10.jpg" />
            </a>
            <a href="#" data-img="11.jpg" class="bg">
                <img src="<%=basePath%>WEB-INF/sc/img/bgs/11.jpg" />
            </a>
        </div>
    </div>


    <div class="row-fluid login-wrapper">
     
       <img class="logo" src="<%=basePath%>WEB-INF/sc/img/logo.png" />
      
      <c:if test="${ERRORINFO=='ERROR' }">
     <script type="text/javascript">
     alert("你输入的账户不存在或者密码错误！");
     </script>
      
      </c:if>

        <div class="span4 box">
        <form action="<%=basePath%>loginsc_studentdenglu.action" onsubmit="return checkDenglu()" method="post">
            <div class="content-wrap">
                <h6>登陆</h6>
                <input class="span12" type="text" id="studentId" name="students.studentId" placeholder="学号" />
                <input class="span12" type="password" id="password" name="students.password" placeholder="密码" />
                <!--  <input class="span5" style="" type="password" name="students.password"  placeholder="密码" /> -->
              <input class="span9" type="text" name="yanzhengCode" maxlength=4 placeholder="验证码">  <img border=0 src="<%=basePath%>selectcourse/image.jsp" onclick="this.src=this.src+'?'">    
               <!--  <a href="#" class="forgot">忘记密码?</a> -->
                <div class="remember">
                    <input type="checkbox" name="cbox" value="cbox1" onClick="chooseOne(this);" />
                    <label for="remember-me">教师</label>
                    <input type="checkbox" name="cbox" value="cbox1" onClick="chooseOne(this);" checked="checked" />
                    <label for="remember-me">学生</label>
                    <input type="checkbox" name="cbox" value="cbox1" onClick="chooseOne(this);" />
                    <label for="remember-me">管理员</label>
                </div>
                <input type="submit" class="btn-glow primary login" value="登陆"/> 
               
                <a class="btn-glow primary login" href="<%=basePath%>selectcourse/signup.jsp">注册</a> 
            </div>
            </form>
        </div>

        <div class="span4 no-account">
            <p>没有账号?</p>
            <a href="<%=basePath%>selectcourse/signup.jsp">注册</a>
        </div>
    </div>

	<!-- scripts -->
    <script src="<%=basePath%>WEB-INF/sc/js/jquery-latest.js"></script>
    <script src="<%=basePath%>WEB-INF/sc/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>WEB-INF/sc/js/theme.js"></script>

    <!-- pre load bg imgs -->
    <script type="text/javascript">
        $(function () {
            // bg switcher
            var $btns = $(".bg-switch .bg");
            $btns.click(function (e) {
                e.preventDefault();
                $btns.removeClass("active");
                $(this).addClass("active");
                var bg = $(this).data("img");

                $("html").css("background-image", "url('img/bgs/" + bg + "')");
            });

        });
        
        
        function checkDenglu(){
        	var studentId=$("#studentId").val();
        	if(studentId==""){alert("学号不能为空，请输入学号"); return false;}
        	var password=$("#password").val();
        	if(password==""){alert("密码不能为空,请输入密码"); return false;}
        	return true;
        }
        
        
       
        function chooseOne(cb){  
            var obj = document.getElementsByName("cbox");  
            for(var i=0; i<obj.length; i++){  
                if (obj[i]!=cb) obj[i].checked = false;  
                else obj[i].checked = true;  
            }  
        }  
    </script>  
        
</body>
</html>