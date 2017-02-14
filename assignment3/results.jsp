<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Joe Offutt Assignment 3</title>
</head>
<body style="margin-right:10%; margin-left:10%; background-color: navy">
    <div style="background-color:navajowhite">
        <a href="/index.html"><img src="img/jhu_logo.png" title="JOHNS HOPKINS UNIVERSITY" /></a>
        <div style="background-color: beige;box-shadow: navajowhite">
            <div style="margin-left:30px;padding-top:15px;padding-left:15px;">
                <%
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String[] courses = request.getParameterValues("courses");
                    String employment = request.getParameter("employment");
                    String[] fees = request.getParameterValues("fees");
                    String errors = "";

                    int total=0;
                    int cost=0;
                    int additionalFees=0;

                    if(employment.equals("student"))
                        cost=1000;
                    else if(employment.equals("employee"))
                        cost=850;
                    else if(employment.equals("speaker"))
                        cost=0;
                    else if(employment.equals("other"))
                        cost=1350;
                %>

                <p>Hi <b><%=name%></b></p>
                <p>Your email address is : <b><%=email%></b></p>
                <%if(employment !=null){%>
                <p>Your employment is listed as : <b><%=employment%></b></p>
                <%} else {
                    errors="Need to select employment type";
                    %>
                    <p>error</p>
                <%}%>

                <% if(courses!=null) {
                    total = cost * courses.length;
                %>
                    <p>You are registered for the following courses:</p>
                    <% for(int i=0;i<courses.length;i++){%>
                        <li style="margin-left:25px"><%=courses[i]%> : $<%=cost%></li>
                <%}} else {
                    errors="Need to choose courses";%>
                    <h1>ERROR - Did not select any courses</h1>
                <%}%>

                <% if(fees!=null) {%>
                    <p>The additional fees you have selected are:</p>
                    <% for(int i=0;i<fees.length;i++){
                        if(fees[i].equals("hotel")){
                            additionalFees=185;
                            total+=additionalFees;
                        }
                        else if(fees[i].equals("parking")){
                            additionalFees=10;
                            total+=additionalFees;
                        }
                    %>
                        <li style="margin-left:25px"><%=fees[i]%> : $<%=additionalFees%></li>
                <%}} else {%>
                    <p>No additional Fees:</p>
                <%}%>


                <% if(errors == ""){%>
                    <p>Your total is: <b>$<%=total%></b></p><br/><br/>

                    <h1 style="text-align:center">Thanks for spending your hard earned monies</h1><br/>
                <%} else {%>
                    <script>alert("<%=errors%>");</script>
                    <p>Errors in app</p>
                <%}%>

            </div>
        </div>
    </div>
</body>
</html>