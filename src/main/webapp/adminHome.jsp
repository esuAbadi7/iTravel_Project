<%--
  Created by IntelliJ IDEA.
  User: esuab
  Date: 11/15/2020
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
<%--    <link href="jsp.css" type="text/css" rel="stylesheet" />--%>
    <link href="WEB-INF/css/header.css" type="text/css" rel="stylesheet" />

</head>
<body>

<sript src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js">

</sript>

<div class="ui block header" id="header1" style="background-color: #18B7BE;">
    <div class=" ui center aligned header" style="color: #ffffff;">Admin Page</div>

    <div class="ui pointing menu middlebar" style="background-color: #178CA4;" >
        <a class="active item" style="color: #F9F7F0;">
            Home
        </a>
        <a href="travelerUsersList.jsp" class="item" style="color: #F9F7F0;">
            Deactivated Users
        </a>
        <a class="item" style="color: #F9F7F0;">
            Requests
        </a>
    </div>
</div>

<div class="ui stackable two column very relaxed grid container"  style="position:relative;">

    <div class="column">

        <h4 class="ui segment"> Unhealthy posts</h4>
        <div class="ui segment">
            <div class="ui card " id="eyob2" >

                <div class="image" >
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTp6rxEfzPRsDTU2pTkes6dM0YRMfD9Zyc72w&usqp=CAU">
                </div>

                <div class="content">
                    <span class="left floated">
                        <i class="heart outline like icon"></i>
                         17 likes
                    </span>
                    <span class="left floated">
                    <i class="thumbs down icon"></i>
                    3 dislikes
                </span>
                    <i class="comment icon right floated"></i>

                    <span class="right floated">
                    10 comments
                </span>


                </div>
                <div class="extra content">
                    <div class="ui large transparent left icon input">
                        <input type="text" placeholder="Add Comment...">
                    </div>
                </div>
            </div>

        </div>
    </div>


    <div class="column" >
        <div class="ui segment">
            <div class="ui  icon input  "  >
                <input type="text" id="searchlen" placeholder="Search...">
                <i class="search link icon"></i>
            </div>

            <div >
                <h4> Unhealthy words</h4>
                <input type="text" id="inputlen">
                <button>add</button>
            </div>
        </div>
    </div>
</div>

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
</footer>

</body>


</html>

