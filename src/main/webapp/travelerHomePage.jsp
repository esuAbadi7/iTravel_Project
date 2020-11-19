<%--
  Created by IntelliJ IDEA.
  User: esuab
  Date: 11/16/2020
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title> iTravel Home Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
    <link href="home.css" type="text/css" rel="stylesheet" />
    <link href="header.css" type="text/css" rel="stylesheet" />

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js">  </script>

    <style>
        .myMap {
            height: 200px;
            /* The height is 400 pixels */
            width: 80%;
            margin: auto;
        }


    </style>



    <script>
        var $data;
        var $latitude , $longitude;
        $(document).ready(function() {

            load_Posts();
            load_friendSuggestion();
             $('#postBtn').on("click",do_post);
             $('#map').hide();
             $('#postSuccess').hide();
             $('#close').on("click",function() {
                 $('#postSuccess').hide()
             });

        });
        function load_Posts(){
            $.post('postAction',
                function (responseJson) {
                    var $postContainer = $('#postList');
                    $postContainer.find('.card').remove();
                    $.each(responseJson, function (key, value){

                        $data = value;
                        htmlContent =
                            '<div style="min-width: 50%;" class="ui centered card">\n' +
                            '                    <div class="content">\n' +
                            '                        <div class="right floated meta">'+value.postDate.time.hour+'hr</div>\n' +
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
                            // '                            <div class="item">\n' +
                            // '                                <img class="ui  avatar image" src="https://semantic-ui.com/examples/assets/images/wireframe/image-text.png">\n' +
                            // '                                <div class="middle aligned content">\n' +
                            // '                                    <div class="ui grid">\n' +
                            // '                                        <div class="eleven wide column">\n' +
                            // '                                            <label>Traveler Name</label>\n' +
                            // '                                            <a class="header">12 Years a Slave</a>\n' +
                            // '                                        </div>\n' +
                            // '                                        <div class="five wide column">\n' +
                            // '                                            <div class="Right floated left aligned column">12/02/2020</div>\n' +
                            // '                                        </div>\n' +
                            // '                                    </div>\n' +
                            // '                                    <p>\n' +
                            // '                                        This is a comment section for users to comment on a post.\n' +
                            // '                                    </p>\n' +
                            // '                                </div>\n' +
                            // '                            </div>\n' +
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



                    });


                }
            )
        }

        function load_friendSuggestion(){
            $.get('follow',
                function (responseJson) {
                    var $followContainer = $('#followContainer');
                    $followContainer.find('.item').remove();
                    var $data;

                    $.each(responseJson, function (key, value) {

                        console.log(value.firstName);
                        $data = value;
                        console.log(value.travelerId);
                        htmlContent = '<div class="item">' +
                            '                <img id="followImg'+value.travelerId+'" class="ui tiny image" src="'+value.profilePicUrl+'" alt="profile Image">' +
                            '                <div class="middle aligned content">'+value.firstName+' '+ value.middleName +' '+ value.lastName+'\n'+
                            '                    <button id="followBtn'+value.travelerId+'" data-tId="'+value.travelerId+'" class="blue button right floated"> Follow </button>\n' +
                            '                </div>\n' +
                            '            </div>';



                        $followContainer.append(htmlContent);


                        if($data.profilePicUrl.length == 0){
                            $("#followImg"+$data.travelerId).attr('src','https://semantic-ui.com/examples/assets/images/wireframe/image-text.png');
                        }

                        $("#followBtn"+$data.travelerId).on('click',followTraveler);

                    })
                })
        }

        function followTraveler(event){
            console.log("event trigerred"+ event);
            var $followeeId = event.target.getAttribute('data-tId');


            $.post('follow',{
                followeeId : $followeeId
            },function (responseJson){
               if(responseJson == 'successful'){
                   $('#postSuccess').find('.header').remove();
                   $('#postSuccess').find('.header').html("You have followed the traveler");
                   $('#postSuccess').show();
                   load_Posts();
                   load_friendSuggestion();
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
                        // $('#dislikeBtn'+$postId).attr('data-clicked',1);
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

        function do_post(event){
            var $travelerId = event.target.getAttribute('data-travelerId');
            // var latitude = 77;
            // var longitude = 88;
            var postText="";
            if(!$('#postText').val() && !$('#image').val() ){
                $('#yourmind').addClass('error');
            }else{
                postText = $('#postText').val();
                postImage = $('#image').val();
                alert($('#image').val());
                getLocation();

                var form = document.getElementById('the-form');
                // form.onsubmit = function() {
                    var formData = new FormData(form);

                    formData.append('file', file);

                    // var xhr = new XMLHttpRequest();
                    // // Add any event handlers here...
                    // xhr.open('POST', form.getAttribute('action'), true);
                    // xhr.send(formData);


                $.ajax({
                        url: 'addPost',
                        data: {
                            travelerId : $travelerId,
                            postText : postText,
                            postImage : formData
                            // latitude : $latitude,
                            // longitude : $longitude

                        },
                        cache: false,
                        contentType: 'multipart/form-data',
                        processData: true,
                        type: 'POST'}).done(function (response) {
                           console.log(response);
                    });


                // $.get('addPost', {
                //     travelerId : $travelerId,
                //     postText : postText,
                //     postImage : postImage,
                //     latitude : $latitude,
                //     longitude : $longitude
                //
                // }, function(responseJson) {
                //     // After adding the post it should reload and display posts.
                //     if(responseJson=='successful'){
                //         $('#postText').val('');
                //         $('#postSuccess').find('.header').remove();
                //         $('#postSuccess').find('.header').html("You have followed the traveler");
                //         $('#postSuccess').show();
                //         load_Posts();
                //     }
                //
                // });

            }




        }

        function displayMap(event){
            $postId = event.target.getAttribute('data-postId');

            longitude = parseFloat(event.target.getAttribute('data-lat'));
            latitude = parseFloat(event.target.getAttribute('data-long'));

            // $latitude = event.target.getAttribute('data-lat');
            // $longitude = event.target.getAttribute('data-long');

            console.log('postId of a map btn'+ event.target.getAttribute('data-postId'));
            console.log('latitude from tag passed'+ event.target.getAttribute('data-lat'));
            console.log('latitude from tag passed'+ event.target.getAttribute('data-long'));
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
</head>
<body>

<script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnyRtUCJIj3MdcA2we04xgGr-EZj9SYY8&callback=initMap&libraries=&v=weekly"
        defer
></script>


<div class="ui block header" id="header1" style="background-color: #18B7BE;">
    <div class=" ui center aligned header" style="color: #ffffff;">Welcome ${sessionScope.traveler.firstName}</div>

    <div class="ui pointing menu middlebar" style="background-color: #178CA4;" >
        <a href="#" class="active item" style="color: #F9F7F0;">
            Home
        </a>
        <a href="userProfile.jsp" class="item" style="color: #F9F7F0;">
            Profile
        </a>
        <a class="item" style="color: #F9F7F0;">
            Weather Service
        </a>
    </div>
</div>


<div id="map" class="myMap"></div>
<div id="postSuccess" class="ui success message">
    <i id="close" class="close icon"></i>
    <div class="header">
        Your have added a new Post.
    </div>
    <p>You can see your Post Now.</p>
</div>

<div class="ui centered grid">
    <div class="ui icon input"  id="yourmind">
        <form id="the-form" action="addPost" enctype="multipart/form-data">
        <textarea id="postText" name="textarea" cols="40" rows="2" placeholder=" What is on your mind...?"></textarea>

        <button type="submit" id="postBtn" data-travelerId="${sessionScope.traveler.travelerId}"> post</button>
        <div class="ui right floated">
            <label for="image" class="ui icon button btn-file">
                <i class="paperclip icon"></i>
                <input type="file" id="image" name="image" accept="image/*" style="display: none">
            </label>
        </div>
        </form>

    </div>

</div>


<div class="ui grid" style="background-color: #F9F7F0; width:99%">

    <div class="ten wide column">


        <div class="ui segment" style="background-color: #F9F7F0;" >

            <div class="ui container" style="background-color: #F9F7F0;">
                <div class="ui segment">
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
    <div class="six wide column" style="background-color: #F9F7F0;">

        <div class="ui left icon input">
            <input type="text" size="60"  placeholder="Search users...">
            <i class="users icon"></i>
            <button>Search</button>
        </div>

        <div class="ui divided items" id="followContainer">
            <div class="ui segment">
                <h4>Friend suggestions</h4>
            </div>
            <div class="item">
                <img class="ui tiny image" src="https://semantic-ui.com/examples/assets/images/wireframe/image-text.png">
                <div class="middle aligned content">
                    Their Name
                    <button class="button right floated"> Follow </button>
                </div>
            </div>

        </div>
    </div>
</div>










<footer class="footer-distributed" style="background-color:#178CA4;z-index: 1">

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
