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
    
    <title>User Config</title>
    
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
	
<!-- Pie Charts... -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
    
   <script type="text/javascript">
   
   function confirmValidate(){
	   
	   var orgid=document.getElementById("orgid").value;
 	  	var appid=document.getElementById("appid").value;
 	  	var devid=document.getElementById("devid").value;
 	  	var usertype=document.getElementById("usertype").value;
 		
	   	   
	   if(orgid=="0"){
		   alert("Please select organisation!");
		   return false;
	   }else if(appid=="0"){
		   alert("Please select application!");
		   return false;
	   }else if(devid=="0"){
		   alert("Please select devEUI!");
		   return false;
	   }else if ($("input[name=uname]").val() == "") {
			alert("Please specify LoginId");
			return false;
	   }else if ($("input[name=email]").val() == "") {
			alert("Please specify EmailAddress");
			return false;
	   }else if (isNaN($("input[name=contact]").val())
				|| ($("input[name=contact]").val()).length != 10) {
			alert("Please specify 10 digit contact number");
			return false;
	   }else if(usertype == "0") {
			alert("Please select usertype");
			return false;
	   }else if ($("input[name=area]").val() == "") {
			alert("Please select area");
			return false;
	   }else if ($("input[name=place]").val() == "") {
			alert("Please select place");
			return false;
	   }else if ($("input[name=landmark]").val() == "") {
			alert("Please select landmark");
			return false;
	   }				
   }
   
function getAppByOrgID()
{    
            	var orgid=document.getElementById("orgid").value;
            	
            	if(orgid=="0")
                	{      
            	
                	var appid=document.getElementById("appid");
                	var devid=document.getElementById("devid");
                		appid.innerHTML='<select name="appname" id="appid" onchange="getDevEUIByAppID()"> <option value="0" >--Choose Application--</option></select>';
                		devid.innerHTML='<select name="devname" id="devid"> <option value="0" >--Choose Device EUI--</option></select>';
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
    		devid.innerHTML='<select name="devname" id="devid"> <option value="0" >--Choose Device EUI--</option></select>';
    	return;
    	}
    else
    	{
    var url="getDevEUIByAppId?appId="+appid;                                    
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
                    appid.innerHTML='<select  name="appname" id="appid" onchange="getDevEUIByAppID()"><Option value="0">--Choose Application--</Option>'+returnText+'</select>';                                             
                }
            }
            
            function setDevEUI() 
            {                      
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                { 
                    var returnText=xmlHttp.responseText;
                    var devid=document.getElementById("devid");
                    devid.innerHTML='<select  name="devname" id="devid"><Option value="0">--Choose Device EUI--</Option>'+returnText+'</select>';                                             
                }
            }
     </script>      
     
     
     <script type="text/javascript">
			function showPopup(url) {
				var params = "toolbars=no,menubar=no,location=no,scrollbars=yes,resizable=yes";
				size = "height=450,width=520,top=200,left=300," + params;
				if (url == "LandMarkSearch") {
					size = "height=450,width=600,top=200,left=300," + params;
				}
				
				var orgId=document.getElementById("orgid").value;
				if (url == "LandMarkSearch") {
					
					if(orgId=="0")
					{
					alert("Choose Organisation");
					return false;
					}
					url+="?orgId="+orgId;
				}
				
				newwindow = window.open(url, 'name', size);
		
				if (window.focus) {
					newwindow.focus();
				}
			}
</script> 
     
  </head>
  
  <body class="hold-transition skin-blue sidebar-mini">
  
  			<% 
  			String orgName=request.getAttribute("name").toString();
  			String orgId=request.getAttribute("id").toString();
  			
  			%>
  			
							 
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
  					  <h5 class="text-blue text-left "><span class="fa fa-user"></span><b>Add User</b></h5>
       
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
    				    	
    				    	<form name="form1" action="userSubscription" onsubmit="return confirmValidate();" method="post">
										
								  <table class="table">
								  	<tr>
								  		<td align="right"><b>Organization:</b></td>
								  			<%-- <td><input type="text" value="<%=orgName%>"  class="formbutton" id="<%=orgId%>" name="orgName" /></td>--%>
										
										<td>
										 <select name="orgid" id="orgid" onchange="getAppByOrgID()">
										    <option value="0">--Choose Organisation--</option>	
										    <option value="<%=orgId%>"><%=orgName%></option>
										 </select> 
										</td>
									</tr>
									<tr>	
									   <td align="right"><b>Application:</b></td>
									   
										 <td>
										 	<select name="appid" id="appid" onchange="getDevEUIByAppID()">
										    	<option value="0">--Choose Application--</option>	
										    </select> 
										</td>
									</tr>
									
									<tr>	
									   <td align="right"><b>Device EUI:</b></td>
									   
										 <td>
										 	<select name="devid" id="devid" >
										    	<option value="0">--Choose Device EUI--</option>	
										    </select> 
										</td>
									</tr>
									
									<tr>	
									   <td align="right"><b>LoginID:</b></td>
									   
										 <td>
										 	<input type="text" name="uname" id="uname" >
										</td>
									</tr>
									
									<tr>	
									   <td align="right"><b>EmailId:</b></td>
									   
										 <td>
										 	<input type="text" name="email" id="email" >
										</td>
									</tr>
									
									<tr>	
									   <td align="right"><b>Contact#:</b></td>
									   
										 <td>
										 	<input type="text"  name="contact" id="contact" >
										</td>
									</tr>
									
									
									<tr>
								  		<td align="right"><b>UserType:</b></td>
								  													
										<td>
										 <select name="usertype" id="usertype">
										    <option value="0">--Choose UserType--</option>	
										    <option value="1">Admin</option>
										    <option value="5">User</option>
										 </select> 
										</td>
									</tr>
									<tr>
										<td align="right">
											<input style="margin-left: 130%; background-color:#3c8dbc;"
												type="button" value="Select APL" class="formbutton"
													onclick="showPopup('LandMarkSearch') " />
										</td>
				
									</tr>
									
									<tr>	
									   <td align="right"><b>Area:</b></td>
									   
										 <td>
										 	<input type="text" name="area" id="area" readonly/>
										 	<input type="hidden" id="landMarkID" name="landMarkID" />
										</td>
									</tr>
									<tr>	
									   <td align="right"><b>Place:</b></td>
									   
										 <td>
										 	<input type="text" name="place" id="place" readonly/>
										</td>
									</tr>
									<tr>	
									   <td align="right"><b>Landmark:</b></td>
									   
										 <td>
										 	<input type="text" name="landmark" id="landmark" readonly/>
										</td>
									</tr>
									
									<tr>	
										<td align="right"></td>
											<td> <input type="submit"  class="formbutton" style="background-color:#3c8dbc;" value="Add user"/></td>
										 
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