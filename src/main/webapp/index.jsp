<%@ page import="com.itravel.dao.UserDao" %>
<%@ page import="com.itravel.model.User" %>
<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
    <link href = "welcome.js" type="text/javascript" />
    <link href = "welcome.css" type="text/css" rel="stylesheet">

</head>
<body>
<% Object object = request.getAttribute("errMsg");
    if(object == null){

    }else{

    }

%>
<sript src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></sript>
<header>
    <h1 class="ui centered big header" id="head">Welcome to iTraveler</h1>
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
                            <div class="ui error message">
                                <p> <%=request.getAttribute("errMsg")%> </p>
                            </div>
                            <div class="ui blue submit button">
                                <input type="submit" value="Login">
                            </div>
                        </form>
                    </div>
                    <div class="middle aligned column">
                        <div class="ui big button">
                            <i class="signup icon"></i>
                            Sign Up
                        </div>
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
<footer>
    <p> This is Footer. </p>
    <p>Are you deactivated? Do you want to send Request?</p>
    <p>Copy right 2020 Fairfield IA 52557 United States</p>

</footer>


</html>
