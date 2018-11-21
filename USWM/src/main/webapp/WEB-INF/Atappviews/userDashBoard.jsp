<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Dashboard</title>
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
<link rel="stylesheet"
	href="dashboard/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dashboard/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="dashboard/dist/css/skins/_all-skins.min.css">
<!-- Morris chart -->
<link rel="stylesheet"
	href="dashboard/bower_components/morris.js/morris.css">
<!-- jvectormap -->
<link rel="stylesheet"
	href="dashboard/bower_components/jvectormap/jquery-jvectormap.css">
<!-- Date Picker -->
<link rel="stylesheet"
	href="dashboard/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="dashboard/bower_components/bootstrap-daterangepicker/daterangepicker.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet"
	href="dashboard/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

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
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">


		<!-- Left side column. contains the logo and sidebar -->

		<%@include file="Header_v2.jsp"%>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Total Water Consumed <small>by user</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Dashboard</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Small boxes (Stat box) -->
				<div id="totalConsumption" class="row">

					<!-- ./col -->
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

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
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
								<h3 class="box-title">Bar Chart</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="bar-chart"
									style="height: 300px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
									<svg height="300" version="1.1" width="748"
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink"
										style="overflow: hidden; position: relative; left: -0.5px;">
										<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc>
										<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
										<text x="32.84375" y="261" text-anchor="end"
											font-family="sans-serif" font-size="12px" stroke="none"
											fill="#888888"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
											font-weight="normal">
										<tspan dy="4"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">0</tspan></text>
										<path fill="none" stroke="#aaaaaa" d="M45.34375,261H723"
											stroke-width="0.5"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
										<text x="32.84375" y="202" text-anchor="end"
											font-family="sans-serif" font-size="12px" stroke="none"
											fill="#888888"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
											font-weight="normal">
										<tspan dy="4"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">25</tspan></text>
										<path fill="none" stroke="#aaaaaa" d="M45.34375,202H723"
											stroke-width="0.5"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
										<text x="32.84375" y="143" text-anchor="end"
											font-family="sans-serif" font-size="12px" stroke="none"
											fill="#888888"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
											font-weight="normal">
										<tspan dy="4"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">50</tspan></text>
										<path fill="none" stroke="#aaaaaa" d="M45.34375,143H723"
											stroke-width="0.5"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
										<text x="32.84375" y="84" text-anchor="end"
											font-family="sans-serif" font-size="12px" stroke="none"
											fill="#888888"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
											font-weight="normal">
										<tspan dy="4"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">75</tspan></text>
										<path fill="none" stroke="#aaaaaa" d="M45.34375,84H723"
											stroke-width="0.5"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
										<text x="32.84375" y="25" text-anchor="end"
											font-family="sans-serif" font-size="12px" stroke="none"
											fill="#888888"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
											font-weight="normal">
										<tspan dy="4"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">100</tspan></text>
										<path fill="none" stroke="#aaaaaa" d="M45.34375,25H723"
											stroke-width="0.5"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
										<text x="674.5959821428571" y="273.5" text-anchor="middle"
											font-family="sans-serif" font-size="12px" stroke="none"
											fill="#888888"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
											font-weight="normal" transform="matrix(1,0,0,1,0,7)">
										<tspan dy="4"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2012</tspan></text>
										<text x="577.7879464285714" y="273.5" text-anchor="middle"
											font-family="sans-serif" font-size="12px" stroke="none"
											fill="#888888"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
											font-weight="normal" transform="matrix(1,0,0,1,0,7)">
										<tspan dy="4"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2011</tspan></text>
										<text x="480.9799107142857" y="273.5" text-anchor="middle"
											font-family="sans-serif" font-size="12px" stroke="none"
											fill="#888888"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
											font-weight="normal" transform="matrix(1,0,0,1,0,7)">
										<tspan dy="4"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2010</tspan></text>
										<text x="384.171875" y="273.5" text-anchor="middle"
											font-family="sans-serif" font-size="12px" stroke="none"
											fill="#888888"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
											font-weight="normal" transform="matrix(1,0,0,1,0,7)">
										<tspan dy="4"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2009</tspan></text>
										<text x="287.3638392857143" y="273.5" text-anchor="middle"
											font-family="sans-serif" font-size="12px" stroke="none"
											fill="#888888"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
											font-weight="normal" transform="matrix(1,0,0,1,0,7)">
										<tspan dy="4"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2008</tspan></text>
										<text x="190.55580357142858" y="273.5" text-anchor="middle"
											font-family="sans-serif" font-size="12px" stroke="none"
											fill="#888888"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
											font-weight="normal" transform="matrix(1,0,0,1,0,7)">
										<tspan dy="4"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2007</tspan></text>
										<text x="93.74776785714286" y="273.5" text-anchor="middle"
											font-family="sans-serif" font-size="12px" stroke="none"
											fill="#888888"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
											font-weight="normal" transform="matrix(1,0,0,1,0,7)">
										<tspan dy="4"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2006</tspan></text>
										<rect x="57.444754464285715" y="25" width="34.80301339285714"
											height="236" rx="0" ry="0" fill="#00a65a" stroke="none"
											fill-opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
										<rect x="95.24776785714286" y="48.60000000000002"
											width="34.80301339285714" height="212.39999999999998" rx="0"
											ry="0" fill="#f56954" stroke="none" fill-opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
										<rect x="154.25279017857144" y="84" width="34.80301339285714"
											height="177" rx="0" ry="0" fill="#00a65a" stroke="none"
											fill-opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
										<rect x="192.05580357142858" y="107.6"
											width="34.80301339285714" height="153.4" rx="0" ry="0"
											fill="#f56954" stroke="none" fill-opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
										<rect x="251.06082589285714" y="143" width="34.80301339285714"
											height="118" rx="0" ry="0" fill="#00a65a" stroke="none"
											fill-opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
										<rect x="288.8638392857143" y="166.60000000000002"
											width="34.80301339285714" height="94.39999999999998" rx="0"
											ry="0" fill="#f56954" stroke="none" fill-opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
										<rect x="347.86886160714283" y="84" width="34.80301339285714"
											height="177" rx="0" ry="0" fill="#00a65a" stroke="none"
											fill-opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
										<rect x="385.671875" y="107.6" width="34.80301339285714"
											height="153.4" rx="0" ry="0" fill="#f56954" stroke="none"
											fill-opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
										<rect x="444.67689732142856" y="143" width="34.80301339285714"
											height="118" rx="0" ry="0" fill="#00a65a" stroke="none"
											fill-opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
										<rect x="482.47991071428567" y="166.60000000000002"
											width="34.80301339285714" height="94.39999999999998" rx="0"
											ry="0" fill="#f56954" stroke="none" fill-opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
										<rect x="541.4849330357142" y="84" width="34.80301339285714"
											height="177" rx="0" ry="0" fill="#00a65a" stroke="none"
											fill-opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
										<rect x="579.2879464285713" y="107.6"
											width="34.80301339285714" height="153.4" rx="0" ry="0"
											fill="#f56954" stroke="none" fill-opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
										<rect x="638.2929687499999" y="25" width="34.80301339285714"
											height="236" rx="0" ry="0" fill="#00a65a" stroke="none"
											fill-opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
										<rect x="676.095982142857" y="48.60000000000002"
											width="34.80301339285714" height="212.39999999999998" rx="0"
											ry="0" fill="#f56954" stroke="none" fill-opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect></svg>
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

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="sales-chart1"
									style="height: 300px; position: relative;">
									<svg height="300" version="1.1" width="215.984"
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink"
										style="overflow: hidden; position: relative;">
										<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc>
										<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
										<path fill="none" stroke="#3c8dbc"
											d="M107.992,215.328A65.328,65.328,0,0,0,169.94875565556106,170.7149224627346"
											stroke-width="2" opacity="0"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path>
										<path fill="#3c8dbc" stroke="#ffffff"
											d="M107.992,218.328A68.328,68.328,0,0,0,172.7939409814042,171.66619553688662L196.18515794026962,179.48692857051515A92.992,92.992,0,0,1,107.992,242.99200000000002Z"
											stroke-width="3"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
										<path fill="none" stroke="#f56954"
											d="M169.94875565556106,170.7149224627346A65.328,65.328,0,0,0,49.41758994238674,121.0727451976069"
											stroke-width="2" opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1;"></path>
										<path fill="#f56954" stroke="#ffffff"
											d="M172.7939409814042,171.66619553688662A68.328,68.328,0,0,0,46.72772908375277,119.7443444443743L20.1303849135801,106.60911779641036A97.992,97.992,0,0,1,200.92713348334155,181.07238369410186Z"
											stroke-width="3"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
										<path fill="none" stroke="#00a65a"
											d="M49.41758994238674,121.0727451976069A65.328,65.328,0,0,0,107.97147660385023,215.32799677619244"
											stroke-width="2" opacity="0"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path>
										<path fill="#00a65a" stroke="#ffffff"
											d="M46.72772908375277,119.7443444443743A68.328,68.328,0,0,0,107.97053412606967,218.32799662814838L107.96278570207632,242.99199541102877A92.992,92.992,0,0,1,24.613486344636712,108.82311905179803Z"
											stroke-width="3"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
										<text x="107.992" y="140" text-anchor="middle"
											font-family="&quot;Arial&quot;" font-size="15px"
											stroke="none" fill="#000000"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 15px; font-weight: 800;"
											font-weight="800"
											transform="matrix(1.0204,0,0,1.0204,-2.2076,-3.0873)"
											stroke-width="0.979964138228971">
										<tspan dy="6"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">In-Store Sales</tspan></text>
										<text x="107.992" y="160" text-anchor="middle"
											font-family="&quot;Arial&quot;" font-size="14px"
											stroke="none" fill="#000000"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 14px;"
											transform="matrix(1.361,0,0,1.361,-39.0218,-54.872)"
											stroke-width="0.7347538574577517">
										<tspan dy="5"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">30</tspan></text></svg>
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

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="sales-chart2"
									style="height: 300px; position: relative;">
									<svg height="300" version="1.1" width="349"
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink"
										style="overflow: hidden; position: relative;">
										<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc>
										<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
										<path fill="none" stroke="#3c8dbc"
											d="M174.5,243.33333333333331A93.33333333333333,93.33333333333333,0,0,0,262.7277551949771,180.44625304313007"
											stroke-width="2" opacity="0"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path>
										<path fill="#3c8dbc" stroke="#ffffff"
											d="M174.5,246.33333333333331A96.33333333333333,96.33333333333333,0,0,0,265.56364732624417,181.4248826052307L302.1151459070204,194.03833029452744A135,135,0,0,1,174.5,285Z"
											stroke-width="3"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
										<path fill="none" stroke="#f56954"
											d="M262.7277551949771,180.44625304313007A93.33333333333333,93.33333333333333,0,0,0,90.78484627831412,108.73398312817662"
											stroke-width="2" opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1;"></path>
										<path fill="#f56954" stroke="#ffffff"
											d="M265.56364732624417,181.4248826052307A96.33333333333333,96.33333333333333,0,0,0,88.09400205154564,107.40757544301087L48.927269417471166,88.10097469226493A140,140,0,0,1,306.8416327924656,195.6693795646951Z"
											stroke-width="3"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
										<path fill="none" stroke="#00a65a"
											d="M90.78484627831412,108.73398312817662A93.33333333333333,93.33333333333333,0,0,0,174.47067846904883,243.333328727518"
											stroke-width="2" opacity="0"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path>
										<path fill="#00a65a" stroke="#ffffff"
											d="M88.09400205154564,107.40757544301087A96.33333333333333,96.33333333333333,0,0,0,174.46973599126827,246.3333285794739L174.4575884998742,284.9999933380171A135,135,0,0,1,53.412009795418626,90.31165416754118Z"
											stroke-width="3"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
										<text x="174.5" y="140" text-anchor="middle"
											font-family="&quot;Arial&quot;" font-size="15px"
											stroke="none" fill="#000000"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 15px; font-weight: 800;"
											font-weight="800"
											transform="matrix(1.4579,0,0,1.4579,-79.8997,-69.1426)"
											stroke-width="0.6859188988095237">
										<tspan dy="6"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">In-Store Sales</tspan></text>
										<text x="174.5" y="160" text-anchor="middle"
											font-family="&quot;Arial&quot;" font-size="14px"
											stroke="none" fill="#000000"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 14px;"
											transform="matrix(1.9444,0,0,1.9444,-164.8941,-143.5556)"
											stroke-width="0.5142857142857143">
										<tspan dy="5"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">30</tspan></text></svg>
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

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="sales-chart3"
									style="height: 300px; position: relative;">
									<svg height="300" version="1.1" width="349"
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink"
										style="overflow: hidden; position: relative;">
										<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc>
										<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
										<path fill="none" stroke="#3c8dbc"
											d="M174.5,243.33333333333331A93.33333333333333,93.33333333333333,0,0,0,262.7277551949771,180.44625304313007"
											stroke-width="2" opacity="0"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path>
										<path fill="#3c8dbc" stroke="#ffffff"
											d="M174.5,246.33333333333331A96.33333333333333,96.33333333333333,0,0,0,265.56364732624417,181.4248826052307L302.1151459070204,194.03833029452744A135,135,0,0,1,174.5,285Z"
											stroke-width="3"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
										<path fill="none" stroke="#f56954"
											d="M262.7277551949771,180.44625304313007A93.33333333333333,93.33333333333333,0,0,0,90.78484627831412,108.73398312817662"
											stroke-width="2" opacity="1"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1;"></path>
										<path fill="#f56954" stroke="#ffffff"
											d="M265.56364732624417,181.4248826052307A96.33333333333333,96.33333333333333,0,0,0,88.09400205154564,107.40757544301087L48.927269417471166,88.10097469226493A140,140,0,0,1,306.8416327924656,195.6693795646951Z"
											stroke-width="3"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
										<path fill="none" stroke="#00a65a"
											d="M90.78484627831412,108.73398312817662A93.33333333333333,93.33333333333333,0,0,0,174.47067846904883,243.333328727518"
											stroke-width="2" opacity="0"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path>
										<path fill="#00a65a" stroke="#ffffff"
											d="M88.09400205154564,107.40757544301087A96.33333333333333,96.33333333333333,0,0,0,174.46973599126827,246.3333285794739L174.4575884998742,284.9999933380171A135,135,0,0,1,53.412009795418626,90.31165416754118Z"
											stroke-width="3"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
										<text x="174.5" y="140" text-anchor="middle"
											font-family="&quot;Arial&quot;" font-size="15px"
											stroke="none" fill="#000000"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 15px; font-weight: 800;"
											font-weight="800"
											transform="matrix(1.4579,0,0,1.4579,-79.8997,-69.1426)"
											stroke-width="0.6859188988095237">
										<tspan dy="6"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">In-Store Sales</tspan></text>
										<text x="174.5" y="160" text-anchor="middle"
											font-family="&quot;Arial&quot;" font-size="14px"
											stroke="none" fill="#000000"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 14px;"
											transform="matrix(1.9444,0,0,1.9444,-164.8941,-143.5556)"
											stroke-width="0.5142857142857143">
										<tspan dy="5"
											style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">30</tspan></text></svg>
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
	<script src="dashboard/bower_components/jquery-ui/jquery-ui.min.js"></script>
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
	<script
		src="dashboard/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script
		src="dashboard/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="dashboard/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- jQuery Knob Chart -->
	<script
		src="dashboard/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="dashboard/bower_components/moment/min/moment.min.js"></script>
	<script
		src="dashboard/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- datepicker -->
	<script
		src="dashboard/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script
		src="dashboard/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<!-- Slimscroll -->
	<script
		src="dashboard/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="dashboard/bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="dashboard/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="dashboard/dist/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->

	<script>
		var dayreportjson = {}
		var totalConsumption = {}
		var dateJSON={"FirstMonth":{from:" ",to:" "},"SecondMonth":{from:" ",to:" "},"ThiredMonth":{from:" ",to:" "}};

		var monthconsumtion = {"FirstMonth":'',"SecondMonth":'',"ThiredMonth":''}
		
//{ devId : '1200000000002345',fromDate : '11/20/2018 12:12 PM', toDate:'11/22/2018 12:12 PM',type: 'days'}
		
		function lastFirstmonthdonut(){
			console.log(monthconsumtion.FirstMonth)
			var donut = new Morris.Donut({
				element : 'sales-chart1',
				resize : true,
				colors : [ '#F58C1F', '#64B246', '#91191C', '#F58C1F',
					'#64B246', '#91191C', '#F58C1F', '#64B246', '#91191C' ],
				data :monthconsumtion.FirstMonth,
				hideHover : 'auto'
			});
			
		}

		function lastSecondmonthdonut(){
			console.log(monthconsumtion.SecondMonth)
			var donut = new Morris.Donut({
				element : 'sales-chart2',
				resize : true,
				colors : [ '#F58C1F', '#64B246', '#91191C', '#F58C1F',
					'#64B246', '#91191C', '#F58C1F', '#64B246', '#91191C' ],
				data :monthconsumtion.SecondMonth,
				hideHover : 'auto'
			});
			
		}

		function lastThirdmonthdonut(){
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
			var devicedataref = {label:device.split("->")[1],value:tempconsumtion}
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
	
	console.log(monthconsumtion);

	
 	
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


$(function() {
	getcurrebtDaysReport();
	getMonthDates();
	createdonotjson();
	lastFirstmonthdonut()
	lastSecondmonthdonut()
	lastThirdmonthdonut()
});


		
		
function getLineColors(){
			var staticlineColors = [ '#F58C1F', '#64B246', '#91191C', '#F58C1F',
				'#64B246', '#91191C', '#F58C1F', '#64B246', '#91191C' ]
			
			return staticlineColors[Math.floor(Math.random() * 3)]
		
		}
		
		function getBoxColor(){
			
			var totalBoxClasses = ['bg-green','bg-yellow','bg-red','bg-blue','bg-orange']
			return totalBoxClasses[Math.floor(Math.random() * 3)]
			
		}
		
		function getcurrebtDaysReport() {

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
					
					console.log(totalConsumption)
					
					plotTotalConsuption()

				},
				error : function(e) {
					alert('Error: ' + e);
				}

			});

		}

		function plotTotalConsuption() {
			
			
			var refdiv = document.getElementById('refTotal')

			var devicesCount = Object.keys(totalConsumption).length;
			
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
 
				innerval.getElementsByTagName("p")[0].innerHTML = i;
				
				innerval.getElementsByTagName("div")[0].setAttribute("class","small-box");
				innerval.getElementsByTagName("div")[0].classList.add(getBoxColor())
				

				innerval.getElementsByTagName("h3")[0].innerHTML = totalConsumption[i] + " <small>Ltrs</small>";
				document.getElementById('totalConsumption').appendChild(
						innerval);

			}

		}

		function plotdayChart() {

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
		
		
		$(function() {
			"use strict";
			
			
			
		

			

			var bar = new Morris.Bar({
				element : 'bar-chart',
				resize : true,
				data : [ {
					y : 'January',
					a : 100,
					b : 90,
					c : 100
				}, {
					y : 'February',
					a : 75,
					b : 65,
					c : 30
				}, {
					y : 'March',
					a : 50,
					b : 40,
					c : 20
				}, {
					y : 'April',
					a : 50,
					b : 40,
					c : 20
				}, {
					y : 'May',
					a : 75,
					b : 65,
					c : 140
				}

				],
				barColors : [ '#F58C1F', '#64B246', '#91191C' ],
				xkey : 'y',
				ykeys : [ 'a', 'b', 'c' ],
				labels : [ 'CPU', 'DISK', 'TEST' ],
				hideHover : 'auto'
			});
		});
	</script>

</body>
</html>
