  <header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo">
   
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b> <img src="dashboard/dist/img/logo.png" class="user-image" alt="User Image" height="35" width="35"> <span style="font-family:Gabriola;font-size:25px">Easy Count</span></b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
         
          <!-- Notifications: style can be found in dropdown.less -->
        
          <!-- Tasks: style can be found in dropdown.less -->
         
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dashboard/dist/img/logo.png" class="user-image" alt="User Image">
              <span class="hidden-xs">Alexander Pierce</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dashboard/dist/img/logo.png" class="img-circle" alt="User Image">

                <p>
                  Alexander Pierce - Web Developer
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
             
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat" data-toggle="modal" data-target="#modal-info1">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="logout" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
         
        </ul>
      </div>
    </nav>
  </header>
  
  
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
     
      <!-- search form -->
      
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        
        <li>
          <a href="userDashBoard">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
            <span class="pull-right-container">
             <!--  <small class="label pull-right bg-green">new</small> -->
            </span>
          </a>
        </li>
        <li>
          <a href="invoice">
           <i class="fa fa-credit-card-alt"></i>  <span>Invoice</span>
            <span class="pull-right-container">
             <!--  <small class="label pull-right bg-green">new</small> -->
            </span>
          </a>
        </li>
        <li>
          <a href="issue">
           <i class="fa fa-sign-out"></i>  <span>Issue Report</span>
            <span class="pull-right-container">
             <!--  <small class="label pull-right bg-green">new</small> -->
            </span>
          </a>
        </li>
       <li>
          <a href="logout">
            <i class="fa fa-sign-out"></i> <span>Sign Out</span>
            <span class="pull-right-container">
             <!--  <small class="label pull-right bg-green">new</small> -->
            </span>
          </a>
        </li>
       
      </ul>
    </section>
    <!-- user details edit  model -->
    
    <!-- /.sidebar -->
  </aside>
  <div class="modal modal-info fade in" id="modal-info1" style="display:none;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">�</span></button>
                <h4 class="modal-title">Edit User Deails </h4>
              </div>
              <div class="modal-body">
                
                <form>
                <div class="form-group">
                  <label>User Name</label>
                  
                </div>
                
                <div class="form-group">
                  <label>Phone Number</label>
                  
                </div>
                
                <div class="form-group">
                  <label>Email</label>
                  
                </div>
                 </form>
              </div>
              
              <div class="modal-footer">
                <input type="submit" class="btn btn-outline" value="Submit">
              </div>
              
             
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>