<%--
    Document   : home page
    Author     : Vikky
--%>


<%@page import="com.team.app.domain.*"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.util.List"%>
<html lang="en">
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>WaterConsumption |  Liter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 <!--  Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
 <!--  Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
 <!--  Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="css/AdminLTE.min.css">
 <!--  AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="css/skins/_all-skins.min.css">
  
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
  <script src="https://code.highcharts.com/modules/export-data.js"></script>
  
  
  <script type="text/javascript" src="js/scroller.js"></script>


<!-- ChartJS 1.0.1 -->
<script src="plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="js/pages/dashboard2.js"></script>
  
<!--  jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<!-- <script src="plugins/slimScroll/jquery.slimscroll.js"></script> -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick-->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- <script src="plugins/fastclick/fastclick.min.js"></script> -->
<!-- AdminLTE App -->
<script src="js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/demo.js"></script>
<!-- jQuery Knob -->
<script src="plugins/knob/jquery.knob.js"></script>
<!-- Sparkline -->
<!-- <script src="plugins/sparkline/jquery.sparkline.js"></script> -->
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- Bootstrap Date-Picker Plugin -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">

 	
  <script type="text/javascript">
  
  $(function () {
	  
	     $('#datetimepicker1').datetimepicker();
		  $('#datetimepicker2').datetimepicker();
	    /* jQueryKnob */
	      $(".knob").knob({
	      /*change : function (value) {
	       //console.log("change : " + value);
	       },
	       release : function (value) {
	       console.log("release : " + value);
	       },
	       cancel : function () {
	       console.log("cancel : " + this.value);
	       },*/
	      draw: function () {

	        // "tron" case
	        if (this.$.data('skin') == 'tron') {

	          var a = this.angle(this.cv)  // Angle
	              , sa = this.startAngle          // Previous start angle
	              , sat = this.startAngle         // Start angle
	              , ea                            // Previous end angle
	              , eat = sat + a                 // End angle
	              , r = true;

	          this.g.lineWidth = this.lineWidth;

	          this.o.cursor
	          && (sat = eat - 0.3)
	          && (eat = eat + 0.3);

	          if (this.o.displayPrevious) {
	            ea = this.startAngle + this.angle(this.value);
	            this.o.cursor
	            && (sa = ea - 0.3)
	            && (ea = ea + 0.3);
	            this.g.beginPath();
	            this.g.strokeStyle = this.previousColor;
	            this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sa, ea, false);
	            this.g.stroke();
	          }

	          this.g.beginPath();
	          this.g.strokeStyle = r ? this.o.fgColor : this.fgColor;
	          this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sat, eat, false);
	          this.g.stroke();

	          this.g.lineWidth = 2;
	          this.g.beginPath();
	          this.g.strokeStyle = this.o.fgColor;
	          this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false);
	          this.g.stroke();

	          return false;
	        }
	      }
	    });
	    /* END JQUERY KNOB */
	     	   
	  });
  
  var jsonVal;
  
  function confirmValidate(){
	   
	   var orgid=document.getElementById("orgid").value;
	  	var appid=document.getElementById("appid").value;
	  	var devid=document.getElementById("devid").value;
	  	var fromDate=document.getElementById("fromDate").value;
	  	var toDate=document.getElementById("toDate").value;
	  		   	   
	   if(orgid=="0"){
		   alert("Please select Organisation!");
		   return false;
	   }else if(appid=="0"){
		   alert("Please select Application!");
		   return false;
	   }else if(devid=="0"){
		   alert("Please select DevEUI!");
		   return false;
	   }else if ($("input[name=fromDate]").val() == "") {
			alert("Please specify FromDate");
			return false;
	   }else if ($("input[name=toDate]").val() == "") {
			alert("Please specify ToDate");
			return false;
	   }else{
		   
		   $.ajax({
               url: 'getGraphVal',
               type: 'POST',
               data: jQuery.param({ orgId: orgid, appId : appid, devId : devid,fromDate : fromDate, toDate:toDate }) ,
               success: function (data) {
               jsonVal=data;
                   //$(".success").html(data);
               //window.location.reload();
               loadScript();
                   },
  		 		error: function(e){
  	     			        alert('Error: ' + e);
  	     		 }

                  
               }); 
		  
		   return false;
		
   		} 
  }
  
  /*Calling for graph*/
  function loadScript() {
	 var graphVal;
	 var JSON;
	 if( typeof this.jsonVal !== 'undefined' ) {
		 //var obj=JSON.parse(jsonVal);
		 var obj=eval("(function(){return " + jsonVal + ";})()");
		 graphVal=obj.value;
	 }
	 //alert("Value "+graphVal);
	 
	 if( typeof this.jsonVal !== 'undefined' ) {
      JSON = [                   
                   {
                     name: 'WaterConsumedUnits',
                     data: [0, 0, 0, 0, 0, 0, 0, graphVal, 0, 0, 0, 0]
                   }
                 ];
	 }else{
		 JSON = [                   
             {
               name: 'WaterConsumedUnits',
               data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
             }
           ];
	 } 
      var options = {
                     chart: {
                              renderTo: 'container',
                              type: 'line'
                            },
                     title: {
                              text: 'Water Consumption Units Graph'
                            },
                     xAxis: {
                              categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                              //type: 'datetime'
                            },
                     yAxis: {
                          	  min: 0,
                          	  max:500,
                              title: {
                                text: 'Values'
                              }                
                            },
                    legend: {
                              layout: 'vertical',
                              align: 'right',
                              verticalAlign: 'middle'
                            },
               plotOptions: {
                    	      line: {
                     	      dataLabels: {
                     	        enabled: true
                     	      }
                     	    }
                     	  },
                    series: []
                   };

                     options.series = JSON;

                     // Create the chart
                     var chart = new Highcharts.Chart(options);
      }
  
  
function getAppByOrgID()
{    
           	var orgid=document.getElementById("orgid").value;
           	
           	if(orgid=="0")
               	{      
           	
               	var appid=document.getElementById("appid");
               	var devid=document.getElementById("devid");
               		appid.innerHTML='<select name="appname" id="appid" onchange="getDevEUIByAppID()"> <option value="0" >Select Applicatoin</option></select>';
               		devid.innerHTML='<select name="devname" id="devid"> <option value="0" >Select Device EUI</option></select>';
               		return;
               	}
               else
               	{
               	                
               var url="getApplications?orgId="+orgid;                                    
               xmlHttp=GetXmlHttpObject()
               if (xmlHttp==null)
               {
                   alert ("Browser does not support HTTP Request");
                   return
               }                    
               xmlHttp.onreadystatechange=setApplication;	
               xmlHttp.open("GET",url,true);                
               xmlHttp.send(null);
               
               	}
}
           
           
function getDevEUIByAppID()
{     
	var appid=document.getElementById("appid").value;
	
	if(appid=="0")
   	{                	
   	var devid=document.getElementById("devid");
   		devid.innerHTML='<select name="devname" id="devid"> <option value="0" >Select Device EUI</option></select>';
   	return;
   	}
   else
   	{
   var url="getDevEUISync?appId="+appid;                                    
   xmlHttp=GetXmlHttpObj()
   if (xmlHttp==null)
   {
       alert ("Browser does not support HTTP Request");
       return
   }                    
   xmlHttp.onreadystatechange=setDevEUI;	
   xmlHttp.open("GET",url,true);                
   xmlHttp.send(null);
   
   	}
}
               
           function GetXmlHttpObject()
           {
               var xmlHttp=null;
               if (window.XMLHttpRequest) 
               {
                   xmlHttp=new XMLHttpRequest();
               }                
               else if (window.ActiveXObject) 
               { 
                   xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
               }

               return xmlHttp;
           }
           
           
           function GetXmlHttpObj()
           {
               var xmlHttp=null;
               if (window.XMLHttpRequest) 
               {
                   xmlHttp=new XMLHttpRequest();
               }                
               else if (window.ActiveXObject) 
               { 
                   xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
               }

               return xmlHttp;
           }
       
           function setApplication() 
           {                      
               if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
               { 
                   var returnText=xmlHttp.responseText;
                   var appid=document.getElementById("appid");
                   appid.innerHTML='<select  name="appname" id="appid" onchange="getDevEUIByAppID()"><Option value="0">Select Application</Option>'+returnText+'</select>';                                             
               }
           }
           
           function setDevEUI() 
           {                      
               if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
               { 
                   var returnText=xmlHttp.responseText;
                   var devid=document.getElementById("devid");
                   devid.innerHTML='<select  name="devname" id="devid"><Option value="0">Select Device EUI</Option>'+returnText+'</select>';                                             
               }
           }
	   
  
  
/*   function loadScript() {
      var JSON = [
                   { name: 'Pay Off',
                     data: [500.0, 9.5, 14.5, 180.4, 21.5, 25.2, 206.5, 23.3, 180.3, 13.9, 900.6]
                   },
                   {
                     name: 'Profit',
                     data: [800.0, 402.2, 510.7, 820.5, 1100.9, 1520.2, 173.0, 164.6, 145.2, 10.3, 6.6, 4.8]
                   }
                 ];
      var options = {
                     chart: {
                              renderTo: 'container',
                              type: 'line'
                            },
                     title: {
                              text: 'Water Consumption Units Graph'
                            },
                     xAxis: {
                              categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                              //type: 'datetime'
                            },
                     yAxis: {
                          	  min: 0,
                              title: {
                                text: 'Values'
                              }                
                            },
                    legend: {
                              layout: 'vertical',
                              align: 'right',
                              verticalAlign: 'middle'
                            },
               plotOptions: {
                    	      line: {
                     	      dataLabels: {
                     	        enabled: true
                     	      }
                     	    }
                     	  },
                    series: []
                   };

                     options.series = JSON;

                     // Create the chart
                     var chart = new Highcharts.Chart(options);
      } */
  
 	 
 </script> 
   
  
     
  </head>
  
  <body class="hold-transition skin-blue sidebar-mini" onload="loadScript()">
  		    <% 
  				String orgName=(String)request.getAttribute("name");
  				String orgId=(String)request.getAttribute("id");	
  			%>		
							 
  <div class="wrapper">  
  	
 <%@include file="Header.jsp"%>  
 
	<div class="content-wrapper">
		
			<section class="content">
		 		<div class="content-wrap box box-primary">
		 		
		 				<div class="row">
							<div class="col-sm-12 text-right ">	
							   <img src="images/user_iocn_header.png" />&nbsp;<b>Welcome <%=userSession.getUname()%></b> 
							</div>
													
						</div><br/>
		 		
						 <!-- row -->
					      <div class="row">
					        <div class="col-md-12">
					          <!-- jQuery Knob -->
					    <div class="box box-solid">
					        <div class="box-header">
					            <i class="fa fa-user"></i>
									<h3 class="box-title">
										<b>User-Device</b>
									</h3>
					           
					
					            <div class="box-tools pull-right">
					                <button type="button" class="btn btn-default btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
					                </button>
					                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
					            </div>
					        </div>
					            <!-- /.box-header -->
					            <div class="box-body">
					              <div class="row">
					               <!--  <div class="col-xs-6 col-md-3 text-center">
					                  <input type="text" class="knob" value="30" data-width="90" data-height="90" data-fgColor="#3c8dbc">
					
					                  <div class="knob-label">Total Users</div>
					                </div> -->
					                <!-- ./col -->
					               <!--  <div class="col-xs-6 col-md-3 text-center">
					                  <input type="text" class="knob" value="70" data-width="90" data-height="90" data-fgColor="#f56954">
					
					                  <div class="knob-label">Total DevEUI</div>
					                </div> -->
					                <!-- ./col -->
					                <div class="col-xs-6 col-md-6 text-center">
					                  <input type="text" class="knob" value="45" data-min="0" data-max="100" data-width="90" data-height="90" data-fgColor="#00a65a">
					
					                  <div class="knob-label">Users</div>
					                </div>
					                <!-- ./col -->
					                
					                
					                
					                <div class="col-xs-6 col-md-6 text-center">
					                  <input type="text" class="knob" value="40" data-min="0" data-max="100" data-width="90" data-height="90" data-fgColor="#00c0ef">
					
					                  <div class="knob-label">Sensors</div>
					                </div>
					                <!-- ./col -->
					              </div>
					              <!-- /.row -->
					
					              
					            </div>
					            <!-- /.box-body -->
					          </div>
					          <!-- /.box -->
					        </div>
					        <!-- /.col -->
					      </div>
					      <!-- /.row -->
							 		
					
		 		
		 			<div class="row">
						<div class="col-md-12">
							<div class="box box-success">
								<div class="box-header with-border">
								<i class="fa fa-area-chart"></i>
									<h3 class="box-title">
										<b>Water consumption in litres</b>
									</h3>
									
									<form name="form1" action="#" onsubmit="return confirmValidate();" method="post">
										
								  <table class="table">
								  <tr>
								  <td>
								  			<label>Organization</label>
								  			 <div>
										          <select name="orgid" class="form-control" id="orgid" onchange="getAppByOrgID()">
													    <option value="0">Select Organisation</option>	
													    <option value="<%=orgId%>"><%=orgName%></option>
												  </select> 
												   <input type="hidden" id="orgName" name="orgName" value=<%=orgName%>>										            
									        </div>										
										</td>
										
									    <td> 
									   		<label>Application</label>
									   		<div>
											 	<select name="appid" class="form-control" id="appid" onchange="getDevEUIByAppID()">
											    	<option value="0">Select Application</option>	
											    </select> 
										    </div>
										</td>
									
									
									
									    <td>
									   		<label>DevEUI</label>
										  	<div>
									          <select name="devid" id="devid" class="form-control">
										    	<option value="0">Select DevEUI</option>	
										      </select> 
									            
									        </div>
										</td>
									</tr>
								  <tr>      
								       <td>
								        <label>From Date</label>
								        <div class='input-group date' id='datetimepicker1'>
								          <input type='text' name="fromDate" id="fromDate" class="form-control" placeholder="Select FromDate"/>
								            <span class="input-group-addon">
								            	<span class="glyphicon glyphicon-calendar"></span>    
								            </span>
								         </div>
								      </td>
								      
							           <td>
							       		 <label>To Date</label>
									        <div class='input-group date' id='datetimepicker2'>
									          <input type='text' name="toDate" id="toDate" class="form-control" placeholder="Select ToDate" />
									            <span class="input-group-addon">
									            	<span class="glyphicon glyphicon-calendar"></span>
									            </span>
									        </div>
							            </td>
							           							           
							            							            
							            
							            <td>
							       		 <label>Filter By</label>
									        <div>
									          <select name="filter" id="filter" class="form-control">
									            <!-- <option value="0">Select Filter</option> -->
										    	<option value="Monthly">Monthly</option>
										    	<!-- <option value="Hours">Hourly</option>	
										    	<option value="Minutes">Minutes</option> -->	
										      </select> 
									            
									        </div>
							            </td>
							            
							            <td>
							       		 <label>Action</label>
									        <div>
									         <input type="submit"  class="form-control" style="background-color:#3c8dbc;" value="Submit"/>
									            
									        </div>
							            </td>
							            
							            
        							</tr>
									
									
								</table>	
							 </form>

									<div class="box-tools pull-right">
										<button type="button" class="btn btn-box-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-default btn-sm">
											<i class="fa fa-refresh"></i>
										</button>
									</div>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<div class="row">
										<div class="col-md-12">
											<div class="chart">
											
												<!-- Sales Chart Canvas -->
												<!-- <canvas id="salesChart" style="height: 180px;"></canvas> -->
												<div id="container"  style="height: 400px;"></div>
																						
   												<p class="text-right">
													<strong>X-axis Date</strong><br /> <strong>Y-axis
														water units</strong><br />
												</p>
											</div>
											<!-- /.chart-responsive -->
										</div>
										<!-- /.col -->

										<!-- /.col -->
									</div>
									<!-- /.row -->
								</div>
								<!-- ./box-body -->

								<!-- /.box-footer -->
							</div>
							<!-- /.box -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
					
					
					
			      <!-- Main row -->
			      <div class="row">
			        <!-- Left col -->
			        <div class="col-sm-12">
			          <!-- MAP & BOX PANE -->
			          <div class="box box-success">
			            <div class="box-header with-border">
			            <i class="fa fa-map-marker"></i>
			              <h3 class="box-title"><b>Water Reservoirs</b></h3>
			
			              <div class="box-tools pull-right">
			                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
			                </button>
			                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
			              </div>
			            </div>
			            <!-- /.box-header -->
			            <div class="box-body no-padding">
			              <div class="row">
			                <div class="col-md-12 col-sm-12">
			                  <div class="pad">
			                    <!-- Map will be created here -->
			                   
			                  <iframe  style="float: right; width: 100%" height="300px" src="marklandmarkdash?orgId=6" ></iframe>
			                  </div>
			                </div>
			                <!-- /.col -->
			         
			                <!-- /.col -->
			              </div>
			              <!-- /.row -->
			            </div>
			            <!-- /.box-body -->
			          </div>
			          <!-- /.box -->
			         
			        </div>
			        <!-- /.col -->
			
			      
			      </div>
			      <!-- /.row -->
					
		 	</div>
		</section>	
	  <%@include file="Footer.jsp"%>  		
	</div>	
	</div>
			
  </body>
</html>