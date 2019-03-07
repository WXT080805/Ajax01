<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function show1(){
			alert("点击了按钮");
			$.ajax({
				type : "post",
				cache : false,
				url:"<c:url value="/sys/getAllUser" />",
				dataType:"json",
				scriptCharset:"UTF-8",
				success : function(data){
					if(data!=null){
						alert("进入了ajax的方法体");
						
						$.each(data, function(index, item){
							$("#table1").append("<tr id=tr"+(index+1)+"></tr>");
							$("#tr"+(index+1)+"").append("<td>"+item.id+"</td>");
							$("#tr"+(index+1)+"").append("<td>"+item.name+"</td>");
							$("#tr"+(index+1)+"").append("<td>"+item.pwd+"</td>");
							$("#tr"+(index+1)+"").append("<td>"+item.create_time+"</td>");
							});
						/* $("#tr1").html('<td>你好的</td>'); */
					}
				},
				error:function(data){
					alert("ajax返回数据失败！");
					$("#tr1").html('<td>你好的</td>');
				}
			});
		}
	</script>
	<a href='<c:url value="/sys/getAllUser"></c:url>'>获取全部用户信息</a>
	<input type="button" value="获取全部用户信息" onclick="show1()">
	<div id="div1">
		<table border="" id="table1">
    	<tr>
    		<td>用户ID</td>
			<td>姓名</td>
			<td>密码</td>
			<td>创建时间</td>
    	</tr>
   		<tr id="tr1">
			<%-- <td><fmt:formatDate value="${user.create_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
   		</tr>
    	
    </table>
	</div>
</body>
</html>