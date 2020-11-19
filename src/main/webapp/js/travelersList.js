$(document).ready(function () {

    /*Vanila XMLHttpRequest Way*/
    $('#xmlHttpBtn').click(function () {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                $('#xmlHttpDiv').append(this.responseText);
            }
        };
        xhttp.open('GET', 'http://localhost:8080/ajaxdemo_war/ajaxdemo', true);
        xhttp.send();
    });

    $(document).ajaxStart(function() {
        $("#loader").show();
    }).ajaxStop(function() {
        $("#loader").hide();
    });

    $("#btn1").click(function() {
        $.get("http://localhost:8080/ajaxdemo_war/ajaxdemo").done(function(data) {
            alert(data);
        }).fail(function(err) {
            alert(err);
        });
    });

    $("#signInBtn").click(function(event){
        event.preventDefault();
        $.ajax("LoginServlet", {
            "type" : "post",
            "data" : {
                "username" : $("input[name='username']").val(),
                "password" : $("input[name='password']").val(),
            }
        }).done(function(response) {
            if(response == "true") {
                $(".msg").html("Hi, "+$("input[name='username']").val()+". You logged in sussceefully!");
                $("form").hide();
            }
            else {
                $(".msg").html("Incorrect username or password! Please try again!");
            }
        }).fail(function() {
            console.log("Failed");
        })
    });




});