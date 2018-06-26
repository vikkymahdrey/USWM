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
    
	<script type="text/javascript" src="js/jquery-latest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
	  <link href="css/bootstrap.min.css" rel="stylesheet">
	  <link href="css/custom_siemens.css" rel="stylesheet">
	   <link href="css/marquees.css" rel="stylesheet">
	       
    
   	 <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="css/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="css/AdminLTE.min.css">
  <link rel="stylesheet" href="css/AdminLTE.css">
  <link rel="stylesheet" href="css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="css/skins/skin-blue.min.css">
	
<!-- Pie Charts... -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
    
   
   <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
   <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
   
      
   <script type="text/javascript" src="js/scroller.js"></script>
  
  <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script> -->
   
 	  <!-- jQuery 2.2.3 -->
 	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
 	<!-- Bootstrap 3.3.6 -->
 	<script src="bootstrap/js/bootstrap.min.js"></script>
 	<!-- FastClick -->
 	<script src="plugins/fastclick/fastclick.js"></script>
 	<!-- AdminLTE App -->
 	<script src="js/app.min.js"></script>
 	<!-- Sparkline -->
 	<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
 	<!-- jvectormap -->
 	<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
 	<script src="plugins/jvectormap/jquery-jvectormap-in-mill.js"></script>
 	<!-- SlimScroll 1.3.0 -->
 	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
 	<!-- ChartJS 1.0.1 -->
 	<script src="plugins/chartjs/Chart.min.js"></script>
 	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
 	<script src="js/pages/dashboard2.js"></script>
 	<!-- AdminLTE for demo purposes -->
 	<script src="js/demo.js"></script>
 	
 	
 	<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC9Qem9w4qe_9EqmMXJql00Qvkv1yB9wcU&sensor=false" type="text/javascript"></script>
 	
 	
  <script type="text/javascript">
 	 		/* $(document).ready(function() {
 			 $.ajax({
 				type : "GET",
 				url : "dashboard"
 				}).done(function(result) {
 					var retdata= result;
 					alert(retdata);
 				});
 			
 			});  */
 		
 		// *
 		// * Add multiple markers
 		// * 2013 - en.marnoto.com
 		// *

 		// necessary variables
 		var map;
 		var infoWindow;

 		// markersData variable stores the information necessary to each marker
 		var markersData = [
 		   {
 		      lat: 12.9248123,
 		      lng: 77.6358834,
 		      name: "Arpita Apt",
 		      address1:"Koramangala 1st Block",
 		      address2: "Bajaj Allianz life insurance",
 		      postalCode: "560095" // don't insert comma in the last item of each marker
 		   },
 		   {
 		      lat: 12.9250136,
 		      lng: 77.6366867,
 		      name: "Arpita Apt",
 		      address1:"Koramangala 1st Block",
 		      address2: "Sri Kateramma Temple",
 		      postalCode: "560095" // don't insert comma in the last item of each marker
 		   }
 		  
 		];


 		function initialize() {
 		   var mapOptions = {
 		      center: new google.maps.LatLng(12.9248123,77.6358834),
 		      zoom: 9,
 		      mapTypeId: 'roadmap',
 		   };

 		   map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
 		   
 		   // a new Info Window is created
 		   infoWindow = new google.maps.InfoWindow();

 		   // Event that closes the Info Window with a click on the map
 		   google.maps.event.addListener(map, 'click', function() {
 		      infoWindow.close();
 		   });

 		   // Finally displayMarkers() function is called to begin the markers creation
 		   displayMarkers();
 		}
 		google.maps.event.addDomListener(window, 'load', initialize);


 		// This function will iterate over markersData array
 		// creating markers with createMarker function
 		function displayMarkers(){

 		   // this variable sets the map bounds according to markers position
 		   var bounds = new google.maps.LatLngBounds();
 		   
 		   // for loop traverses markersData array calling createMarker function for each marker 
 		   for (var i = 0; i < markersData.length; i++){

 		      var latlng = new google.maps.LatLng(markersData[i].lat, markersData[i].lng);
 		      var name = markersData[i].name;
 		      var address1 = markersData[i].address1;
 		      var address2 = markersData[i].address2;
 		      var postalCode = markersData[i].postalCode;

 		      createMarker(latlng, name, address1, address2, postalCode);

 		      // marker position is added to bounds variable
 		      bounds.extend(latlng);  
 		   }

 		   // Finally the bounds variable is used to set the map bounds
 		   // with fitBounds() function
 		   map.fitBounds(bounds);
 		}

 		// This function creates each marker and it sets their Info Window content
 		function createMarker(latlng, name, address1, address2, postalCode){
 		   var marker = new google.maps.Marker({
 		      map: map,
 		      position: latlng,
 		      title: name
 		   });

 		   // This event expects a click on a marker
 		   // When this event is fired the Info Window content is created
 		   // and the Info Window is opened.
 		   google.maps.event.addListener(marker, 'click', function() {
 		      
 		      // Creating the content to be inserted in the infowindow
 		      var iwContent = '<div id="iw_container">' +
 		            '<b><div class="iw_title">' + name + '</div></b>' +
 		         '<b><div class="iw_content">' + address1 + '<br />' +
 		         address2 + '<br />' +
 		         postalCode + '</div></b></div>';
 		      
 		      // including content to the Info Window.
 		      infoWindow.setContent(iwContent);

 		      // opening the Info Window in the current map and at the current marker location.
 		      infoWindow.open(map, marker);
 		   });
 		}	
 		
 	
 	 
 </script> 
   
  
     
  </head>
  
  <body class="hold-transition skin-blue sidebar-mini">
  
  			<% TblUserInfo userSession = (TblUserInfo) request.getSession().getAttribute("user");
	            if (userSession == null){
	                response.sendRedirect("/");
	            }
  			
  			
  			%>
  			
							 
  <div class="wrapper">  
  	
 <%@include file="Header.jsp"%>  
 
	<div class="content-wrapper">
		
			<section class="content">
		 		<div class="content-wrap box box-primary">
		 			<div class="row">
				        <div class="col-md-12">
				          <div class="box">
				            <div class="box-header with-border">
								<h3 class="box-title"><b>Water Consumption graph</b></h3>
				
								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
								</div>
				            </div>
				            <!-- /.box-header -->
				            <div class="box-body">
				              <div class="row">
				                <div class="col-md-12">
				                  <p class="text-left">
				                    <strong>Water consumption in Litres</strong>
				                  </p>
								   
				
				                  <div class="chart">
				                    <!-- Sales Chart Canvas -->
				                    <canvas id="salesChart" style="height: 180px;"></canvas>
									<p class="text-right">
				                    <strong>X-axis Date</strong><br/>
				                    <strong>Y-axis water units</strong><br/> 
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
			                   <div id="map-canvas" style="height: 300px;"></div> 
			                    <!-- <div id="world-map-markers" style="height: 300px;"></div> -->
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