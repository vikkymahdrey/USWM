<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="dashboard/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="dashboard/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->

<!-- Theme style -->
<link rel="stylesheet" href="dashboard/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="dashboard/dist/css/skins/_all-skins.min.css">
<!-- Morris chart -->
<link rel="stylesheet"
	href="dashboard/bower_components/morris.js/morris.css">

<!-- Date Picker -->
<link rel="stylesheet"
	href="dashboard/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="dashboard/bower_components/bootstrap-daterangepicker/daterangepicker.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet"
	href="dashboard/customcolors/unizencolors.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue skin-black" onload="loadData()">

<div class="modal" id="modal-info" style="display: none;">
              
              <div class="modal-body">
              <div class="row">
            <div class="col-sm-4 col-md-2">
              
            </div>
            <!-- /.col -->
            <div class="col-sm-4 col-md-2">
              
            </div> <div class="col-sm-4 col-md-2">
              
            </div>
            <!-- /.col -->
           
            <!-- /.col -->
            <div class="col-sm-4 col-md-2">
             
             <i class="fa fa-spinner fa-spin" style="font-size:100px;color:#235E93"></i>
            </div>
            <!-- /.col -->
            <div class="col-sm-4 col-md-2">
              
            </div>
            <!-- /.col -->
            <div class="col-sm-4 col-md-2">
             
              
            </div>
            
            <!-- /.col -->
          </div>
              </div>
            
            <!-- /.modal-content -->
         
          <!-- /.modal-dialog -->
        </div>

	<div class="wrapper">


		<!-- Left side column. contains the logo and sidebar -->

		<%@include file="Header_v2.jsp"%>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Total Water Cosumption <small></small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-refresh fa-spin" style="font-size:24px;" onclick="loadData()"></i> </a></li>
				
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Donot delete this tab -->
				
				<div id="refTotal" style="display: none" class="col-lg-4 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-green">
							<div class="inner">
								<h3>
									53<sup style="font-size: 20px">%</sup>
								</h3>

								<p>Bounce Rate</p>
							</div>
							<div class="icon">
								<i class="ion ion-stats-bars"></i>
							</div>
							<a href="#" class="small-box-footer"><!--  More info --><i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				
				<div id="totalConsumption" class="row">

					<!-- ./col -->
					
					<!-- ./col -->
					<!--   <div class="col-lg-4 col-xs-6">
          small box
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>44</h3>

              <p>User Registrations</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        ./col
        <div class="col-lg-4 col-xs-6">
          small box
          <div class="small-box bg-red">
            <div class="inner">
              <h3>65</h3>

              <p>Unique Visitors</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div> -->
					<!-- ./col -->
				</div>
				<!-- /.row -->

				<!-- Main row -->
				<div class="row">
					<!-- Left col -->
					<section class="col-lg-12 connectedSortable">
						<!-- Custom tabs (Charts with tabs)-->
						<div class="nav-tabs-custom">
							<!-- Tabs within a box -->
							<div class="box-header with-border">
								<h3 class="box-title">Day Report</h3>

							
							</div>
							<div class="tab-content no-padding">
								<!-- Morris chart - Sales -->
								<div class="chart tab-pane active" id="daily-chart"
									style="position: relative; height: 300px;"></div>

							</div>
						</div>
						<!-- /.nav-tabs-custom -->

						<!-- Chat box -->

						<!-- /.box (chat box) -->

						<!-- TO DO List -->

						<!-- /.box -->

						<!-- quick email widget -->


					</section>
					<!-- /.Left col -->
					<!-- right col (We are only adding the ID to make the widgets sortable)-->

					<!-- right col -->
				</div>
				<!-- /.row (main row) -->

			</section>
			<section class="content">
				<!-- <div class="callout callout-warning">
        <h4>Warning!</h4>
     
        <p><b>Morris.js</b> charts are no longer maintained by its author. We would recommend using any of the other
          charts that come with the template.</p>
      </div>-->
				<div class="row">

					<!-- /.col (LEFT) -->
					<div class="col-md-12">
						<!-- LINE CHART -->

						<!-- /.box -->

						<!-- BAR CHART -->
						<div class="box box-success">
							<div class="box-header with-border">
								<h3 class="box-title">Current Month Consumption </h3>

								
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="bar-chart"
									style="height: 300px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
								
									<div class="morris-hover morris-default-style"
										style="left: 981.852px; top: 112px; display: none;">
										<div class="morris-hover-row-label">2011</div>
										<div class="morris-hover-point" style="color: #00a65a">
											CPU: 75</div>
										<div class="morris-hover-point" style="color: #f56954">
											DISK: 65</div>
									</div>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->

					</div>
					<!-- /.col (RIGHT) -->
				</div>
				<!-- /.row -->



			</section>


			<section class="content">

				<div class="row">
					<div class="col-md-4">
						<!-- AREA CHART -->

						<!-- /.box -->

						<!-- DONUT CHART -->
						<div class="box box-danger">
							<div class="box-header with-border">
								<h3 class="box-title">Donut Chart</h3>

								
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="sales-chart1"
									style="height: 300px; position: relative;">
									
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->

					</div>
					<!-- /.col (LEFT) -->

					<!-- /.col (RIGHT) -->
					<div class="col-md-4">
						<!-- AREA CHART -->

						<!-- /.box -->

						<!-- DONUT CHART -->
						<div class="box box-danger">
							<div class="box-header with-border">
								<h3 class="box-title">Donut Chart</h3>

								
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="sales-chart2"
									style="height: 300px; position: relative;">
									
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->

					</div>
					<div class="col-md-4">
						<!-- AREA CHART -->

						<!-- /.box -->

						<!-- DONUT CHART -->
						<div class="box box-danger">
							<div class="box-header with-border">
								<h3 class="box-title">Donut Chart</h3>

								
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="sales-chart3"
									style="height: 300px; position: relative;">
																	</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->

					</div>
				</div>
				<!-- /.row -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.4.0
			</div>
			<strong>Copyright &copy; 2014-2016 <a
				href="https://adminlte.io">Almsaeed Studio</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
						class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-user bg-yellow"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Frodo Updated His
										Profile</h4>

									<p>New phone +1(800)555-1234</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-envelope-o bg-light-blue"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Nora Joined Mailing
										List</h4>

									<p>nora@example.com</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-file-code-o bg-green"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Cron Job 254
										Executed</h4>

									<p>Execution time 5 seconds</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span
										class="label label-danger pull-right">70%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Update Resume <span class="label label-success pull-right">95%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-success"
										style="width: 95%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Laravel Integration <span
										class="label label-warning pull-right">50%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-warning"
										style="width: 50%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Back End Framework <span class="label label-primary pull-right">68%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-primary"
										style="width: 68%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Allow mail
								redirect <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Other sets of options are available</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Expose author
								name in posts <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Allow the user to show his name in blog posts</p>
						</div>
						<!-- /.form-group -->

						<h3 class="control-sidebar-heading">Chat Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Show me as
								online <input type="checkbox" class="pull-right" checked>
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Turn off
								notifications <input type="checkbox" class="pull-right">
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Delete chat
								history <a href="javascript:void(0)" class="text-red pull-right"><i
									class="fa fa-trash-o"></i></a>
							</label>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 3 -->
	<script src="dashboard/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="dashboard/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Morris.js charts -->
	<script src="dashboard/bower_components/raphael/raphael.min.js"></script>
	<script src="dashboard/bower_components/morris.js/morris.min.js"></script>
	<!-- Sparkline -->
		<!-- jvectormap -->
	
	<!-- jQuery Knob Chart -->
	<script
		src="dashboard/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
		<script
		src="dashboard/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- datepicker -->
	<script
		src="dashboard/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<!-- Bootstrap WYSIHTML5 -->
	
	<!-- Slimscroll -->
	<script
		src="dashboard/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	
	<!-- AdminLTE App -->
	<script src="dashboard/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="dashboard/dist/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->

	<script>
	
	var loader = document.getElementById("modal-info");
	
	
	setInterval(loadData, 60000);
	
	
	var load = false;
	function loaderz(){
		
		if(load == false){
			loader.setAttribute("style","display:block");
			load = true;	
		}else{
			loader.setAttribute("style","display:none");
			load = false;
		}
		
	}
	
	function loadData(){
	
		getcurrebtDaysReport();
		getMonthDates();
		createdonotjson();
		lastFirstmonthdonut();
		lastSecondmonthdonut();
		lastThirdmonthdonut();
		getWeeksDates();
		drawbarchart();		
		
	}
	
	

	
	/* $(function() {
		getcurrebtDaysReport();
		getMonthDates();
		createdonotjson();
		lastFirstmonthdonut();
		lastSecondmonthdonut();
		lastThirdmonthdonut();
		getWeeksDates();
		drawbarchart();
	}); */
		var dayreportjson = {}
		var totalConsumption = {}
		var dateJSON={"FirstMonth":{from:" ",to:" "},"SecondMonth":{from:" ",to:" "},"ThiredMonth":{from:" ",to:" "}};

		var monthconsumtion = {"FirstMonth":'',"SecondMonth":'',"ThiredMonth":''}
		
		//{ devId : '1200000000002345',fromDate : '11/20/2018 12:12 PM', toDate:'11/22/2018 12:12 PM',type: 'days'}
		
		var weekJSON={"FirstWeek":{from:" ",to:" "},"SecondWeek":{from:" ",to:" "},"ThirdWeek":{from:" ",to:" "},"FourthWeek":{from:" ",to:" "}};
		const monthNames = ["January", "February", "March", "April", "May", "June",
			  "July", "August", "September", "October", "November", "December"
			];
		
		function drawbarchart(){
			
var tempdata = []
var ykeys = []



for(var device in totalConsumption){

ykeys.push(device.split("->")[1])
}

			
			for(var week in weekJSON){
				
				var consuptionref = {y:''+weekJSON[week].from+'-'+weekJSON[week].to};
				for(var device in totalConsumption){
					
					
					var responsejson = JSON.parse(getConsumtion(device.split("->")[1],weekJSON[week].from,weekJSON[week].to,null))
					
					
					var result = responsejson.result;
					
					var tempconsumtion = 0;
					
					for(var obj in result){
						
						tempconsumtion = tempconsumtion + result[obj].units;
						
					}
					
					consuptionref[''+device.split("->")[1]+''] = tempconsumtion
					

				}
				tempdata.push(consuptionref)
			}
			
			
			var bar = new Morris.Bar({
				element : 'bar-chart',
				resize : true,
				data : tempdata,
				barColors :  [ '#F58C1F', '#64B246', '#91191C','#235E93','#235E93', '#64B246', '#91191C','#F58C1F'],
				xkey : 'y',
				ykeys : ykeys,
				labels : ykeys,
				hideHover : 'auto'
			});
			
			
		}
		
		
		function getWeeksDates()
		{
		
			
		   var date = new Date();
		   var year = date.getFullYear(), month = date.getMonth();

		   weekJSON.FirstWeek.from = new Date(year, month, 1).toLocaleDateString();
		   weekJSON.FirstWeek.to=new Date(year, month, 7).toLocaleDateString();
		       
		   weekJSON.SecondWeek.from = new Date(year, month, 8).toLocaleDateString();
		   weekJSON.SecondWeek.to=new Date(year, month, 14).toLocaleDateString();
		       
		   weekJSON.ThirdWeek.from= new Date(year, month, 15).toLocaleDateString();
		   weekJSON.ThirdWeek.to=new Date(year, month, 21).toLocaleDateString();
		       
		   weekJSON.FourthWeek.from = new Date(year, month, 22).toLocaleDateString();
		   weekJSON.FourthWeek.to=new Date(year, month + 1, 0).toLocaleDateString();      
		
			
		}
		
		function lastFirstmonthdonut(){
			var tempmonth = JSON.stringify(dateJSON.FirstMonth.from).split('"')[1].split("/")[0]
			document.getElementById('sales-chart1').parentElement.parentElement.getElementsByTagName('h3')[0].innerHTML =monthNames[parseInt(tempmonth)-1]//(dateJSON.FirstMonth.from +' to '+ dateJSON.FirstMonth.to)
			
			var donut = new Morris.Donut({
				element : 'sales-chart1',
				resize : true,
				colors : [ '#235E93', '#64B246', '#91191C','#F58C1F','#235E93', '#64B246', '#91191C','#F58C1F'],
				data :monthconsumtion.FirstMonth,
				hideHover : 'auto'
			});
			
		}

		function lastSecondmonthdonut(){
			var tempmonth = JSON.stringify(dateJSON.SecondMonth.from).split('"')[1].split("/")[0]
			document.getElementById('sales-chart2').parentElement.parentElement.getElementsByTagName('h3')[0].innerHTML = monthNames[parseInt(tempmonth)-1]
			
			var donut = new Morris.Donut({
				element : 'sales-chart2',
				resize : true,
				colors : [ '#235E93', '#64B246', '#91191C','#F58C1F','#235E93', '#64B246', '#91191C','#F58C1F'],
				data :monthconsumtion.SecondMonth,
				hideHover : 'auto'
			});
			
		}

		function lastThirdmonthdonut(){
			var tempmonth = JSON.stringify(dateJSON.ThiredMonth.from).split('"')[1].split("/")[0]
			
			document.getElementById('sales-chart3').parentElement.parentElement.getElementsByTagName('h3')[0].innerHTML = monthNames[parseInt(tempmonth)-1]
			
			
			var donut = new Morris.Donut({
				element : 'sales-chart3',
				resize : true,
				colors : [ '#F58C1F', '#64B246', '#91191C', '#F58C1F',
					'#64B246', '#91191C', '#F58C1F', '#64B246', '#91191C' ],
				data : monthconsumtion.ThiredMonth,
				hideHover : 'auto'
			});
			
		}

function createdonotjson(){
	
	for(var i in dateJSON){
		
		var consuptionref = [];
		
		for(var device in totalConsumption){
			
			var responsejson = JSON.parse(getConsumtion(device.split("->")[1],dateJSON[i].from,dateJSON[i].to,null))
		
			var result = responsejson.result;
			
			var tempconsumtion = 0;
			
			for(var obj in result){
				
				tempconsumtion = tempconsumtion + result[obj].units;
				
			}
			var devicedataref = {label:device.split("->")[0],value:tempconsumtion}
			consuptionref.push(devicedataref);
			
		}
		
		var consumptiontest = 0;
		for(var index in consuptionref){
			
			consumptiontest = consumptiontest + consuptionref[index].value
		}
		
		if(consumptiontest > 0){
			monthconsumtion[i] = consuptionref;
		}else {
			
			monthconsumtion[i] = [{label:'Water Consumption ',value:0}]
			
		}
		
	}
	
	
}


function getConsumtion(devid,fromDate,toDate,filter){
	
	var jsonVal;
	
	   $.ajax({
           url: 'getGraphOnDemand',
           async: false,
           type: 'POST',
           data: jQuery.param({ devId : devid,fromDate : fromDate, toDate:toDate,type: 'days'}) ,
           success: function (data) {
        	   jsonVal=data; 
        	  
        	
           			
               },
		 		error: function(e){
	     			        alert('Error: ' + e);
	     		 }

              
           }); 


	   return jsonVal;

}

var collop = 0;
function getLineColors(){
			
	if(collop == 4){
		collop = 0;
	}
	var staticlineColors = [ '#F58C1F', '#64B246', '#91191C','#235E93']
			
			return staticlineColors[collop++]
		
		}
		
		
		var colorloop = 0;
		
		function getBoxColor(){
			if(colorloop == 4){
				colorloop = 0;
			}
			var totalBoxClasses = ['unizen-orange','unizen-green','unizen-red','unizen-blue']
			return totalBoxClasses[colorloop++]
			
		}
		
		function getcurrebtDaysReport() {
			//loader.setAttribute("style","display:block")
			
			$.ajax({
				url : 'getGraphOnBodyLoad',
				async: false,
				type : 'GET',
				success : function(data) {
					dayreportjson = JSON.parse(data);

					plotdayChart();
				},
				error : function(e) {
					alert('Error: ' + e);
				}

			});

			$.ajax({
				url : 'totalWaterConsumedByUser',
				async: false,
				type : 'GET',
				success : function(data) {
					totalConsumption = data;
					
					//console.log(totalConsumption)
					
					plotTotalConsuption()

				},
				error : function(e) {
					alert('Error: ' + e);
				}

			});

		}

		function plotTotalConsuption() {
			
			colorloop = 0;
			var refdiv = document.getElementById('refTotal')

			var devicesCount = Object.keys(totalConsumption).length;
			
			document.getElementById('totalConsumption').innerHTML = "";
			
			for ( var i in totalConsumption) {

				var innerval = refdiv.cloneNode(true);

				innerval.setAttribute("style", "");
				innerval.setAttribute("id", "");
				
				var boxwidthclass = 'col-lg-4 col-xs-4';
				if(devicesCount == 1){
					
					boxwidthclass = 'col-lg-12 col-xs-12'
				}else if(devicesCount == 2){
					
					boxwidthclass = 'col-lg-6 col-xs-6'
				}else{
					
				}
				
				innerval.setAttribute("class",boxwidthclass)
 
				innerval.getElementsByTagName("p")[0].innerHTML ="<span style='color:white'>"+ i.split('->')[0]+"</span>";
				
				innerval.getElementsByTagName("div")[0].setAttribute("class","small-box");
				innerval.getElementsByTagName("div")[0].classList.add(getBoxColor())
				

				innerval.getElementsByTagName("h3")[0].innerHTML = "<span style='color:white'>"+totalConsumption[i] + "<small style='color:white'>Ltrs</small>"+"</span>";
				
				document.getElementById('totalConsumption').appendChild(
						innerval);

			}

		}

		function plotdayChart() {
			collop =0;
			var ykeys = []
			var labels = []
			var lineColors = []

			var eachValObj = {}

			var dataVal = []

			try {
				var config = dayreportjson.result.units;
				var timeval = dayreportjson.result.xAxis.categories;

				for ( var k in config) {

					ykeys.push(config[k].name);
					labels.push(config[k].name);
					lineColors.push(getLineColors())

				}

				for ( var i in timeval) {

					var newobj = {}
					newobj['y'] = timeval[i]

					for ( var j in config) {

						var waterval = config[j].data[i]
						var name = config[j].name

						newobj['' + name + ''] = waterval;

					}

					dataVal.push(newobj)

				}

			} catch (e) {

				var line = new Morris.Line({
					element : 'daily-chart',
					resize : true,
					data : dataVal,
					xkey : 'y',
					ykeys : ykeys,
					labels : labels,
					lineColors : lineColors,
					hideHover : 'auto'
				});

			}

			var line = new Morris.Line({
				element : 'daily-chart',
				resize : true,
				data : dataVal,
				xkey : 'y',
				ykeys : ykeys,
				labels : labels,
				lineColors : lineColors,
				hideHover : 'auto'
			});

		}
		
			function getMonthDates()
		{

		   var date = new Date();
		   var year = date.getFullYear(), month = date.getMonth();

		   dateJSON.FirstMonth.from = new Date(year, month, 1).toLocaleDateString();
		   dateJSON.FirstMonth.to = new Date(year, month + 1, 0).toLocaleDateString();
		   
		   dateJSON.SecondMonth.from = new Date(year, month-1, 1).toLocaleDateString();
		   dateJSON.SecondMonth.to = new Date(year, (month-1) + 1, 0).toLocaleDateString();
		   
		   dateJSON.ThiredMonth.from = new Date(year, month-2, 1).toLocaleDateString();
		   dateJSON.ThiredMonth.to= new Date(year, (month-2) + 1, 0).toLocaleDateString();
		   
		}
		
		
</script>

</body>
</html>
