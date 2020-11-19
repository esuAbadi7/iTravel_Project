<%@ page import="com.itravel.model.Traveler" %>
<%@ page import="java.util.List" %>
<%@ page import="com.itravel.dao.TravelerDao" %>
<%@ page import="com.itravel.model.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %><%--
  Created by IntelliJ IDEA.
  User: esuab
  Date: 11/15/2020
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        HttpSession httpSession = request.getSession();
        if (httpSession != null) {
            if (httpSession.getAttribute("admin") != null) {
                User admin = (User) httpSession.getAttribute("traveler");
                System.out.print("Hello, " + admin + "  Welcome to ur Profile");
            }else {
                response.sendRedirect("index.jsp");
            }
        }
    %>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
<%--    <link href="jsp.css" type="text/css" rel="stylesheet" />--%>

<%--    <script src="<c:url value = "/js/travelersList.js"/>"></script>--%>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

<%!     TravelerDao travelerDao = new TravelerDao();
        List<Traveler> travelerList = travelerDao.getAllTraveler();  %>

<sript src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js">

</sript>


<script>
    $(document).ready(function () {
        $(function () {
            $("#search").autocomplete({
                width: 300,
                max: 10,
                delay: 100,
                minLength: 1,
                autoFocus: true,
                cacheLength: 1,
                scroll: true,
                highlight: false,
                source: function (request, response) {
                    $.ajax({
                        url: 'getTraveler', //Here we will user the URL that we want to hit
                        type: 'post',
                        async: true,
                        cache: false,
                        data: {
                            searchText: request.term
                        },
                        beforeSubmit: function () {
                        },
                        success: function (response) {
                            if (response.status == 'OK') {
                                var data = response.suggestedKeywords; //Here populate data with fetched list
                                response(data);
                            } else {
                                alert("failed try again...");
                            }
                        },
                        error: function () {
                            alert('System error occured, please try again ...');
                        }
                    });
                }
            });
        });
    })
</script>



<script>
    $(document).ready(function() {
        $('#status').on("click",load_travelers);
        load_travelers();
    });

    function load_travelers(event){

            var $activeStatus = $("select#status").val();


            $.get('getTraveler', {
                status : $activeStatus
            }, function(responseJson) {

                var $select = $('#travelersListContainer');
                $select.find('.item').remove();
                $.each(responseJson, function(key, value) {

                    $data = value;
                    html = '<div id="'+value.travelerId+'"class="item"> ' +
                        '<a href="#" class="ui small circular image"> ' +
                        '<img src=""> ' +
                        '</a> ' +

                        '<div class="content">' +
                        '<!-- This link should take to user profile page --> ' +
                        '<a href="'+$data.travelerId+'" class="header">'+value.firstName+' '+value.middleName+' '+value.lastName+  '</a> ' +
                        '<div class="meta"> ' +
                        '<label>' +value.birthYear+'</label> ' +
                        '   </div> ' +
                        '<div class="meta"> ' +
                        '<label>' +value.gender+'</label> ' +
                        '</div> ' +
                        // '<div class="description">' +
                        //     'A description which may flow for several lines and give context to the content. ' +
                        // '</div> ' +
                        '<div class="extra"> ' +
                        '<div id="deactivate_btn_'+$data.travelerId+'"  data-tId ="'+$data.travelerId+'"  data-btn-type="deactivate"  data-email="'+$data.email+'" class="ui right floated inverted red button">' +
                        'Deactivate ' +
                        '</div> ' +
                        '<div id="activate_btn_'+$data.travelerId+'" data-tId ="'+$data.travelerId+'" data-btn-type="activate"  data-email="'+$data.email+'" class="ui right floated inverted red button">' +
                        'Activate ' +
                        '</div> ' +
                        '</div> ' +
                        '</div> ' +
                        '</div>';
                    $select.append(
                        html
                    );
                    if($data.isActive == true){
                        $("#activate_btn_"+$data.travelerId).addClass("disabled");

                    }else{
                        $("#deactivate_btn_"+$data.travelerId).addClass("disabled");
                    }
                    $("#activate_btn_"+$data.travelerId).on("click",change_activation);
                    $("#deactivate_btn_"+$data.travelerId).on("click",change_activation);

                });
            });
    }

    function change_activation (event){

        var $traveler_email = event.target.getAttribute('data-email');
        var $buttonType = event.target.getAttribute('data-btn-type');
        var $travelerId = event.target.getAttribute('data-tId');
        var $status;
        if($buttonType == 'activate'){
            $status = true;
        }else{
            $status = false;
        }

        $.post('activateUser', {
            travelerEmail : $traveler_email,
            status: $status
        },
        function(responseJson) {
           if(responseJson=='successful'){
               if($status == true){
                   $("#activate_btn_"+$travelerId).addClass("disabled");
                   $("#deactivate_btn_"+$travelerId).removeClass("disabled");
               }else{
                   $("#deactivate_btn_"+$travelerId).addClass("disabled");
                   $("#activate_btn_"+$travelerId).removeClass("disabled");
               }
           } else{

           }
        });


    }


</script>

<div class="ui block header" id="header1" style="background-color: #18B7BE;">
    <div class=" ui center aligned header" style="color: #ffffff;"> Weather Info </div>

    <div class="ui pointing menu middlebar" style="background-color: #178CA4;" >
        <a href="adminHome.jsp" class=" item" style="color: #F9F7F0;">
            Home
        </a>
        <a href="#" class="item" style="color: #F9F7F0;">
            Travelers List
        </a>
        <a href="adminWeather.jsp" class="item" style="color: #F9F7F0;">
            Weather Service
        </a>
        <a href="index.jsp" class="right floated item" style="color: #F9F7F0;">
            Logout
        </a>
    </div>
</div>



<div class="ui container">
    <div class="ui segments">
        <div class="ui segment">
            <h3 class="ui center aligned header">Travelers </h3>
            <div class="ui right aligned grid">
                <div class="left floated right aligned three wide column">
                    <div class="ui category search">
                        <div class="ui icon input">
                            <input id="search" class="prompt" type="text" placeholder="Search Traveler...">
                            <i class="search icon"></i>
                        </div>
                        <div class="results"></div>
                    </div>

                </div>

                <div class="right floated left aligned three wide column">
                    <div class="ui form">
                        <div class="field">
                            <select id="status">
                                <option value="2">All Users</option>
                                <option value="1">Active Users</option>
                                <option value="0">Deactive Users</option>
                            </select>
                        </div>
                    </div>

                </div>
            </div>



        </div>

    </div>

    <div class="ui segment">
        <div class="ui container">
            <div class="ui relaxed divided items" id ="travelersListContainer">
<%--                Indivdual Traveler record--%>
<%--                <% for(Traveler traveler: travelerList) { %>--%>
<%--                <div class="item">--%>
<%--                    <!-- This link should take to user profile page -->--%>
<%--                    <a href="#" class="ui small circular image">--%>
<%--                        <img src="<%=traveler.getProfilePicUrl()%>">--%>
<%--                    </a>--%>

<%--                    <div class="content">--%>
<%--                        <!-- This link should take to user profile page -->--%>
<%--                        <a href="www.google.com" class="header"><%=traveler.getFullName()%></a>--%>
<%--                        <div class="meta">--%>
<%--                            <label><%=traveler.getBirthYear()%> </label>--%>
<%--                        </div>--%>
<%--                        <div class="meta">--%>
<%--                            <label><%=traveler.getGender()%></label>--%>
<%--                        </div>--%>
<%--&lt;%&ndash;                        <div class="description">&ndash;%&gt;--%>

<%--&lt;%&ndash;                            A description which may flow for several lines and give context to the content.&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <%=traveler.getTravelerId()%>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--                        <div class="extra">--%>
<%--                            <%  if(traveler.isActive()){ %>--%>
<%--                                <div class="ui right floated inverted red button">--%>
<%--                                    Deactivate--%>
<%--                                </div>--%>
<%--                                <div class="ui right floated inverted red disabled button">--%>
<%--                                    Activate--%>
<%--                                </div>--%>
<%--                            <% } else{%>--%>
<%--                                <div class="ui right floated inverted red disabled button">--%>
<%--                                    Deactivate--%>
<%--                                </div>--%>
<%--                                <div class="ui right floated inverted red button">--%>
<%--                                    Activate--%>
<%--                                </div>--%>
<%--                            <% } %>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            <% } %>--%>

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