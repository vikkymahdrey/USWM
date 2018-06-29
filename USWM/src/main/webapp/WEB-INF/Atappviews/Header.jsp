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
	    

	    <!-- Header Navbar: style can be found in header.less -->
	    <nav class="navbar navbar-static-top affix" >
	      <!-- Sidebar toggle button-->
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
          <a href="home">
            <i class="fa fa-dashboard"></i> <span><b>Dashboard</b></span>
          </a>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-bolt"></i>
            <span><b>Settings</b></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          
          
          <ul class="treeview-menu">
            <li><a href="aplConfig"><i class="fa fa-circle-o"></i><b>APL config</b></a></li>
           
          </ul>
           
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-arrow-right"></i>
            <span><b>User Mgmt</b></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          
          
          <ul class="treeview-menu">
            <li><a href="userMgmt"><i class="fa fa-user-circle-o"></i><b>User Config</b></a></li>
           
          </ul>
          
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-arrow-right"></i>
            <span><b>Device Config</b></span>
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
        
        <li class="treeview"> 
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span><b>Charts</b></span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right">3</span>
            </span>
          </a>
          <ul class="treeview-menu">
            <!-- <li><a href="userInfoHistory"><i class="fa fa-circle-o"></i><b>Admin User</b></a></li> -->
            <li><a href="chartsMap"><i class="fa fa-circle-o"></i> <b>Chart-Map</b></a></li>
             <li><a href="#"><i class="fa fa-circle-o"></i> <b>Bar-Pi</b></a></li>
             <li><a href="#"><i class="fa fa-circle-o"></i> <b>Flot</b></a></li>
             <li><a href="#"><i class="fa fa-circle-o"></i> <b>Inline</b></a></li>
          </ul>
          
             
        </li>
        
         <li class="treeview">
          <a href="#">
            <i class="fa fa-arrow-right"></i>
            <span><b>Reports</b></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          
          
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i><b>Water Consumption</b></a></li>
             <li><a href="#"><i class="fa fa-circle-o"></i><b>User</b></a></li>
           
          </ul>
          
        </li>
        
        
        <li class="treeview"> 
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span><b>Logs</b></span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right">3</span>
            </span>
          </a>
          <ul class="treeview-menu">
            <!-- <li><a href="userInfoHistory"><i class="fa fa-circle-o"></i><b>Admin User</b></a></li> -->
            <li><a href="frameInfos"><i class="fa fa-circle-o"></i> <b>Uplink Log</b></a></li>
             <li><a href="downlinkQueue"><i class="fa fa-circle-o"></i> <b>Downlink Log</b></a></li>
          </ul>
          
             
        </li>
        
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-arrow-right"></i>
            <span><b>Sync</b></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="sync"><i class="fa fa-circle-o"></i><b>Node Sync</b></a></li>
           
          </ul>
        </li>
         <li class="treeview">
          <a href="logout">
            <i class="fa fa-sign-out"></i> <span><b>Sign-Out</b></span>
           
          </a>
        </li>
        
      
      </ul>
    </section>
  
  </aside>