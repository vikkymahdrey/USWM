<%--
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
    
    <title>Pay Bills</title>
    
	<script type="text/javascript" src="js/jquery-latest.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	  <link href="css/style.css" rel="stylesheet" type="text/css" />
	 

	<script src="js/app.min.js"></script>
	<script src="js/demo.js"></script>
	

     
  </head>
  
  <body class="hold-transition skin-blue sidebar-mini">
  							 
  <div class="wrapper">  
  	<%@include file="Header.jsp"%>  
 
	<div class="content-wrapper">
		
			<section class="content">
		 		<div class="content-wrap box box-primary">
		 		
					
		 		<div class="row">
							<div class="col-sm-12 text-right">
								<img src="images/user_iocn_header.png" />&nbsp;<b>Welcome <%=userSession.getUname()%></b> <a href="logout"><img src="images/logout_icon_header.png" /><b>Log Out</b></a>
							</div>
					
				</div>
		 		
		 		<div class="box-header with-border">
  					  <h5 class="text-blue text-left "><span class="fa fa-paypal"></span><b>Pay Bills</b></h5>
       
   				</div><!-- /.box-header -->
		 							
		 					<div class="row">
									<div class="col-sm-12 text-center">
									<%String message="";
						
										try{
											message=request.getParameter("message");
											if(message!=null&&!message.equals("")){
												
											}else{						
													message = "";
													message = request.getAttribute("status").toString();
													session.setAttribute("status", "");
											}
				
										}catch(Exception e)
										{
											;
										}	%>
				 						<span style="color: red;" ><%=message %></span>	
				 									
		   						</div>
		   				  </div>		
   						
   						  <div class="row" >
    				    	<div class="col-sm-12">	
    				    	
    				    	<form name="form1" action="payBillForm" onsubmit="return confirmValidate();" method="post">
									<input type="hidden" name="key" value="fVDT76Br" />
									<input type="hidden" name="hash_string" value="bXLTj6Bxl0" />
            						<input type="hidden" name="hash" />
							        <input type="hidden" name="txnid"/>	
							        
								  <table class="table">
										      
						                <tr>
						                    <td><b>Mandatory Parameters</b></td>
						                </tr>
						                <tr>
						                    <td>Amount: </td>
						                    <td><input name="amount"  /></td>
						                    <td>First Name: </td>
						                    <td><input name="firstname" id="firstname"  /></td>
						                </tr>
						                <tr>
						                    <td>Email: </td>
						                    <td><input name="email" id="email"   /></td>
						                    <td>Phone: </td>
						                    <td><input name="phone"  /></td>
						                </tr>
						                <tr>
						                    <td>Product Info: </td>
						                    <td colspan="3"><textarea name="productinfo" >  </textarea></td>
						                </tr>
						                <tr>
						                    <td>Success URI: </td>
						                    <td colspan="3"><input name="surl"  size="64"  /></td>
				               			 </tr>
						                <tr>
						                    <td>Failure URI: </td>
						                    <td colspan="3"><input name="furl"  size="64" /></td>
						                </tr>
				
						                <tr>
						                    <td colspan="3"><input type="hidden" name="service_provider" value="payu_paisa" /></td>
						                </tr>
						                <tr>
						                    <td><b>Optional Parameters</b></td>
						                </tr>
						                <tr>
						                    <td>Last Name: </td>
						                    <td><input name="lastname" id="lastname"  /></td>
						                    <td>Cancel URI: </td>
						                    <td><input name="curl" value="" /></td>
						                </tr>
						                <tr>
						                    <td>Address1: </td>
						                    <td><input name="address1" /></td>
						                    <td>Address2: </td>
						                    <td><input name="address2"  /></td>
						                </tr>
						                <tr>
						                    <td>City: </td>
						                    <td><input name="city"  /></td>
						                    <td>State: </td>
						                    <td><input name="state"  /></td>
						                </tr>
						                <tr>
						                    <td>Country: </td>
						                    <td><input name="country"  /></td>
						                    <td>Zipcode: </td>
						                    <td><input name="zipcode"  /></td>
						                </tr>
						                <tr>
						                    <td>UDF1: </td>
						                    <td><input name="udf1"  /></td>
						                    <td>UDF2: </td>
						                    <td><input name="udf2"  /></td>
						                </tr>
						                <tr>
						                    <td>UDF3: </td>
						                    <td><input name="udf3"   /></td>
						                    <td>UDF4: </td>
						                    <td><input name="udf4"  /></td>
						                </tr>
						                <tr>
						                    <td>UDF5: </td>
						                    <td><input name="udf5"  /></td>
						                    <td>PG: </td>
						                    <td><input name="pg"  /></td>
						                </tr>
										<tr>
				                			<td colspan="4" align="center"><input type="submit" value="Submit" class="formbutton" style="background-color:#3c8dbc;" /></td>
				                        </tr>
									
									</table>	
								</form> 
							</div>	
					   </div>
										
					</div>	
			</section>	
			<%@include file="Footer.jsp"%>  		
	</div>	
	</div>
			
  </body>
</html>