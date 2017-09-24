<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title></title>
        <style type="text/css">
        	*{margin: 0;padding: 0;}
        	html,body{width: 100%;height: 100%;}
        	input{width: 260px;height: 26px;outline: none;border: 1px solid #666;margin-top: 10px;text-indent: 20px;}
        	.center{position: absolute;top: 0;left: 0;bottom: 0;right: 0;margin: auto;}
        	.title{width: 100%;height: 60px;background: rgba(0, 0, 0, .8);color: #fff;line-height: 60px;text-align: center;font-size: 30px;}
        	.content{width: 100%;overflow: hidden;height: 400px;padding: 40px 0;position: relative;
        	background: url(img/2.png) no-repeat;background-size: cover;}
        	#center{width: 1082px;height: 400px;}
        	.show{width: 642px;height: 400px;float: left;position: relative;}
        	#scan{position: absolute;width: 100%;height: 100%;
        	background: url(img/scan.png);background-size: cover;z-index: 1;display: none;}
        	.message{float: left;margin-left: 40px;width: 400px;height: 400px;}
        	.input span{display: inline-block;width: 100px;height: 28px;line-height: 28px;color: #fff;}
        	.btn{width: 150px;height: 40px;background: red;border: none;border-radius: 14px;
        		font-size: 16px;color: #fff;cursor: pointer;margin: 20px 0 0 150px;}
        	.name{margin-top: 50px;}
        	#uploadfile{display: none;}
        	#footer{width: 100%;height: 332px;background: url(img/banner.png)no-repeat center;background-size: cover;}
			#footer .text{width: 1200px;height: 332px;margin: 0 auto;}
			#footer .text h1{font-weight: 100;padding: 100px 0 10px 100px;}
			#footer .text p{padding-left: 100px;line-height: 31px;color: #666;}
        </style>
</head>
<body>
	<div class="title">Java开发身份信息自动录入系统</div>
	<div class="content">
		<div class="center" id="center">
			<div class="show" id="show">
				<div id="scan"></div>
				<img id="img" class="center" src="img/1.png" width="642" height="400" />
			</div>
			
			<input type="file" name="uploadfile" id="uploadfile" />
			<div class="message">
				<form action="add" method="post">
					<div class="name input"><span>姓名:</span><input name="name" type="text" /></div>
					<div class="gender input"><span>性别:</span><input name="gender" type="text" /></div>
					<div class="nation input"><span>民族:</span><input name="nation" type="text" /></div>
					<div class="date input"><span>出生日期:</span><input name="date" type="text" /></div>
					<div class="address input"><span>住址:</span><input name="address" type="text" /></div>
					<div class="number input"><span>身份证号码:</span><input name="id" type="text" /></div>
					<input class="btn" type="submit" />
				</form>
			</div>
		</div>
	</div>
	<!-- footer start -->
	<div id="footer">
		<div class="text">
			<h1>身份证识别</h1>
			<p>基于业界领先的深度学习技术<br />
			为用户提供二代身份证正反面识别服务
			</p>
		</div>
	</div> 
	<!-- footer end -->
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
		//实现文件拖拽上传
		//实现拖拽区域
		var obj=document.getElementById('show');//通过id名称来获取元素,show为身份证那个区域的名字
		obj.ondragover=function(e){e.preventDefault();console.log("1")}
		obj.ondraleave=function(e){console.log("2")}
		//在拖拽区域放置文件的时候要执行的方法
		obj.ondrop=function(e){
			e.preventDefault();//拖拽的时候阻止浏览器默认打开文件
			//alert("你放了什么东西");//提示
			//获取拖拽过来的图片上传到服务器
			var formDate=new formData();
			formDate.append("file",e.dataTransfer.files[0]);
			//ajax异步上传
			$.ajax({
				//要把图片上传到什么地方
				url:"fileUpload",
				//利用什么方式上传
				type:"post",
				cache: false,//不需要缓存
				//上传什么东西
				data:formDate,
				processData: false,//表示不需要对数据进行处理
				contentType:false,//不需要声明文件类型
				//上传完毕后返回结果
				success:function(date){
				
				}
				
			});
		}
		
		
		
        function scan(){
			var box = $("#show");
			$("#scan").css({"display":"block","bottom":box.height()})
			.animate({bottom:0},2000,function(){$(this).css({"display":"none","bottom":box.height()})});
		}
	</script>
</body>
</html>