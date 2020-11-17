<%--
  Created by IntelliJ IDEA.
  User: esuab
  Date: 11/14/2020
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
    <link href="jsp.css" type="text/css" rel="stylesheet" />

</head>
<body>

<sript src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js">

</sript>

<div class="ui pointing menu">
    <a href="travelerHomePage.jsp" class="item">
        Home
    </a>
    <a class="active item">
        Profile
    </a>
    <a href="" class="item">
        Weather Service
    </a>
    <div class="right menu">

        <a class="item">
            <i class="bell icon"></i>
        </a>

    </div>
</div>

<div class="ui container">
    <div class="ui segments">
        <div class="ui segment">
            <h3 class="ui center aligned header">User Profile </h3>
        </div>

        <div class="ui segment">
            <div class="ui container">
                <div class ="ui container">
                    <div class="ui segments">
                        <div class="ui segment">
                            <div class = column>

                                <div class="ui form">
                                    <div class="three fields">
                                        <div class="field">
                                            <label>First name</label>
                                            <input type="text" placeholder="First Name">
                                        </div>
                                        <div class="field">
                                            <label>Middle name</label>
                                            <input type="text" placeholder="Middle Name">
                                        </div>
                                        <div class="field">
                                            <label>Last name</label>
                                            <input type="text" placeholder="Last Name">
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class ="colunm">

                                <div class="ui form">
                                    <div class="three fields">
                                        <div class="field">
                                            <label>State</label>
                                            <input type="text" placeholder="First Name">
                                        </div>
                                        <div class="field">
                                            <label>City</label>
                                            <input type="text" placeholder="Middle Name">
                                        </div>
                                        <div class="field">
                                            <label>Street</label>
                                            <input type="text" placeholder="Last Name">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class = "colunm">
                                <div class="ui form">
                                    <div class="three fields">
                                        <div class="field">
                                            <label>Zip Code</label>
                                            <input type="text" placeholder="First Name">
                                        </div>

                                        <div class="field">
                                            <label>Birth year</label>
                                            <input type="text" placeholder="Year">
                                        </div>
                                        <div class="field">
                                            <label>Gender</label>
                                            <select>
                                                <option value="">Select Gender</option>
                                                <option value="1">Male</option>
                                                <option value="0">Female</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <div class="colunm">
                                <div class="ui form">
                                    <div class="three fields">
                                        <div class="ui blue button right floated" id="btn2" >
                                            Update Details
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
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
    This is out footer

</footer>








</body>
</html>
