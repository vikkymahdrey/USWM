<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Exception Page</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="css/blue.css">
  <link rel="stylesheet" href="css/style.css">
    
	  <!-- jQuery 2.2.3 -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="plugins/iCheck/icheck.min.js"></script>
	
	<%String statusLog=(String)request.getAttribute("statusLog");%>
	<script>
	  $(function () {
	    $('input').iCheck({
	      checkboxClass: 'icheckbox_square-blue',
	      radioClass: 'iradio_square-blue',
	      increaseArea: '20%' // optional
	    });
	  });
	</script>
	
	<script  type="text/javascript">	
		 function loadScript(){		 
			 var stsLog='<%=statusLog%>';		
			 if(stsLog!='null'){			 
				$("#loginAudit").modal(); 
			 }
			 
		 }
 
	
</script>
   
	
	
</head>
<body class="hold-transition login-page" onload="loadScript()">
		<%String log=(String)request.getAttribute("statusLog");
			String url=(String)request.getAttribute("url");
				String exception=(String)request.getAttribute("exception");%>	

	<div class="wrapper">  
	 	 <div class="content-wrapper">	
				<section class="content">
			 		<div class="content-wrap box box-primary">	
									<!-- Modal -->
                                      <div class="modal fade" id="loginAudit" role="dialog">
                                      	<div class="modal-dialog ">    
                                      		<!-- Modal content-->
                                      		<div class="modal-content">
                                      			<div class="modal-header" style="padding:15px 30px;">
                                      				<button type="button" class="close" data-dismiss="modal">&times;</button>
                                      				<h4><span class="fa fa-history"></span> Exception Audit Log </h4>
                                      			</div>
                                      			
                                      			<div class="modal-body" style="padding:40px 50px;">
        		                                      <div class="row" style="overflow-y: auto;">		                                      			
															<div class="col-sm-12 ">
																	<table class="table table-striped">
																	    <thead>
																	      <tr>
																	        <th>URL</th>
																	        <th>Exception_Message</th>																	      											        
																	      </tr>
																	    </thead>
																	    <tbody>	
																	    <tr>
																	    <%if(log!=null){%>																	    	
																	   
																		    <td>
																		    	<%=url %>
																		    </td>
																		    
																		     <td>
																		      	<%=exception %>
																		    </td>
																		  <% }%>  
																	    </tr>												 
																	    </tbody>
																	</table>
															
														   </div>
														</div>
					  								
							                   </div>
						
									  
					     					  <div class="modal-footer">
                         						<button type="submit" class="btn-default pull-right" data-dismiss="modal"> Cancel</button>
                         					  </div>
                         					  	  
				      					  </div><!-- content close here -->
			                           </div><!-- modal dialog close here -->					             			              
					               </div><!-- modal close here -->		
					</div>	
				</section>	
				<%@include file="Footer.jsp"%>  		
		</div>	
	</div>

</body>
</html>
