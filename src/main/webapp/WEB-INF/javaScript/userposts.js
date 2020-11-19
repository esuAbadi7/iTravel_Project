

var $data;
var $latitude , $longitude;
$(document).ready(function() {

    load_Posts();
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
                    '<div style="min-width: 35%;" class="ui centered card">\n' +
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
                console.log("Dynamic latitide"+ value.location.latitude);

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
    // -91.96267
    // 41.00863
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





