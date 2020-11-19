<%--
  Created by IntelliJ IDEA.
  User: black
  Date: 11/14/2020
  Time: 9:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<%--<%@include file="WEB-INF/js/signup.js"%>--%>
<html>
<head >
    <meta charset="utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
    <link rel="stylesheet" type="text/css" href = "https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/form.css">

    <%--    <script src = "WEB-INF/js/signup.js" type="text/javascript"></script>--%>

    <style> <%@ include file="WEB-INF/css/footer.css" %></style>

    <sript src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></sript>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/form.js"> </script>


</head>

<body>
<header>


    <div class="ui block header" id="header1" style="background-color: #18B7BE;">
        <div class=" ui center aligned header" style="color: #ffffff;">
            <h1 class="ui centered big header" >Sign up to iTravel</h1>
        </div>
        <div>

        </div>

    </div>

</header>

<div class ="ui container" >
    <div class="ui segment form">
        <div class = "colunm">
            <form action="signup" class ="ui form" id="validate" method="post">

                <div class="three fields">
                    <div class="field">
                        <label>First name</label>
                        <input type="text" placeholder="First Name" name="firstname">
                    </div>
                    <div class="field">
                        <label>Middle name</label>
                        <input type="text" name="middlename" placeholder="Middle Name">
                    </div>
                    <div class="field">
                        <label>Last name</label>
                        <input type="text" name="lastname" placeholder="Last Name">
                    </div>
                </div>




                <div class="three fields">
                    <div class="field">
                        <label>State</label>
                        <input type="text" name="state" placeholder="Newyork">
                    </div>
                    <div class="field">
                        <label>City</label>
                        <input type="text"  name="city" placeholder="Fairfied">
                    </div>
                    <div class="field">
                        <label>Street</label>
                        <input type="text" name="street" placeholder="Burlington av">
                    </div>
                </div>




                <div class="three fields">
                    <div class="field">
                        <label>Zip Code</label>
                        <input type="text" name="zipcode" placeholder="12556">
                    </div>

                    <div class="field">
                        <label>Birth year</label>
                        <input type="text" name="birthyear" placeholder="Year">
                    </div>
                    <div class="field">
                        <label>Gender</label>
                        <select name="gender">
                            <option value="">Select Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                </div>


                <div class="one fields">
                    <div class="sixteen field wide">
                        <label>Email</label>
                        <div class="ui left icon input">
                            <input type="email" name="email" placeholder="abc@abc.com">
                            <i class="user icon"></i>
                        </div>
                    </div>
                </div>
                <div class="one fields">
                    <div class="sixteen field wide">
                        <label>Password</label>
                        <div class="ui left icon input">
                            <input type="password" name="password">
                            <i class="lock icon"></i>
                        </div>
                    </div>
                </div>
                <div class=" one fields">
                    <div class="sixteen field wide">
                        <label>Confirm Password</label>
                        <div class="ui left icon input">
                            <input type="password" name="confirm">
                            <i class="lock icon"></i>
                        </div>
                    </div>
                </div>



                <div class="ui primary submit button" >
                    Sign Up
                </div>
                <div class="ui error message">
                    ${EmailerrMsg}
                </div>
                <% String  error = (String) request.getAttribute("EmailerrMsg") ;
                    if(error != null){ %>
                <div class="ui error message">
                    <p> <%=request.getAttribute("errMsg")%> </p>
                </div>
                <%} %>



            </form>

        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        $('#validate').
        form({
                fields:{
                    firstname: {
                        identifier: 'firstname',
                        rules: [
                            {
                                type   : 'empty',
                                prompt : 'Please enter your First Name'
                            }
                        ]
                    },
                    middlename: {
                        identifier: 'middlename',
                        rules: [
                            {
                                type   : 'empty',
                                prompt : 'Please enter your Middle Name'
                            }
                        ]
                    },
                    lastname: {
                        identifier: 'lastname',
                        rules: [
                            {
                                type   : 'empty',
                                prompt : 'Please enter your Last Name'
                            }
                        ]
                    },
                    state: {
                        identifier: 'state',
                        rules: [
                            {
                                type   : 'empty',
                                prompt : 'Please enter your State'
                            }
                        ]
                    },
                    city: {
                        identifier: 'city',
                        rules: [
                            {
                                type   : 'empty',
                                prompt : 'Please enter your City'
                            }
                        ]
                    },
                    street: {
                        identifier: 'street',
                        rules: [
                            {
                                type   : 'empty',
                                prompt : 'Please enter your Street'
                            }
                        ]
                    },
                    zipcode: {
                        identifier: 'zipcode',
                        rules: [
                            {
                                type   : 'empty',
                                prompt : 'Please enter your Zipcode'
                            }
                        ]
                    },
                    gender: {
                        identifier: 'gender',
                        rules: [
                            {
                                type   : 'empty',
                                prompt : 'Please enter your Gender'
                            }
                        ]
                    },
                    email: {
                        identifier: 'email',
                        rules: [
                            {
                                type   : 'empty',
                                prompt : 'Please enter your Email'
                            }
                        ]
                    },
                    password: {
                        identifier: 'password',
                        rules: [
                            {
                                type   : 'empty',
                                prompt : 'Please enter your Password'
                            },
                            {
                                type   : 'minLength[6]',
                                prompt : 'min length is 6'
                            },
                            {
                                type   : 'regExp',
                                value  :  '[a-z]',
                                prompt : 'please enter at least one small letter'
                            },
                            {
                                type   : 'regExp',
                                value  :  '[A-Z]',
                                prompt : 'please enter at least one capital letter'
                            },
                            {
                                type   : 'regExp',
                                value  :  '[0-9]',
                                prompt : 'please enter at least on one number'
                            }
                        ]
                    },
                    confirm: {
                        identifier: 'confirm',
                        rules: [
                            {
                                type   : 'match[password]',
                                prompt : 'Your Password should mathch'
                            }
                        ]
                    },
                    birthyear: {
                        identifier: 'birthyear',
                        rules: [
                            {
                                type   : 'empty',
                                prompt : 'Please enter your Birthyear'
                            }
                        ]
                    }

                }

            }
            ,{
                onSuccess : function(e){
                    e.prventDefault(e);
                    alert();
                }
            }
        )
    });





</script>

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

</body>
</html>
