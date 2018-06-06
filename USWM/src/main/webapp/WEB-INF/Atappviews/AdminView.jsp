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
    
    <title>Admin Home</title>
    
	<script type="text/javascript" src="js/jquery-latest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
	  <link href="css/bootstrap.min.css" rel="stylesheet">
	  <link href="css/custom_siemens.css" rel="stylesheet">
	   <link href="css/marquees.css" rel="stylesheet">
	       
    
   
	  <!-- Font Awesome -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	  <!-- Ionicons -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	  <link rel="stylesheet" href="css/AdminLTE.min.css">
	  <link rel="stylesheet" href="css/AdminLTE.css">
	  <link rel="stylesheet" href="css/skins/_all-skins.min.css">
	 

	<script src="js/app.min.js"></script>
	<script src="js/demo.js"></script>
	
<!-- Pie Charts... -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
    
      
  </head>
  
  <body class="hold-transition skin-blue sidebar-mini">
  
  			<% AdminUser adminUser=(AdminUser)request.getSession().getAttribute("adminUser");
  			   List<TblUserInfo> userInfos=(List<TblUserInfo>)request.getAttribute("userInfos");
  			%>
  			
							 
  <div class="wrapper">  
 
  	 <header class="main-header" >
   
	    <a href="#" class="logo affix">
			    <svg width="135px" height="50px" >
						  <defs>
						    <filter id="MyFilter" filterUnits="userSpaceOnUse" x="50" y="50" width="200" height="120">
						        <feGaussianBlur in="SourceGraphic" stdDeviation="15" />
						      <feOffset result="offOut" in="SourceAlpha" dx="60" dy="60" />
						    
						    </filter>
						  </defs>
						  <text stroke-width="3.5"  stroke="white" font-size="26" font-family="Verdana" x="0" y="40">USWM</text>
						  
						  Sorry, your browser does not support inline SVG.
				</svg>
		</a> 
	    

	    Header Navbar: style can be found in header.less
	    <nav class="navbar navbar-static-top affix" >
	      Sidebar toggle button
	      <a href="#" class="sidebar-toggle" style="width:2.5em;" data-toggle="offcanvas" role="button">
	      </a> 
	    </nav>
	    
   </header> 
  
  
  <aside class="main-sidebar" style="position:fixed;">
   
    <section class="sidebar">
        
      <!-- search form -->
      <!-- <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form> -->
     
      
      <ul class="sidebar-menu">
        <li class="header"><b>MAIN NAVIGATION</b></li>
        <li class="active treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span><b>Dashboard</b></span>
          </a>
        </li>
        <li class="treeview"> 
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span><b>Uplink/Downlink Logs</b></span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right">3</span>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="userInfoHistory"><i class="fa fa-circle-o"></i><b>Admin User</b></a></li>
            <li><a href="frameInfos"><i class="fa fa-circle-o"></i> <b>Uplink Log</b></a></li>
             <li><a href="downlinkQueue"><i class="fa fa-circle-o"></i> <b>Downlink Log</b></a></li>
          </ul>
          
             
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-arrow-right"></i>
            <span><b>LoRa Node Sync</b></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="sync"><i class="fa fa-circle-o"></i><b>Sync</b></a></li>
           
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-arrow-right"></i>
            <span><b>LoRa Node Config</b></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="deleteNode"><i class="fa fa-circle-o"></i><b>Delete Node</b></a></li>
           
          </ul>
           <ul class="treeview-menu">
            <li><a href="delDevEUI"><i class="fa fa-circle-o"></i><b>Delete DevEUI</b></a></li>
           
          </ul>
        </li>
       <!--  <li class="treeview">
          <a href="#">
            <i class="fa fa-music"></i>
            <span><b>Activity Management</b></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i><b> User Management</b></a></li>
           
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-download"></i>
            <span><b>Log Handling</b></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="userInfoHistory"><i class="fa fa-circle-o"></i><b> Logs</b></a></li>
           
          </ul>
     
        </li> -->
        
                
      </ul>
    </section>
  
  </aside>
 
	<div class="content-wrapper">
		
			<section class="content">
		 		<div class="content-wrap box box-primary">
		 		
					
		 		<div class="row">
							<div class="col-sm-12 text-right">
								<img src="images/user_iocn_header.png" />&nbsp;<b>Welcome  <%=adminUser.getDisplayname()%></b>  &nbsp;&nbsp;&nbsp;<a href="logout"><img src="images/logout_icon_header.png" />&nbsp;<b>Log Out</b></a>
							</div>
					
				</div>
		 		
		 		<div class="box-header with-border">
  					  <h5 class="text-blue text-left "><span class="fa fa-dashboard"></span>&nbsp;&nbsp;<b>Dashboard</b></h5>
       
   				</div><!-- /.box-header -->
		 							
   						
   						
   						<div class="row">
   							<div class="info-box col-sm-4 mar-top-15" >
							  <!-- Apply any bg-* class to to the icon to color it -->
							  	<span class="info-box-icon bg-blue"><i class="fa fa-user"></i></span>
							  	<div class="info-box-content">
								    <span class="info-box-text">Admin Users</span>
								    <%if(userInfos!=null && !userInfos.isEmpty()){ %>
								    <span class="info-box-number"><b><%=userInfos.get(0)%></b></span>
								    <%}%>
							 	</div><!-- /.info-box-content -->
							 </div><!-- /.info-box -->
						  							
						</div>
										
						</div>	
			</section>	
			<%@include file="Footer.jsp"%>  		
	</div>	
	</div>
			
  </body>
</html>