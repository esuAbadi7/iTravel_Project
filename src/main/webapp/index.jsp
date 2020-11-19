<%@ page import="com.itravel.dao.UserDao" %>
<%@ page import="com.itravel.model.User" %>
<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
    <link href = "welcome.js" type="text/javascript" />
    <link href = "welcome.css" type="text/css" rel="stylesheet">

    <style> <%@ include file="WEB-INF/css/footer.css" %></style>

    <sript src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></sript>
</head>
<body>
<% Object object = request.getAttribute("errMsg");
    if(object == null){

    }else{

    }

%>

<header>


    <div class="ui block header" id="header1" style="background-color: #18B7BE;">
        <div class=" ui center aligned header" style="color: #ffffff;">
            <h1 class="ui centered big header" >Welcome to iTraveler</h1>
        </div>
        <div>

        </div>

    </div>

</header>
<div class="ui container">
    <div class="ui segments">
        <div class="ui segment">Content
            <div class="ui placeholder segment">
                <div class="ui two column very relaxed stackable grid">
                    <div class="column">
                        <form action="login" class="ui form error" method="post">

                            <div class="field">
                                <label>Email</label>
                                <div class="ui left icon input">
                                    <input name="email" type="email" placeholder="abc@abc.com">
                                    <i class="user icon"></i>
                                </div>
                            </div>
                            <div class="field">
                                <label>Password</label>
                                <div class="ui left icon input">
                                    <input name="password" type="password">
                                    <i class="lock icon"></i>
                                </div>
                            </div>
                            <% String  error = (String) request.getAttribute("errMsg") ;
                            if(error != null){ %>
                            <div class="ui error message">
                                <p> <%=request.getAttribute("errMsg")%> </p>
                            </div>
                            <%} %>

<%--                            <div class="ui blue submit button">--%>
                                <input class="ui blue submit button" type="submit" value="Login">
<%--                            </div>--%>
                        </form>
                    </div>
                    <div class="middle aligned column">
                        <form action="Signup.jsp">
                            <button class="ui big button">
                                <i class="signup icon"></i>
                                Sign Up
                            </button>
                        </form>

                    </div>
                </div>
                <div class="ui vertical divider">
                    Or
                </div>
            </div>
        </div>
        <div class="ui segment">

            <div class="ui grid">
                <div class="three column row">
                    <!-- <div class="left floated column">Column1 </div> -->
                    <div class="right floated column">
                        <div class="ui placeholder segment">
                            <h4>Send Activation Message</h4>
                            <form class="ui form">
                                <div class="field">
                                    <label>First Name</label>
                                    <input type="text" name="first-name" placeholder="First Name">
                                </div>
                                <div class="field">
                                    <label>Last Name</label>
                                    <input type="text" name="last-name" placeholder="Last Name">
                                </div>
                                <div class="field">
                                    <label>Email</label>
                                    <input type="email" name="email" placeholder="abc@abc.com">
                                </div>
                                <div class="ui blue button"> Submit</div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


</body>
<footer class="footer-distributed" style="background-color:#178CA4">

    <div class="ui three column grid container">
        <div class="column" style="background-color:#178CA4">

            <h3>iTraveler<span></span></h3>

        </div>
        <div class="column">

            <div>
                <i class="fa fa-map-marker"></i>
                <p><span>1000 N. 4th Street</span> Fairfield IA, 52557</p>
            </div>

            <div>
                <i class="fa fa-phone"></i>
                <p>+1.240.505.9711</p>
            </div>

        </div>
        <div class="column">

            <div class="footer-right" >
                <a href="#"><i class="facebook square icon" style="color:rgb(19, 19, 31);"></i></a>
                <a href="#"><i class="linkedin icon" style="color:rgb(19, 19, 31);"></i></a>
                <a href="#"><i class="twitter icon" style="color:rgb(19, 19, 31);"></i></a>
                <a href="#"><i class="github icon" style="color:rgb(19, 19, 31);"></i></a>
            </div> -->

        </div>
    </div>

</footer>


</html>
