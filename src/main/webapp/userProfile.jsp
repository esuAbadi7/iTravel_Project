<%--
  Created by IntelliJ IDEA.
  User: esuab
  Date: 11/18/2020
  Time: 11:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.itravel.model.Traveler" %>
<%@ page import="jakarta.servlet.http.HttpSession" %><%--
  Created by IntelliJ IDEA.
  User: berek
  Date: 11/18/2020
  Time: 2:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
    <!-- <link href="jsp.css" type="text/css" rel="stylesheet" /> -->
    <script src="userprofile.js" type="text/javascript"></script>
    <% HttpSession session1 = (HttpSession) request.getSession();
        Traveler traveler;
        traveler= (Traveler) session1.getAttribute("Traveler"); %>

</head>
<body>


<sript src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js">

</sript>

<div class="ui block header" id="header1" style="background-color: #18B7BE;">
    <div class=" ui center aligned header" style="color: #ffffff;"> ${sessionScope.traveler.firstName} Profile Page</div>

    <div class="ui pointing menu middlebar" style="background-color: #178CA4;" >
        <a href="travelerHomePage.jsp" class="item" style="color: #F9F7F0;">
            Home
        </a>
        <a href="#" class="active item" style="color: #F9F7F0;">
            Profile
        </a>
        <a class="item" style="color: #F9F7F0;">
            Weather Service
        </a>
    </div>
</div>

<div class="ui container">
    <div class="ui segments">
        <div class="ui segment">
            <h3 class="ui center aligned header">User Profile </h3>
        </div>

        <div class ="ui container" >
            <div class="ui segment form">
                <div class = "colunm">

                    <form action=''>

                        <div class="one fields">
                            <div class="field">
                                <div class="item">
                                    <a href="#" class="ui small image">
                                        <img src="https://semantic-ui.com/images/avatar2/large/kristy.png" >
                                    </a>

                                    <div class="content">
                                        <div>
                                            <label class="ui icon button btn-file">
                                                <i class="paperclip icon"></i>
                                                <input type="file" name="attachmentName" style="display: none;">
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="one fields">
                            <div class="field">
                                <button class="ui primary submit blue button left floated" name="btn1" >
                                    Update Profile
                                </button>
                            </div>
                        </div>

                    </form>



                    <form action=''>
                        <div class="three fields">
                            <div class="field">
                                <label>First name</label>
                                <input type="text" placeholder="First Name" name="firstname" value="${sessionScope.traveler.firstName}" >
                            </div>
                            <div class="field">
                                <label>Middle name</label>
                                <input type="text" name="middlename" placeholder="Middle Name" value="${sessionScope.traveler.firstName}">
                            </div>
                            <div class="field">
                                <label>Last name</label>
                                <input type="text" name="lastname" placeholder="Last Name" value="${sessionScope.traveler.firstName}">
                            </div>
                        </div>



                        <div>
                            <div class="three fields">
                                <div class="field">
                                    <label>State</label>
                                    <input type="text" name="state" placeholder="Newyork" value="">
                                </div>
                                <div class="field">
                                    <label>City</label>
                                    <input type="text"  name="city" placeholder="Fairfied" value="">
                                </div>
                                <div class="field">
                                    <label>Street</label>
                                    <input type="text" name="street" placeholder="Burlington av" value="">
                                </div>
                            </div>
                        </div>



                        <div class="three fields">
                            <div class="field">
                                <label>Zip Code</label>
                                <input type="text" name="zipcode" placeholder="12556" value="">
                            </div>

                            <div class="field">
                                <label>Birth year</label>
                                <input type="text" name="birthyear" placeholder="Year" value="">
                            </div>
                            <div class="field">
                                <label>Gender</label>
                                <select value="">
                                    <option value="">Select Gender</option>
                                    <option value="1">Male</option>
                                    <option value="0">Female</option>
                                </select>
                            </div>
                        </div>

                        <div class="one fields">
                            <div class="field">
                                <button class="ui primary submit blue button left floated" name="btn2">
                                    Update Details
                                </button>
                            </div>
                        </div>
                    </form>




                    <div class="one fields">
                        <div class="five field wide">
                            <label>Email</label>
                            <div class="ui left icon input">
                                <input type="email" name="email" placeholder="abc@abc.com" value="">
                                <i class="user icon"></i>
                            </div>
                        </div>
                    </div>
                    <form action='' method="POST" id="validate1">

                        <div class ="ui segment"> <h3 class="ui left aligned header">Change Passwod </h3></div>
                        <div class="one fields">
                            <div class="five field wide">
                                <label>New Password</label>
                                <div class="ui left icon input">
                                    <input type="password" name="password">
                                    <i class="lock icon"></i>
                                </div>
                            </div>
                        </div>
                        <div class="five field wide">
                            <div class="field">
                                <label>Confirm New Password</label>
                                <div class="ui left icon input">
                                    <input type="password" name="confirm">
                                    <i class="lock icon"></i>
                                </div>
                            </div>
                        </div>

                        <div class="one fields">
                            <div class="field">
                                <button class="ui primary submit blue button">
                                    Update password
                                </button>
                            </div>
                        </div>

                    </form>




                </div>
            </div>
        </div>



    </div>

    <div class="ui segment">

    </div>


    <div class="ui segment">
        <div class="ui relaxed divided items">
            <div class="item">
                <h4 class="ui left aligned header">Posts </h4>
            </div>

            <div class="item">

                <!-- <h3 class="ui center aligned header">Stackable Grid</h3>
                <div class="ui two column stackable grid">
                    <div class="column">
                        <div class="ui segment">Content1</div>
                    </div>
                    <div class="column">
                        <div class="ui segment">Content2</div>
                    </div>
                    <div class="three column row">
                        <div class="column">
                        <div class="ui segment">Content3</div>
                        </div>
                        <div class="column">
                        <div class="ui segment">Content4</div>
                        </div>
                        <div class="column">
                        <div class="ui segment">Content5</div>
                        </div>
                    </div>
                    <div class="ten wide column">
                        <div class="ui segment">Content6</div>
                    </div>
                    <div class="six wide column">
                        <div class="ui segment">Content7</div>
                    </div>
                </div> -->

            </div>

            <div class="item">
                <div style="width: 50%;" class="ui container">

                    <div class="ui segments">
                        <div class="ui segment">

                            <img class="ui avatar image" src="https://semantic-ui.com/images/avatar2/large/kristy.png"> Elliot
                            <div class="right floated">14h</div>

                        </div>
                        <div class="ui segment">

                            <img class="ui fluid image" src="https://semantic-ui.com/examples/assets/images/wireframe/image-text.png"/>

                        </div>
                        <div class="ui segment">

                            <div class="ui justified container">
                                <p>
                                    This is the post text content and it is kjabfkvksljbavljbv jaljkvbaljvbhaj hkjklgjadhajlhvlkj kljaghkj  ghakjlgh kjh
                                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Repudiandae ut quidem corrupti adipisci, ipsa minus aliquam laboriosam ab voluptates pariatur blanditiis laborum ex ipsum saepe perferendis esse voluptatum non magnam.

                                </p>
                            </div>

                        </div>

                        <div class="ui segment">
                            <div class="content">

                                <div class="ui grid">

                                    <div class="four wide column">
                                        <button class="circular ui icon button">
                                            <i class="thumbs up icon"></i>
                                        </button>
                                        <label>17</label> likes
                                    </div>
                                    <div class="four wide column">
                                        <button class="circular ui icon button">
                                            <i class="thumbs down icon"></i>
                                        </button>


                                        <label>1</label> dislikes
                                    </div>
                                    <div class="four wide column">
                                        <button class="circular ui icon button">
                                            <i class="comments icon"></i>
                                        </button>

                                        <a> comments</a>

                                    </div>
                                    <div class="four wide column">
                                        <button class="ui icon button">
                                            <i class="map marker alternate red icon"></i>
                                            Location
                                        </button>


                                    </div>
                                </div>

                            </div>
                            <!-- </div> -->
                        </div>

                        <div style="margin:0px" class="ui segment">
                            Comments
                            <div class="ui grid">

                                <div class="row">
                                    <div class="ui two column grid">
                                        <div class="row">
                                            <div class="two wide column">
                                                <img  class="ui avatar image" src="https://semantic-ui.com/examples/assets/images/wireframe/image-text.png">

                                            </div>
                                            <div class="fourteen wide column">
                                                <div class="ui grid">
                                                    <div class="twelve wide column">
                                                        <label>Traveler Name</label>
                                                    </div>
                                                    <div class="four wide column">
                                                        <div class="Right floated left aligned column">12/02/2020</div>
                                                    </div>
                                                </div>


                                                <p>
                                                    A description which may flow for several lines and give context to the content.
                                                </p>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="ui two column grid">
                                        <div class="row">
                                            <div class="two wide column">
                                                <img  class="ui avatar image" src="https://semantic-ui.com/examples/assets/images/wireframe/image-text.png">

                                            </div>
                                            <div class="fourteen wide column">
                                                <div class="ui grid">
                                                    <div class="twelve wide column">
                                                        <label>Traveler Name</label>
                                                    </div>
                                                    <div class="four wide column">
                                                        <div class="Right floated left aligned column">12/02/2020</div>
                                                    </div>
                                                </div>


                                                <p>
                                                    A description which may flow for several lines and give context to the content.
                                                </p>

                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="ui segment">

                            <div class="ui large transparent left icon input">
                                <i class="comment outline icon"></i>
                                <input type="text" placeholder="Add Comment...">
                            </div>

                        </div>
                    </div>

                </div>

            </div>

            <div class="item">
                <!-- <div class="ui container">
                    Individual Posts goes here
                    <div style="min-width: 35%;" class="ui centered card">
                        <div class="content">
                            <div class="right floated meta">14h</div>
                            <img class="ui avatar image" src="https://semantic-ui.com/images/avatar2/large/kristy.png"> Elliot
                        </div>
                        <div class="image">
                            <img src="https://semantic-ui.com/examples/assets/images/wireframe/image-text.png">
                        </div>
                        <div class="content">
                            <span class="right floated">
                                <i class="heart outline like icon"></i>
                                17 likes
                            </span>
                            <i class="comment icon"></i>
                                3 comments
                            </div>
                            <div class="extra content">
                                <div class="ui large transparent left icon input">
                                    <i class="heart outline icon"></i>
                                    <input type="text" placeholder="Add Comment...">
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->

            </div>

        </div>

    </div>
</div>
</div>

<footer>
    <footer class="footer-distributed" style="background-color:#178CA4">

        <div class="footer-left">
            <h3>iTraveler<span></span></h3>
        </div>

        <div class="footer-center">

            <div>
                <i class="fa fa-map-marker"></i>
                <p><span>1000 N. 4th Street</span> Fairfield IA, 52557</p>
            </div>

            <div>
                <i class="fa fa-phone"></i>
                <p>+1.240.505.9711</p>
            </div>
        </div>
        <div class="footer-right" >
            <a href="#"><i class="facebook square icon" style="color:rgb(19, 19, 31);"></i></a>
            <a href="#"><i class="linkedin icon" style="color:rgb(19, 19, 31);"></i></a>
            <a href="#"><i class="twitter icon" style="color:rgb(19, 19, 31);"></i></a>
            <a href="#"><i class="github icon" style="color:rgb(19, 19, 31);"></i></a>
        </div>
        </div>
        </div>
    </footer>

</footer>



</body>
</html>

