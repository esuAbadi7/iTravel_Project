<%@ page import="com.itravel.model.Traveler" %>
<%@ page import="java.util.List" %>
<%@ page import="com.itravel.dao.TravelerDao" %><%--
  Created by IntelliJ IDEA.
  User: esuab
  Date: 11/15/2020
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

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
    $(document).ready(function() {
        $('#status').on("click",load_travelers);
        load_travelers();
    });

    function load_travelers(event){

            var $activeStatus = $("select#status").val();


            $.get('getTraveler', {
                status : $activeStatus
            }, function(responseJson) {
                // var $select = $('#states');
                // $select.find('option').remove();
                var $select = $('#travelersListContainer');
                $select.find('.item').remove();
                $.each(responseJson, function(key, value) {
                    // $('<option>').val(key).text(value).appendTo($select);
                    // $('.item').html(key).appendTo($select);
                    // const data = JSON.parse(value);
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
        },function(responseJson) {
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

<div class="ui pointing menu">
    <a class="item">
        Home
    </a>
    <a href="#" class="active item">
        Travelers Users
    </a>
    <a class="item">
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
            <h3 class="ui center aligned header">Travelers </h3>
            <div class="ui right aligned grid">
                <div class="left floated right aligned three wide column">
                    <div class="ui category search">
                        <div class="ui icon input">
                            <input class="prompt" type="text" placeholder="Search Traveler...">
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



</body>
</html>