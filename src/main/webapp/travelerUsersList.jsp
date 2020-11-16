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
    <link href="jsp.css" type="text/css" rel="stylesheet" />

    <script src="<c:url value = "/js/travelersList.js"/>"></script>

</head>
<body>

<%!     TravelerDao travelerDao = new TravelerDao();
        List<Traveler> travelerList = travelerDao.getAllTraveler();  %>

<sript src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js">

</sript>

<script>
    $(document).ready(function() {
        $('#country').change(function(event) {
            var $country = $("select#country").val();
            $.get('ActionServlet', {
                countryname : $country
            }, function(responseJson) {
                var $select = $('#states');
                $select.find('option').remove();
                $.each(responseJson, function(key, value) {
                    $('<option>').val(key).text(value).appendTo($select);
                });
            });
        });
    });
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
                    <!-- <div class="ui segment"> -->
                    <!-- <div class="ui form">
                        <div class="ui transparent icon input">
                            <input type="text" placeholder="Search...">
                            <i class="search link icon"></i>
                        </div>
                    </div> -->
                    <!-- <div class="ui input"><input type="text" placeholder="Search..."><i class="search link icon"></i></div> -->
                    <div class="ui category search">
                        <div class="ui icon input">
                            <input class="prompt" type="text" placeholder="Search Traveler...">
                            <i class="search icon"></i>
                        </div>
                        <div class="results"></div>
                    </div>
                    <!-- </div> -->
                </div>


                <div class="right floated left aligned three wide column">

                    <div class="ui form">
                        <div class="field">
                            <select>
                                <option value="">All Users</option>
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
            <div class="ui relaxed divided items">
<%--                Indivdual Traveler record--%>
                <% for(Traveler traveler: travelerList) { %>
                <div class="item">
                    <!-- This link should take to user profile page -->
                    <a href="#" class="ui small circular image">
                        <img src="<%=traveler.getProfilePicUrl()%>>">
                    </a>

                    <div class="content">
                        <!-- This link should take to user profile page -->
                        <a href="www.google.com" class="header"><%=traveler.getFullName()%>Traveler Name</a>
                        <div class="meta">
                            <label><%=traveler.getBirthYear()%> Birth Year</label>
                        </div>
                        <div class="meta">
                            <label><%=traveler.getGender()%>Gender</label>
                        </div>
                        <div class="description">

                            A description which may flow for several lines and give context to the content.
                            <%=traveler.getTravelerId()%>
                        </div>
                        <div class="extra">
                            <%  if(traveler.isActive()){ %>
                            <div class="ui right floated inverted red button">
                                Deactivate
                            </div>
                            <div class="ui right floated inverted red disabled button">
                                Activate
                            </div>
                            <% } else{%>
                            <div class="ui right floated inverted red disabled button">
                                Deactivate
                            </div>
                            <div class="ui right floated inverted red button">
                                Activate
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>

            <% } %>

            </div>

        </div>

    </div>

</div>
</div>


</body>
</html>