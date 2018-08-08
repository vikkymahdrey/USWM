<%--
    Author     : Vikky
--%>


<%@page import="com.team.app.domain.*"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.util.List"%>
<%@ page import="java.security.*" %>
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
	<%!
		public boolean empty(String s)
		{
			if(s== null || s.trim().equals(""))
				return true;
			else
				return false;
		}
	%>
<%!
	public String hashCal(String type,String str){
		byte[] hashseq=str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try{
		MessageDigest algorithm = MessageDigest.getInstance(type);
		algorithm.reset();
		algorithm.update(hashseq);
		byte messageDigest[] = algorithm.digest();
            
		

		for (int i=0;i<messageDigest.length;i++) {
			String hex=Integer.toHexString(0xFF & messageDigest[i]);
			if(hex.length()==1) hexString.append("0");
			hexString.append(hex);
		}
			
		}catch(NoSuchAlgorithmException nsae){ }
		
		return hexString.toString();


	}
%>
<% 	
	String merchant_key="gtKFFx";
	String salt="eCwWELxi";
	String action1 ="";
	String base_url="https://sandboxsecure.payu.in";
	int error=0;
	String hashString="";
	
 

	
	Enumeration paramNames = request.getParameterNames();
	Map<String,String> params= new HashMap<String,String>();
    	while(paramNames.hasMoreElements()) 
	{
      		String paramName = (String)paramNames.nextElement();
      
      		String paramValue = request.getParameter(paramName);

		params.put(paramName,paramValue);
	}
	String txnid ="";
	String udf2="";
	if(empty(params.get("txnid"))){
		Random rand = new Random();
		String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
		txnid=hashCal("SHA-256",rndm).substring(0,20);
	}
	else
		txnid=params.get("txnid");
        udf2 = txnid;
	String txn="abcd";
	String hash="";
	String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if(empty(params.get("hash")) && params.size()>0)
	{
		if( empty(params.get("key"))
			|| empty(params.get("txnid"))
			|| empty(params.get("amount"))
			|| empty(params.get("firstname"))
			|| empty(params.get("email"))
			|| empty(params.get("phone"))
			|| empty(params.get("productinfo"))
			|| empty(params.get("surl"))
			|| empty(params.get("furl"))
			|| empty(params.get("service_provider"))
	)
			
			error=1;
		else{
			String[] hashVarSeq=hashSequence.split("\\|");
			
			for(String part : hashVarSeq)
			{
				hashString= (empty(params.get(part)))?hashString.concat(""):hashString.concat(params.get(part));
				hashString=hashString.concat("|");
			}
			hashString=hashString.concat(salt);
			

			 hash=hashCal("SHA-512",hashString);
			action1=base_url.concat("/_payment");
		}
	}
	else if(!empty(params.get("hash")))
	{
		hash=params.get("hash");
		action1=base_url.concat("/_payment");
	}
		

%>				 
	
 <script>
 var hash='<%= hash %>';
 function submitPayuForm() {
	
	if (hash == '')
		return;

      var payuForm = document.forms.payuForm;
      payuForm.submit();
    }
</script>
     
  </head>
  
  <body class="hold-transition skin-blue sidebar-mini" onload="submitPayuForm();">
  			
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
    				    	
    				    	<form action="<%= action1 %>" method="post" name="payuForm">
								      <input type="hidden" name="key" value="<%= merchant_key %>" />
								      <input type="hidden" name="hash" value="<%= hash %>"/>
								      <input type="hidden" name="txnid" value="<%= txnid %>" />
								      <input type="hidden" name="udf2" value="<%= txnid %>" />
									  <input type="hidden" name="service_provider" value="payu_paisa" />
								      <table>
								        <tr>
								          <td><b>Mandatory Parameters</b></td>
								        </tr>
								        <tr>
								          <td>Amount: </td>
								          <td><input name="amount" value="<%= (empty(params.get("amount"))) ? "" : params.get("amount") %>" /></td>
								          <td>First Name: </td>
								          <td><input name="firstname" id="firstname" value="<%= (empty(params.get("firstname"))) ? "" : params.get("firstname") %>" /></td>
								        </tr>
								        <tr>
								          <td>Email: </td>
								          <td><input name="email" id="email" value="<%= (empty(params.get("email"))) ? "" : params.get("email") %>" /></td>
								          <td>Phone: </td>
								          <td><input name="phone" value="<%= (empty(params.get("phone"))) ? "" : params.get("phone") %>" /></td>
								        </tr>
								        <tr>
								          <td>Product Info: </td>
								          <td colspan="3"><input name="productinfo" value="<%= (empty(params.get("productinfo"))) ? "" : params.get("productinfo") %>" size="64" /></td>
								        </tr>
								        <tr>
								          <td>Success URI: </td>
								          <td colspan="3"><input name="surl" value="<%= (empty(params.get("surl"))) ? "" : params.get("surl") %>" size="64" /></td>
								        </tr>
								        <tr>
								          <td>Failure URI: </td>
								          <td colspan="3"><input name="furl" value="<%= (empty(params.get("furl"))) ? "" : params.get("furl") %>" size="64" /></td>
								        </tr>
								        <tr>
								          <td><b>Optional Parameters</b></td>
								        </tr>
								        <tr>
								          <td>Last Name: </td>
								          <td><input name="lastname" id="lastname" value="<%= (empty(params.get("lastname"))) ? "" : params.get("lastname") %>" /></td>
								          <td>Cancel URI: </td>
								          <td><input name="curl" value="" /></td>
								        </tr>
								        <tr>
								          <td>Address1: </td>
								          <td><input name="address1" value="<%= (empty(params.get("address1"))) ? "" : params.get("address1") %>" /></td>
								          <td>Address2: </td>
								          <td><input name="address2" value="<%= (empty(params.get("address2"))) ? "" : params.get("address2") %>" /></td>
								        </tr>
								        <tr>
								          <td>City: </td>
								          <td><input name="city" value="<%= (empty(params.get("city"))) ? "" : params.get("city") %>" /></td>
								          <td>State: </td>
								          <td><input name="state" value="<%= (empty(params.get("state"))) ? "" : params.get("state") %>" /></td>
								        </tr>
								        <tr>
								          <td>Country: </td>
								          <td><input name="country" value="<%= (empty(params.get("country"))) ? "" : params.get("country") %>" /></td>
								          <td>Zipcode: </td>
								          <td><input name="zipcode" value="<%= (empty(params.get("zipcode"))) ? "" : params.get("zipcode") %>" /></td>
								        </tr>
								        <tr>
								          <td>UDF1: </td>
								          <td><input name="udf1" value="<%= (empty(params.get("udf1"))) ? "" : params.get("udf1") %>" /></td>
								          
								        <tr>
								          <td>UDF3: </td>
								          <td><input name="udf3" value="<%= (empty(params.get("udf3"))) ? "" : params.get("udf3") %>" /></td>
								          <td>UDF4: </td>
								          <td><input name="udf4" value="<%= (empty(params.get("udf4"))) ? "" : params.get("udf4") %>" /></td>
								        </tr>
								        <tr>
								          <td>UDF5: </td>
								          <td><input name="udf5" value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" /></td>
								          <td>PG: </td>
								          <td><input name="pg" value="<%= (empty(params.get("pg"))) ? "" : params.get("pg") %>" /></td>
								        </tr>
								        <tr>
								          <% if(empty(hash)){ %>
								            <td colspan="4"><input type="submit" value="Submit" /></td>
								          <% } %>
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