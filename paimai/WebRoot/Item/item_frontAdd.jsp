<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.shuangyulin.po.ItemClass" %>
<%@ page import="com.shuangyulin.po.UserInfo" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>商品添加</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-12 wow fadeInLeft">
		<ul class="breadcrumb">
  			<li><a href="<%=basePath %>index.jsp">首页</a></li>
  			<li><a href="<%=basePath %>Item/frontlist">商品管理</a></li>
  			<li class="active">添加商品</li>
		</ul>
		<div class="row">
			<div class="col-md-10">
		      	<form class="form-horizontal" name="itemAddForm" id="itemAddForm" enctype="multipart/form-data" method="post"  class="mar_t15">
				  <div class="form-group">
				  	 <label for="item_itemClassObj_classId" class="col-md-2 text-right">商品分类:</label>
				  	 <div class="col-md-8">
					    <select id="item_itemClassObj_classId" name="item.itemClassObj.classId" class="form-control">
					    </select>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="item_pTitle" class="col-md-2 text-right">商品标题:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="item_pTitle" name="item.pTitle" class="form-control" placeholder="请输入商品标题">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="item_itemPhoto" class="col-md-2 text-right">商品图片:</label>
				  	 <div class="col-md-8">
					    <img  class="img-responsive" id="item_itemPhotoImg" border="0px"/><br/>
					    <input type="hidden" id="item_itemPhoto" name="item.itemPhoto"/>
					    <input id="itemPhotoFile" name="itemPhotoFile" type="file" size="50" />
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="item_itemDesc" class="col-md-2 text-right">商品描述:</label>
				  	 <div class="col-md-8">
							    <textarea name="item.itemDesc" id="item_itemDesc" style="width:100%;height:500px;"></textarea>
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="item_userObj_user_name" class="col-md-2 text-right">发布人:</label>
				  	 <div class="col-md-8">
					    <select id="item_userObj_user_name" name="item.userObj.user_name" class="form-control">
					    </select>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="item_startPrice" class="col-md-2 text-right">起拍价:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="item_startPrice" name="item.startPrice" class="form-control" placeholder="请输入起拍价">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="item_startTimeDiv" class="col-md-2 text-right">起拍时间:</label>
				  	 <div class="col-md-8">
		                <div id="item_startTimeDiv" class="input-group date item_startTime col-md-12" data-link-field="item_startTime">
		                    <input class="form-control" id="item_startTime" name="item.startTime" size="16" type="text" value="" placeholder="请选择起拍时间" readonly>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                </div>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="item_endTimeDiv" class="col-md-2 text-right">结束时间:</label>
				  	 <div class="col-md-8">
		                <div id="item_endTimeDiv" class="input-group date item_endTime col-md-12" data-link-field="item_endTime">
		                    <input class="form-control" id="item_endTime" name="item.endTime" size="16" type="text" value="" placeholder="请选择结束时间" readonly>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                </div>
				  	 </div>
				  </div>
		          <div class="form-group">
		             <span class="col-md-2""></span>
		             <span onclick="ajaxItemAdd();" class="btn btn-primary bottom5 top5">添加</span>
		          </div> 
		          <style>#itemAddForm .form-group {margin:5px;}  </style>  
				</form> 
			</div>
			<div class="col-md-2"></div> 
	    </div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
<script>
//实例化编辑器
var item_itemDesc_editor = UE.getEditor('item_itemDesc'); //商品描述编辑器
var basePath = "<%=basePath%>";
	//提交添加商品信息
	function ajaxItemAdd() { 
		//提交之前先验证表单
		$("#itemAddForm").data('bootstrapValidator').validate();
		if(!$("#itemAddForm").data('bootstrapValidator').isValid()){
			return;
		}
		if(item_itemDesc_editor.getContent() == "") {
			alert('商品描述不能为空');
			return;
		}
		jQuery.ajax({
			type : "post",
			url : basePath + "Item/add",
			dataType : "json" , 
			data: new FormData($("#itemAddForm")[0]),
			success : function(obj) {
				if(obj.success){ 
					alert("保存成功！");
					$("#itemAddForm").find("input").val("");
					$("#itemAddForm").find("textarea").val("");
					item_itemDesc_editor.setContent("");
				} else {
					alert(obj.message);
				}
			},
			processData: false, 
			contentType: false, 
		});
	} 
$(function(){
	/*小屏幕导航点击关闭菜单*/
    $('.navbar-collapse a').click(function(){
        $('.navbar-collapse').collapse('hide');
    });
    new WOW().init();
	//验证商品添加表单字段
	$('#itemAddForm').bootstrapValidator({
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			"item.pTitle": {
				validators: {
					notEmpty: {
						message: "商品标题不能为空",
					}
				}
			},
			"item.startPrice": {
				validators: {
					notEmpty: {
						message: "起拍价不能为空",
					},
					numeric: {
						message: "起拍价不正确"
					}
				}
			},
			"item.startTime": {
				validators: {
					notEmpty: {
						message: "起拍时间不能为空",
					}
				}
			},
			"item.endTime": {
				validators: {
					notEmpty: {
						message: "结束时间不能为空",
					}
				}
			},
		}
	}); 
	//初始化商品分类下拉框值 
	$.ajax({
		url: basePath + "ItemClass/listAll",
		type: "get",
		success: function(itemClasss,response,status) { 
			$("#item_itemClassObj_classId").empty();
			var html="";
    		$(itemClasss).each(function(i,itemClass){
    			html += "<option value='" + itemClass.classId + "'>" + itemClass.className + "</option>";
    		});
    		$("#item_itemClassObj_classId").html(html);
    	}
	});
	//初始化发布人下拉框值 
	$.ajax({
		url: basePath + "UserInfo/listAll",
		type: "get",
		success: function(userInfos,response,status) { 
			$("#item_userObj_user_name").empty();
			var html="";
    		$(userInfos).each(function(i,userInfo){
    			html += "<option value='" + userInfo.user_name + "'>" + userInfo.name + "</option>";
    		});
    		$("#item_userObj_user_name").html(html);
    	}
	});
	//结束时间组件
	$('#item_endTimeDiv').datetimepicker({
		language:  'zh-CN',  //显示语言
		format: 'yyyy-mm-dd hh:ii:ss',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		minuteStep: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0
	}).on('hide',function(e) {
		//下面这行代码解决日期组件改变日期后不验证的问题
		$('#itemAddForm').data('bootstrapValidator').updateStatus('item.endTime', 'NOT_VALIDATED',null).validateField('item.endTime');
	});
	//起拍时间组件
	$('#item_startTimeDiv').datetimepicker({
		language:  'zh-CN',  //显示语言
		format: 'yyyy-mm-dd hh:ii:ss',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		minuteStep: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0
	}).on('hide',function(e) {
		//下面这行代码解决日期组件改变日期后不验证的问题
		$('#itemAddForm').data('bootstrapValidator').updateStatus('item.startTime', 'NOT_VALIDATED',null).validateField('item.startTime');
	});
})
</script>
</body>
</html>
