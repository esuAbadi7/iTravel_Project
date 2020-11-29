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
    <%
        HttpSession httpSession = request.getSession();
        if (httpSession != null) {
            if (httpSession.getAttribute("traveler") != null) {
                Traveler traveler = (Traveler) httpSession.getAttribute("traveler");
                System.out.print("Hello, " + traveler + "  Welcome to ur Profile");
            }else {
                response.sendRedirect("index.jsp");
            }
        }
    %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
    <!-- <link href="jsp.css" type="text/css" rel="stylesheet" /> -->
    <style> <%@ include file="WEB-INF/css/footer.css" %></style>
    <sript src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></sript>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/form.js"> </script>



    <% HttpSession session1 = (HttpSession) request.getSession();
        Traveler traveler;
        traveler= (Traveler) session1.getAttribute("Traveler"); %>


    <script>
        var $data;
        var $latitude , $longitude;
        $(document).ready(function() {

            load_Posts();

            // $('#postBtn').on("click",do_post);
            $('#map').hide();
            $('#postSuccess').hide();
            $('#close').on("click",function() {
                $('#postSuccess').hide()
            });

        });
        function load_Posts(){
            $.get('postAction',
                function (responseJson) {
                    var $postContainer = $('#postList');
                    $postContainer.find('.card').remove();
                    $.each(responseJson, function (key, value){

                        $data = value;
                        htmlContent =
                            '<div style="min-width: 50%;" class="ui centered card">\n' +
                            '                    <div class="content">\n' +
                            '                        <div class="right floated meta">'+value.postDate.time.hour+'hr <i id="deleteIcon'+value.postId+'" data-postId="'+value.postId+'"  class="red delete icon"></i></div>\n' +
                            '                        <img class="ui avatar image" src="https://semantic-ui.com/images/avatar2/large/kristy.png"> '+value.traveler.firstName+' '+value.traveler.lastName+' \n' +
                            '                    </div>\n' +
                            '                    <div id="imageContainer'+value.postId+'" class="image">\n' +
                            '                        <img src="'+value.imageUrl+'">\n' +
                            '                    </div>\n' +
                            '                    <div id="textContainer'+value.postId+'" class="content">\n' +
                            '                        <div class="ui justified container">\n' +
                            '                            <p>'+value.postText +
                            '                            </p>\n' +
                            '                        </div>\n' +
                            '                    </div>\n' +
                            '                    <div class="content">\n' +
                            '\n' +
                            '                        <div class="ui grid">\n' +
                            '\n' +
                            '                            <div class="four wide column">\n' +
                            '                                <button id="likeBtn'+value.postId+'" data-postId="'+value.postId+'" data-likes="'+value.likes +'" data-clicked="0"  class="circular ui icon button">\n' +
                            '                                    <i id="likeIcon'+value.postId+'" data-postId="'+value.postId+'" data-likes="'+value.likes +'" data-clicked="0" class="thumbs up icon" ></i>\n' +
                            '                                </button>\n' +
                            '                                <label id="likeLabel'+value.postId+'">'+value.likes +'</label>\n' +
                            '                            </div>\n' +
                            '                            <div class="four wide column">\n' +
                            '                                <button id="dislikeBtn'+value.postId+'" data-postId="'+value.postId+'"  data-dislikes="'+value.dislikes +'" data-clicked="0" class="circular ui icon button">\n' +
                            '                                    <i id="dislikeIcon'+value.postId+'" class="thumbs down icon" data-postId="'+value.postId+'" data-dislikes="'+value.dislikes +'" data-clicked="0" ></i>\n' +
                            '                                </button>\n' +
                            '                                <label id="dislikeLabel'+value.postId+'" >'+value.dislikes +'</label>\n' +
                            '                            </div>\n' +
                            '                            <div class="four wide column">\n' +
                            '                                <button id="commentBtn'+value.postId+'" data-postId="'+value.postId+'" class="circular ui icon button">\n' +
                            '                                    <i data-postId="'+value.postId+'" class="comments icon"></i>\n' +
                            '                                </button>\n' +
                            '                                <!-- <a> comments</a> -->\n' +
                            '\n' +
                            '                            </div>\n' +
                            '                            <div class="four wide column">\n' +
                            '                                <button id="mapBtn'+value.postId+'" data-postId="'+value.postId+'" data-lat="'+value.location.latitude+'" data-long="'+value.location.longitude+'" class="ui icon button">\n' +
                            '                                    <i data-postId="'+value.postId+'" data-lat="'+value.location.latitude+'" data-long="'+value.location.longitude+'"  class="map marker alternate red icon"></i>\n' +
                            '                                    <!-- Location -->\n' +
                            '                                </button>\n' +
                            '\n' +
                            '\n' +
                            '                            </div>\n' +
                            '                        </div>\n' +
                            '\n' +
                            '                    </div>\n' +

                            '                    <div id="commentContainer'+value.postId+'" class="content">\n' +
                            '                        <div id="commentItems'+value.postId+'" class="ui items">\n' +

                            '                        </div>\n' +
                            '                    </div>\n' +
                            '\n' +
                            '                    <div class="content">\n' +
                            '                        <div class="ui large transparent left icon input">\n' +
                            '                            <i class="comment outline icon"></i>\n' +
                            '                            <input id="addComment'+value.postId+'" data-postId="'+value.postId+'" type="text" placeholder="Add Comment...">\n' +
                            '                        </div>\n' +
                            '                    </div>\n' +
                            '                </div>';

                        $postContainer.append(htmlContent);


                        if(value.comments.length != 0) {
                            // load_Comments(value.postId);
                            $comments = value.comments;
                            for (let i = 0; i < $comments.length; i++) {
                                commenthtml =
                                    '                            <div class="item">\n' +
                                    '                                <img class="ui  avatar image" src="https://semantic-ui.com/examples/assets/images/wireframe/image-text.png">\n' +
                                    '                                <div class="middle aligned content">\n' +
                                    '                                    <div class="ui grid">\n' +
                                    '                                        <div class="eleven wide column">\n' +
                                    '                                            <label>' + $comments[i].traveler.firstName + ' ' + $comments[i].traveler.lastName + '</label>\n' +
                                    // '                                            <a class="header">12 Years a Slave</a>\n' +
                                    '                                        </div>\n' +
                                    '                                        <div class="five wide column">\n' +
                                    // '                                            <div class="Right floated left aligned column">12/02/2020</div>\n' +
                                    '                                        </div>\n' +
                                    '                                    </div>\n' +
                                    '                                    <p>\n' + $comments[i].text +
                                    '                                    </p>\n' +
                                    '                                </div>\n' +
                                    '                            </div>\n';

                                // $('#commentItems' + postId)
                                $("#commentItems"+$data.postId).append(commenthtml);
                            }
                        }




                        if(value.imageUrl.length == 0){
                            $('#imageContainer'+value.postId).hide();
                            // $("#activate_btn_"+$data.travelerId).addClass("disabled");
                        }
                        if(value.postText.length == 0){
                            $('#textContainer'+value.postId).hide();
                            // $("#activate_btn_"+$data.travelerId).addClass("disabled");
                        }

                        $("#commentContainer"+$data.postId).hide();
                        $("#commentBtn"+$data.postId).on("click",displayComment);
                        // $('#mapContainer'+$data.postId).hide();
                        $('#likeBtn'+$data.postId).on("click",submitLike);
                        $('#dislikeBtn'+$data.postId).on("click", submitDislike);

                        $('#mapBtn'+$data.postId).on("click",displayMap);

                        $('#addComment'+$data.postId).on('keypress',submitComment);
                        $('#deleteIcon'+$data.postId).on('click',deletePost);



                    });


                }
            )
        }


        function deletePost(event){
            var $postId = event.target.getAttribute('data-postId');
            $.post('deletePost',{
                postId : $postId
            },function (responseJson){
                if(responseJson == 'successful'){

                    load_Posts();
                    alert('Post '+$postId+ 'deleted Successfully');
                }
            });


        }

        function submitLike(event){
            var $postId = event.target.getAttribute('data-postId');
            var $clicked  = event.target.getAttribute('data-clicked');
            var $previouslikes = parseInt(event.target.getAttribute('data-likes'));
            //if 0 it was not clicked so now do incremnt
            var $like;
            if($clicked == 0){
                $like = $previouslikes + 1;
            }else{
                $like = $previouslikes - 1;
            }

            $.post('likeDisklike',{
                postId: $postId,
                type : 'like',
                changeValue: $like

            },function (responseJson){
                if(responseJson == 'successful'){
                    $('#likeLabel'+$postId).html($like);

                    if($clicked == 0) {
                        $('#likeIcon'+$postId).addClass("blue");
                        $('#likeBtn'+$postId).attr('data-clicked',1);
                    }else{
                        $('#likeIcon'+$postId).removeClass("blue");
                        $('#likeBtn'+$postId).attr('data-clicked',0);
                    }

                }

            } );

        }

        function submitDislike(event){
            var $postId = event.target.getAttribute('data-postId');
            var $clicked  = event.target.getAttribute('data-clicked');
            var $previousDislikes = parseInt(event.target.getAttribute('data-dislikes'));
            //if 0 it was not clicked so now do incremnt
            var $dislike;
            if($clicked == 0){
                $dislike = $previousDislikes + 1;
            }else if(($clicked == 1)){
                $dislike = $previousDislikes - 1;
            }

            $.post('likeDisklike',{
                postId: $postId,
                type : 'dislike',
                changeValue: $dislike

            },function (responseJson){
                if(responseJson == 'successful'){
                    $('#dislikeLabel'+$postId).html($dislike);

                    if($clicked == 0) {
                        $('#dislikeIcon' + $postId).addClass("red");
                        $('#dislikeBtn'+$postId).attr("data-clicked",1);

                    }else{
                        $('#dislikeIcon' + $postId).removeClass("red");
                        $('#dislikeBtn'+$postId).attr('data-clicked',0);
                    }



                }

            } );

        }



        function submitComment(event){
            if(event.which == 13){
                var $postId = event.target.getAttribute('data-postId');
                $commentText =  $('#addComment'+$postId).val();
                // alert(  'Commented on: '+$commentText + ' Post: '+ $postId );
                $('#addComment'+$postId).val('');
                $.post('comment',{
                    commentText : $commentText,
                    postId : $postId,
                },function (responseJson){
                    if(responseJson == 'successful'){

                        $('#commentContainer'+$postId).show();
                        load_Comments($postId);
                    }
                });

            }
        }

        function load_Comments(postId){

            $.get('comment',{
                postId : postId,
            },function (responseJson){
                // if(responseJson == 'successful'){

                if($('#commentItems'+postId).has('.item')){
                    $('#commentItems'+postId).find('.item').remove();
                }

                $.each(responseJson,function (key, value){

                    commenthtml =
                        '                            <div class="item">\n' +
                        '                                <img class="ui  avatar image" src="https://semantic-ui.com/examples/assets/images/wireframe/image-text.png">\n' +
                        '                                <div class="middle aligned content">\n' +
                        '                                    <div class="ui grid">\n' +
                        '                                        <div class="eleven wide column">\n' +
                        '                                            <label>'+value.traveler.firstName+' '+value.traveler.lastName+'</label>\n' +
                        // '                                            <a class="header">12 Years a Slave</a>\n' +
                        '                                        </div>\n' +
                        '                                        <div class="five wide column">\n' +
                        // '                                            <div class="Right floated left aligned column">12/02/2020</div>\n' +
                        '                                        </div>\n' +
                        '                                    </div>\n' +
                        '                                    <p>\n' +
                        value.text +
                        '                                    </p>\n' +
                        '                                </div>\n' +
                        '                            </div>\n' ;

                    $('#commentItems'+postId).append( commenthtml);
                });


            });


        }


        function displayComment(event){

            var $postId = event.target.getAttribute('data-postId');
            $('#commentContainer'+$postId).toggle();

        }


        function displayMap(event){
            $postId = event.target.getAttribute('data-postId');

            longitude = parseFloat(event.target.getAttribute('data-lat'));
            latitude = parseFloat(event.target.getAttribute('data-long'));

            $('#map').show();

            initMap(latitude,longitude);

        }

        function getLocation() {
            if (navigator.geolocation) {

                navigator.geolocation.getCurrentPosition(showPosition);
            }
        }


        function showPosition(position) {
            $latitude = position.coords.latitude
            $longitude = position.coords.longitude;

        }


        function initMap(latitude,longitude) {
            // The location of Uluru

            const uluru = { lat: latitude , lng: longitude };
            // The map, centered at Uluru
            const map = new google.maps.Map(document.getElementById("map"), {
                zoom: 4,
                center: uluru,
            });
            // The marker, positioned at Uluru
            const marker = new google.maps.Marker({
                position: uluru,
                map: map,
            });
        }


    </script>

    <style>
        .myMap {
            height: 200px;
            /* The height is 400 pixels */
            width: 80%;
            margin: auto;
        }
    </style>
</head>
<body>


<div class="ui block header" id="header1" style="background-color: #18B7BE;">
    <div class=" ui center aligned header" style="color: #ffffff;">  Profile Page</div>

    <div class="ui pointing menu middlebar" style="background-color: #178CA4;" >
        <a href="travelerHomePage.jsp" class="item" style="color: #F9F7F0;">
            Home
        </a>
        <a href="#" class="active item" style="color: #F9F7F0;">
            Profile
        </a>
        <a href="weather.jsp" class="item" style="color: #F9F7F0;">
            Weather Service
        </a>

        <a href="logout" class="right floated item" style="color: #F9F7F0;">
            Logout
        </a>
    </div>
</div>

<div id="map" class="myMap"></div>

<div class="ui container">
    <div class="ui segments">
        <div class="ui segment">
            <h3 class="ui center aligned header">${sessionScope.traveler.firstName} Profile </h3>
        </div>

        <div class ="ui container" >
            <div class="ui segment form">
                <div class = "column">

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



                    <form class ="ui form" action="updatedetail" method="post" id="validate2">
                        <div class="three fields">
                            <div class="field">
                                <label>First name</label>
                                <input type="text" name="firstname" value="${sessionScope.traveler.firstName}" >
                            </div>
                            <div class="field">
                                <label>Middle name</label>
                                <input type="text" name="middlename"  value="${sessionScope.traveler.middleName}">
                            </div>
                            <div class="field">
                                <label>Last name</label>
                                <input type="text" name="lastname"  value="${sessionScope.traveler.lastName}">
                            </div>
                        </div>



                        <div>
                            <div class="three fields">
                                <div class="field">
                                    <label>State</label>
                                    <input type="text" name="state"  value="${sessionScope.traveler.address.state}">
                                </div>
                                <div class="field">
                                    <label>City</label>
                                    <input type="text"  name="city" value="${sessionScope.traveler.address.city}">
                                </div>
                                <div class="field">
                                    <label>Street</label>
                                    <input type="text" name="street" value="${sessionScope.traveler.address.street}">
                                </div>
                            </div>
                        </div>



                        <div class="three fields">
                            <div class="field">
                                <label>Zip Code</label>
                                <input type="text" name="zipcode" value="${sessionScope.traveler.address.zipcode}">
                            </div>

                            <div class="field">
                                <label>Birth year</label>
                                <input type="text" name="birthyear" value="${sessionScope.traveler.birthYear}">
                            </div>
                            <div class="field">
                                <label>Gender</label>
                                <select value="${sessionScope.traveler.gender}">
                                    <option value="">Select Gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                        </div>

                        <div class="one fields">
                            <div class="field">
                                <div class="ui primary submit blue button left floated" name="btn2">
                                    Update Details
                                </div>
                            </div>
                        </div>
                    </form>




                    <div class="one fields">
                        <div class="five field wide">
                            <label>Email</label>
                            <div class="ui left icon input">
                                <input type="email" name="email"  value="${sessionScope.traveler.email}" readonly>
                                <i class="user icon"></i>
                            </div>
                        </div>
                    </div>

                    <form class="ui form" action='updatepassword' method="POST" id="validate1">

                        <div class ="ui segment"> <h3 class="ui left aligned header">Change Password </h3></div>
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
                            <div class="error message"><div>
                            </div>
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
            <div class="ui relaxed divided items" id="postList">
                <!-- Individual Posts goes here -->
<%--                <div style="min-width: 35%;" class="ui centered card">--%>
<%--                    <div class="content">--%>
<%--                        <div class="right floated meta">14h</div>--%>
<%--                        <img class="ui avatar image" src="https://semantic-ui.com/images/avatar2/large/kristy.png"> Elliot--%>
<%--                    </div>--%>
<%--                    <div class="image">--%>
<%--                        <img src="https://semantic-ui.com/examples/assets/images/wireframe/image-text.png">--%>
<%--                    </div>--%>
<%--                    <div class="content">--%>
<%--                        <div class="ui justified container">--%>
<%--                            <p>--%>
<%--                                This is the post text content and it is kjabfkvksljbavljbv jaljkvbaljvbhaj hkjklgjadhajlhvlkj kljaghkj  ghakjlgh kjh--%>
<%--                                Lorem, ipsum dolor sit amet consectetur adipisicing elit. Repudiandae ut quidem corrupti adipisci, ipsa minus aliquam laboriosam ab voluptates pariatur blanditiis laborum ex ipsum saepe perferendis esse voluptatum non magnam.--%>

<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="content">--%>

<%--                        <div class="ui grid">--%>

<%--                            <div class="four wide column">--%>
<%--                                <button class="circular ui icon button">--%>
<%--                                    <i class="thumbs up icon"></i>--%>
<%--                                </button>--%>
<%--                                <label>17</label>--%>
<%--                            </div>--%>
<%--                            <div class="four wide column">--%>
<%--                                <button class="circular ui icon button">--%>
<%--                                    <i class="thumbs down icon"></i>--%>
<%--                                </button>--%>


<%--                                <label>1</label>--%>
<%--                            </div>--%>
<%--                            <div class="four wide column">--%>
<%--                                <button class="circular ui icon button">--%>
<%--                                    <i class="comments icon"></i>--%>
<%--                                </button>--%>
<%--                                <!-- <a> comments</a> -->--%>

<%--                            </div>--%>
<%--                            <div class="four wide column">--%>
<%--                                <button class="ui icon button">--%>
<%--                                    <i class="map marker alternate red icon"></i>--%>
<%--                                    <!-- Location -->--%>
<%--                                </button>--%>


<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </div>--%>
<%--                    <div class="content">--%>
<%--                        <div class="ui items">--%>
<%--                            <div class="item">--%>
<%--                                <img class="ui  avatar image" src="https://semantic-ui.com/examples/assets/images/wireframe/image-text.png">--%>
<%--                                <div class="middle aligned content">--%>
<%--                                    <div class="ui grid">--%>
<%--                                        <div class="eleven wide column">--%>
<%--                                            <label>Traveler Name</label>--%>
<%--                                            <a class="header">12 Years a Slave</a>--%>
<%--                                        </div>--%>
<%--                                        <div class="five wide column">--%>
<%--                                            <div class="Right floated left aligned column">12/02/2020</div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <p>--%>
<%--                                        This is a comment section for users to comment on a post.--%>
<%--                                    </p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="item">--%>
<%--                                <img class="ui  avatar image" src="https://semantic-ui.com/examples/assets/images/wireframe/image-text.png">--%>
<%--                                <div class="middle aligned content">--%>
<%--                                    <div class="ui grid">--%>
<%--                                        <div class="eleven wide column">--%>
<%--                                            <label>Traveler Name</label>--%>
<%--                                            <a class="header">Name</a>--%>
<%--                                        </div>--%>
<%--                                        <div class="five wide column">--%>
<%--                                            <div class="Right floated left aligned column">12/02/2020</div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <p>--%>
<%--                                        A description which may flow for several lines and give context to the content.--%>
<%--                                    </p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="content">--%>
<%--                        <div class="ui large transparent left icon input">--%>
<%--                            <i class="comment outline icon"></i>--%>
<%--                            <input type="text" placeholder="Add Comment...">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

            </div>

        </div>

    </div>
</div>
</div>
</body>
<script>
    $(document).ready(function() {
        $('#validate2')
            .form({
                fields: {
                    firstname: 'empty',
                    middlename: 'empty',
                    lastname: 'empty',
                    state: 'empty',
                    city: 'empty',
                    street: 'empty',
                    zipcode: 'empty'
                }
            }, {
                onSuccess: function (e) {
                    e.prventDefault(e);
                }
            });
    })
    $(document).ready(function(){
        $('#validate1')
            .form({
                    fields: {
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






</html>
