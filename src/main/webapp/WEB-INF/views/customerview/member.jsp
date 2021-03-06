<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	<title>Echo 会员</title>
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/img/hotelicon.png">
    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/css/animate.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath }/css/light-bootstrap-dashboard.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet"/>
</head>
<body> 

<div class="wrapper">

	<!-- 侧边栏 -->
    <div class="sidebar" data-color="azure" data-image="${pageContext.request.contextPath }/img/signup-bg1.jpg">    
    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="${pageContext.request.contextPath }/all" class="simple-text">
                    Echo Hotel
                </a>
            </div>
                       
            <ul class="nav">
                <li>
                    <a href="${pageContext.request.contextPath }/customer/info" target="_blank">
                        <i class="fa fa-user"></i>
                        <p>账号与密码</p>
                    </a>            
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/all" target="_blank">
                        <i class="fa fa-search"></i>
                        <p>酒店查询</p>
                    </a>
                </li> 
                <li>
                     <a href="${pageContext.request.contextPath }/customer/goViewOrders" target="_blank">
                    	<i class="fa fa-list-ul"></i>
                        <p>订单一览</p>
                    </a>        
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/goViewEvaluations" target="_blank">
                        <i class="fa fa-comments"></i>
                        <p>我的评论</p>
                    </a>        
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath }/customer/goMemberHandle" target="_blank">
                         <i class="fa fa-check"></i>
                        <p>Echo会员</p>
                    </a>        
                </li>
            </ul> 
    	</div>
    </div>
    <!-- 侧边栏END -->
    
    
    <div class="main-panel">
   		<!-- 导航条 -->
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">    
                 
                <div class="collapse navbar-collapse">       
                    <ul class="nav navbar-nav navbar-left">
                   		<li><a href=""><span style="font-size: 14px;color: #666666;">主页</span></a></li> 	
                        <li><a href=""><span style="font-size: 14px;color: #666666;">热门推荐</span></a></li> 
                        <li><a href=""><span style="font-size: 14px;color: #666666;">度假主题</span></a></li> 
                    </ul>
                    
                     <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                              	<span style="font-size: 14px;color: #666666;"> ${sessionScope.authCustomer.nickname}</span> <b class="caret"></b> </a>
                              <ul class="dropdown-menu">
                                <li><a href="#"><i class="fa fa-home"></i>我的主页</a></li>
                                <li><a href="#"><i class="fa fa-cog"></i>设置</a></li>
                                <li><a href="#"><i class="fa fa-building"></i>酒店查询</a></li>
                                <li><a href="#"><i class="fa fa-th-list"></i>订单查询</a></li>
                                <li class="divider"></li>
                                <li><a href="${pageContext.request.contextPath }/customer/signout"><i class="fa fa-sign-out"></i>退出</a>
                              </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- 导航条END -->             

        <div class="content">
            <div class="container-fluid">
            
            
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Echo会员</h4>
                            </div>
                            <div class="content">
                            <div style="padding-bottom: 20px;">
                            		尊敬的<span style="color: orange;">${sessionScope.authCustomer.nickname }</span>客户，
                            		<c:if test="${requestScope.beMember == null }">
                            		您的信用值为<span style="color: orange;">${sessionScope.authCustomer.credit }</span>，
                            		为<span style="color: red;font-weight: bold;">
										<c:choose>
										<c:when test="${sessionScope.authCustomer.grade == 1}">1级会员</c:when>
										<c:when test="${sessionScope.authCustomer.grade == 2}">2级会员</c:when>
										<c:when test="${sessionScope.authCustomer.grade == 3}">3级会员</c:when>
										<c:when test="${sessionScope.authCustomer.grade == 4}">4级会员</c:when>
										<c:when test="${sessionScope.authCustomer.grade == 5}">5级会员</c:when>
										</c:choose>
									</span>。 
                            		</c:if>
                            		
                            </div>
                            <table class="table">
				                    <tr>
				                   		<th class="text-left col-md-2">会员等级：</th>
				                   		<c:forEach items="${memberDiscounts}" var="md" >
				                        	<th class="text-left col-md-2">${md.levelName}</th>
				                        </c:forEach>
				                    </tr>
				                    <tr>
				                        <th class="text-left col-md-2">所需信用值：</th>
				                        <c:forEach items="${memberDiscounts}" var="md" >
				                        	<td class="text-left col-md-2">${md.creditLimit}</td>
				                        </c:forEach>
				                    </tr>
				                    <tr>
				                        <th class="text-left col-md-2">折扣：</th>
				                        <c:forEach items="${memberDiscounts}" var="md" >
				                        	<td class="text-left col-md-2">${md.discount}</td>
				                        </c:forEach>
				                    </tr>
				              </table>
                            </div>
                        </div>
                    </div>
                 </div>
                 <!-- 
                   <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Echo VIP会员</h4>
                                <p class="category">立刻注册成为VIP会员，享受特定商圈专属折扣。</p>
                                <a href="${pageContext.request.contextPath }/customer/beVIPMember" style="margin-top: -50px;float: right;" title="查看酒店信息" class="btn btn-warning btn-fill">
				                                <i class="fa fa-cny"></i>成为VIP会员
				                </a>
                            </div>
                            <div class="content">
	                            <table class="table">
					                     <tr>
					                   		<th class="text-left col-md-2">会员等级：</th>
					                        <th class="text-left col-md-2">V1级会员</th>
					                        <th class="text-left col-md-2">V2级会员</th>
					                        <th class="text-left col-md-2">V3级会员</th>
					                        <th class="text-left col-md-2">V4级会员</th>
					                        <th class="text-left col-md-2">V5级会员</th>
					                    </tr>
					                    <tr>
					                        <th class="text-left col-md-2">普通折扣：</th>
					                        <td class="text-left col-md-2">100%</td>
					                        <td class="text-left col-md-2">95%</td>
					                        <td class="text-left col-md-2">93%</td>
					                        <td class="text-left col-md-2">90%</td>
					                        <td class="text-left col-md-2">85%</td>
					                    </tr>
					                    <tr style="color: red;">
					                        <th class="text-left col-md-2">VIP折扣：</th>
					                        <td class="text-left col-md-2">95%</td>
					                        <td class="text-left col-md-2">93%</td>
					                        <td class="text-left col-md-2">90%</td>
					                        <td class="text-left col-md-2">85%</td>
					                        <td class="text-left col-md-2">80%</td>
					                    </tr>
					              </table>
                            </div>
                        </div>
                    </div>
                 </div>
                 
                  -->
                 
                 <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="content">
      							           <div style="padding-bottom: 20px;">当前享受VIP优惠的特定商圈包含：</div>
					              <table class="table">
				                     <tr>
				                   		<td class="text-left col-md-2">城市</td>
				                        <td class="text-left col-md-2">商圈</td>
				                    </tr>
				                    <c:forEach items="${allDistrictDiscounts }" var="dd">
				                     <tr>
				                        <td class="text-left col-md-2"><a href="${pageContext.request.contextPath }/getHotels/city/${dd.key }">${dd.key }</a></td>
				                        <td class="text-left col-md-10">
				                        	<c:forEach items="${dd.value }" var="district">
				                        		<a href="${pageContext.request.contextPath }/getHotels/district/${district }">${district }</a>&nbsp;&nbsp;&nbsp;
				                        	</c:forEach>
				                    	    
				                        </td>
				                    </tr>
				                    </c:forEach>
				              </table>
                            </div>
                        </div>
                    </div>
                 </div>
                 
                 <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="content">
                          	 您可进行<a href="">企业会员登记</a>，以享受企业会员优惠。<hr>
                          	 <form class="form-inline" action="${pageContext.request.contextPath }/customer/coomember" method="POST">
									  <div class="form-group">
									    <input type="text" class="form-control" id="cooName" name="cooName" placeholder="企业名称">
									  </div>
									  <button type="submit" class="btn btn-info btn-fill">提交</button>
								 </form>
                            </div>
                        </div>
                    </div>
                 </div>
                 
               
          </div>      

       </div>
   </div>
     
 	<!-- 条款弹出框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h5 class="modal-title" id="myModalLabel"><i class="fa fa-bars"></i>&nbsp;&nbsp;订单详细信息</h5>
	      </div>
	      <div class="modal-body ">
			<div class="card card-plain card-nav-tabs">
				<div class="content">
					<div class="tab-content text-center">
						<form>
                           <table>
	                                 <div class="row">
	                                      <div class="col-md-2"> <span style="line-height:35px">订单ID：</span> </div>
	                                      <div class="col-md-4"> <input type="text" class="form-control" placeholder="订单ID" disabled value="0015213101"> </div>
	                                      <div class="col-md-2"> <span style="line-height:35px">订单类型：</span> </div>
	                                      <div class="col-md-4"> <input type="text" class="form-control" placeholder="订单类型" disabled value="已执行订单">  </div>
	                                      <div class="col-md-2"> <span style="line-height:35px">酒店名称：</span> </div>
	                                      <div class="col-md-4">  <input type="text" class="form-control" placeholder="酒店名称" disabled value="南京金陵饭店"> </div>
	                                      <div class="col-md-2"> <span style="line-height:35px">下单时间：</span> </div>
	                                      <div class="col-md-4">  <input type="text" class="form-control" placeholder="下单时间" disabled value="2016-10-01 13:13:13"> </div>
	                                      <div class="col-md-2"> <span style="line-height:35px">入住时间：</span> </div>
	                                      <div class="col-md-4">  <input type="text" class="form-control" placeholder="入住时间" disabled value="2016-10-04 14:13:13"> </div>
	                                      <div class="col-md-2"> <span style="line-height:35px">退房时间：</span> </div>
	                                      <div class="col-md-4">  <input type="text" class="form-control" placeholder="退房时间" disabled value="2016-10-06 14:13:13"> </div>
	                                      <div class="col-md-2"> <span style="line-height:35px">最晚执行：</span> </div>
	                                      <div class="col-md-4">  <input type="text" class="form-control" placeholder="最晚执行" disabled value="2016-10-05 13:13:13"> </div>
	                                      <div class="col-md-2"> <span style="line-height:35px">房间类型：</span> </div>
	                                      <div class="col-md-4">  <input type="text" class="form-control" placeholder="房间类型" disabled value="豪华客房"> </div>
	                                      <div class="col-md-2"> <span style="line-height:35px">房间数量：</span> </div>
	                                      <div class="col-md-4">  <input type="text" class="form-control" placeholder="房间数量" disabled value="1"> </div>
	                                      <div class="col-md-2"> <span style="line-height:35px">入住人数：</span> </div>
	                                      <div class="col-md-4">  <input type="text" class="form-control" placeholder="入住人数" disabled value="2"> </div>
	                                      <div class="col-md-2"> <span style="line-height:35px">有无儿童：</span> </div>
	                                      <div class="col-md-4">  <input type="text" class="form-control" placeholder="有无儿童" disabled value="无"> </div>
	                                </div>      
                          	 </table>
                         </form>
						</div>
					 
					</div>
				</div>
			</div>
        </div>
	    
	    </div>
	  </div>
	</div>
	<!-- 条款弹出框END -->
	
	<c:if test="${requestScope.Info != null }">
             ${requestScope.Info }
    </c:if>
	
	<%--  未记录日期的用户提醒记录 --%>
	<%--
	<c:if test="${requestScope.memberInfo != null }">
             ${requestScope.memberInfo }
    </c:if>
     --%>
    <%-- 提醒未成为普通会员却想成为VIP的，先注册为普通会员。  --%>
    <%-- 
   	<c:if test="${requestScope.VIPInfo != null }">
            ${requestScope.VIPInfo }
    </c:if>
 	--%>
</body>

	<script src="${pageContext.request.contextPath }/scripts/jquery.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/scripts/bootstrap.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/scripts/light-bootstrap-dashboard.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/scripts/jquery.raty.js" type="text/javascript"></script>
	<script type="text/javascript">
	$('#star1').raty({
		  readOnly : true,
		  score    : 5
		});
	$('#star2').raty({
		  readOnly : true,
		  score    : 5
		});
	$('#star3').raty({
		  readOnly : true,
		  score    : 5
		});
	</script>
	
 
</html>
 