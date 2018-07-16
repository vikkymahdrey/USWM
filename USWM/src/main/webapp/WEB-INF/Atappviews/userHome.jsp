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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Chart</title>
     
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/marquees.css" rel="stylesheet">   
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="css/jvectormap/jquery-jvectormap-1.2.2.css">
  <link rel="stylesheet" href="css/AdminLTE.min.css">
  <link rel="stylesheet" href="css/AdminLTE.css">
  <link rel="stylesheet" href="css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="css/skins/skin-blue.min.css">
  <link rel="stylesheet" href="css/map.css">
  
  
	

	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script type="text/javascript" src="js/jquery-latest.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>       
	<script type="text/javascript" src="js/scroller.js"></script>  	 
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
 	<script src="bootstrap/js/bootstrap.min.js"></script>
 	<script src="plugins/fastclick/fastclick.js"></script>
 	<script src="js/app.min.js"></script>
 	<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
 	<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
 	<script src="plugins/jvectormap/jquery-jvectormap-in-mill.js"></script>
 	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
 	<script src="plugins/chartjs/Chart.min.js"></script>
 	<script src="js/demo.js"></script>
 	<script src="plugins/knob/jquery.knob.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC9Qem9w4qe_9EqmMXJql00Qvkv1yB9wcU&sensor=false" type="text/javascript"></script>
 	
 	
  <script type="text/javascript">
  $(function () {
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
	 
  
  /*Calling for graph*/
  function loadScript() {
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
                              text: 'PayOff Curve'
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
      }
  
 	 
 </script> 
   
  
     
  </head>
  
  <body class="hold-transition skin-blue sidebar-mini" onload="loadScript()">
    			
							 
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
		 		
						 
		 		
		 			<div class="row">
						<div class="col-md-12">
							<div class="box box-success">
								<div class="box-header with-border">
								<i class="fa fa-area-chart"></i>
									<h3 class="box-title">
										<b>Water consumption in litres</b>
									</h3>

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
			                   
			                  <iframe  style="float: right; width: 100%" height="300px" src="marklandmarkUserDash?orgId=6" ></iframe>
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