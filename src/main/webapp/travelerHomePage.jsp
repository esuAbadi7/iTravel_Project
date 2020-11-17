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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js">  </script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script>
        var $data;
        var $latitude , $longitude;
        $(document).ready(function() {

            load_Posts();
             $('#postBtn').on("click",do_post);
        });
        function load_Posts(){
            $.post('postAction',
                function (responseJson) {
                    var $postContainer = $('#postList');
                    $postContainer.find('.card').remove();
                    $.each(responseJson, function (key, value){

                        $data = value;
                        htmlContent =
                            '<div style="min-width: 35%;" class="ui centered card">\n' +
                            '                    <div class="content">\n' +
                            '                        <div class="right floated meta">'+value.postDate.time.hour+'hr</div>\n' +
                            '                        <img class="ui avatar image" src="https://semantic-ui.com/images/avatar2/large/kristy.png"> '+value.traveler.firstName+' '+value.traveler.lastName+' \n' +
                            '                    </div>\n' +
                            '                    <div id="imageContainer'+value.postId+'" class="image">\n' +
                            '                        <img src="https://semantic-ui.com/examples/assets/images/wireframe/image-text.png">\n' +
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
                            '                                <button id="likeBtn'+value.postId+'" data-postId="'+value.postId+'" class="circular ui icon button">\n' +
                            '                                    <i class="thumbs up icon"></i>\n' +
                            '                                </button>\n' +
                            '                                <label id="likeLabel'+value.postId+'">'+value.likes +'</label>\n' +
                            '                            </div>\n' +
                            '                            <div class="four wide column">\n' +
                            '                                <button id="dislikeBtn'+value.postId+'" data-postId="'+value.postId+'" class="circular ui icon button">\n' +
                            '                                    <i class="thumbs down icon"></i>\n' +
                            '                                </button>\n' +
                            '                                <label id="dislikeLabel'+value.postId+'" >'+value.dislikes +'</label>\n' +
                            '                            </div>\n' +
                            '                            <div class="four wide column">\n' +
                            '                                <button id="commentBtn'+value.postId+'" data-postId="'+value.postId+'" class="circular ui icon button">\n' +
                            '                                    <i class="comments icon"></i>\n' +
                            '                                </button>\n' +
                            '                                <!-- <a> comments</a> -->\n' +
                            '\n' +
                            '                            </div>\n' +
                            '                            <div class="four wide column">\n' +
                            '                                <button id="mapBtn'+value.postId+'" data-postId="'+value.postId+'" class="ui icon button">\n' +
                            '                                    <i class="map marker alternate red icon"></i>\n' +
                            '                                    <!-- Location -->\n' +
                            '                                </button>\n' +
                            '\n' +
                            '\n' +
                            '                            </div>\n' +
                            '                        </div>\n' +
                            '\n' +
                            '                    </div>\n' +
                            '                    <div id="commentContainer'+value.postId+'" class="content">\n' +
                            '                        <div class="ui items">\n' +
                            '                            <div class="item">\n' +
                            '                                <img class="ui  avatar image" src="https://semantic-ui.com/examples/assets/images/wireframe/image-text.png">\n' +
                            '                                <div class="middle aligned content">\n' +
                            '                                    <div class="ui grid">\n' +
                            '                                        <div class="eleven wide column">\n' +
                            '                                            <label>Traveler Name</label>\n' +
                            '                                            <a class="header">12 Years a Slave</a>\n' +
                            '                                        </div>\n' +
                            '                                        <div class="five wide column">\n' +
                            '                                            <div class="Right floated left aligned column">12/02/2020</div>\n' +
                            '                                        </div>\n' +
                            '                                    </div>\n' +
                            '                                    <p>\n' +
                            '                                        This is a comment section for users to comment on a post.\n' +
                            '                                    </p>\n' +
                            '                                </div>\n' +
                            '                            </div>\n' +
                            '                        </div>\n' +
                            '                    </div>\n' +
                            '\n' +
                            '                    <div class="content">\n' +
                            '                        <div class="ui large transparent left icon input">\n' +
                            '                            <i class="comment outline icon"></i>\n' +
                            '                            <input id="addComment'+value.postId+'"type="text" placeholder="Add Comment...">\n' +
                            '                        </div>\n' +
                            '                    </div>\n' +
                            '                </div>';

                        $postContainer.append(htmlContent);

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



                    });


                }
            )
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
            if(!$('#postText').val() ){
                $('#postText').addClass('error');
            }else{
                postText = $('#postText').val();
                getLocation();

                $.post('addPost', {
                    travelerId : $travelerId,
                    postText : postText,
                    latitude : $latitude,
                    longitude : $longitude

                }, function(responseJson) {
                    // After adding the post it should reload and display posts.
                    if(responseJson=='successful'){

                        load_Posts();
                    }

                });

            }




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

        // function change_activation (event){
        //
        //     var $traveler_email = event.target.getAttribute('data-email');
        //     var $buttonType = event.target.getAttribute('data-btn-type');
        //     var $travelerId = event.target.getAttribute('data-tId');
        //     var $status;
        //     if($buttonType == 'activate'){
        //         $status = true;
        //     }else{
        //         $status = false;
        //     }
        //
        //     $.post('activateUser', {
        //         travelerEmail : $traveler_email,
        //         status: $status
        //     },function(responseJson) {
        //         if(responseJson=='successful'){
        //             if($status == true){
        //                 $("#activate_btn_"+$travelerId).addClass("disabled");
        //                 $("#deactivate_btn_"+$travelerId).removeClass("disabled");
        //             }else{
        //                 $("#deactivate_btn_"+$travelerId).addClass("disabled");
        //                 $("#activate_btn_"+$travelerId).removeClass("disabled");
        //             }
        //         } else{
        //
        //         }
        //     });
        //
        //
        // }

    </script>
</head>
<body>


<div class="ui block header" id="header1" style="background-color: #18B7BE;">
    <div class=" ui center aligned header" style="color: #ffffff;">Welcome ${sessionScope.traveler.firstName}</div>

    <div class="ui pointing menu middlebar" style="background-color: #178CA4;" >
        <a class=" item" style="color: #F9F7F0;">
            Home
        </a>
        <a class="item" style="color: #F9F7F0;">
            Profile
        </a>
        <a class="item" style="color: #F9F7F0;">
            Requests
        </a>
    </div>
</div>


<div class="ui centered grid">
    <div class="ui  icon input "  id="yourmind">


        <textarea id="postText" name="textarea" cols="40" rows="2" placeholder=" What is on your mind...?">
        </textarea>

        <button id="postBtn" data-travelerId="${sessionScope.traveler.travelerId}"> post</button>
        <div class="ui right floated">
            <label for="attachmentName" class="ui icon button btn-file">
                <i class="paperclip icon"></i>
                <input type="file" id="attachmentName" name="attachmentName" style="display: none">
            </label>
        </div>

    </div>

</div>



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

</footer>



</body>
</html>
