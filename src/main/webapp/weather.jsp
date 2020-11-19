<%--
  Created by IntelliJ IDEA.
  User: esuab
  Date: 11/19/2020
  Time: 1:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">

    <style> <%@ include file="WEB-INF/css/weather.css" %></style>

    <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnyRtUCJIj3MdcA2we04xgGr-EZj9SYY8&callback=initMap&libraries=&v=weekly"
            defer
    ></script>
</head>
<body>

<div class="ui block header" id="header1" style="background-color: #18B7BE;">
    <div class=" ui center aligned header" style="color: #ffffff;"> Weather Info </div>

    <div class="ui pointing menu middlebar" style="background-color: #178CA4;" >
        <a href="travelerHomePage.jsp" class=" item" style="color: #F9F7F0;">
            Home
        </a>
        <a href="userProfile.jsp" class="item" style="color: #F9F7F0;">
            Profile
        </a>
        <a href="#" class="item" style="color: #F9F7F0;">
            Weather Service
        </a>

        <a href="logout" class="right floated item" style="color: #F9F7F0;">
            Logout
        </a>
    </div>
</div>

<div id="map"></div>

<div class="component__weather-box">
    <div class="component__weather-content">
        <div class="weather-content__overview"></div>
        <div class="weather-content__temp"></div>
    </div>
    <div class="component__forecast-box"></div>
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

<%--    <script  src="js/weather.js" type="text/javascript"> </script>--%>
<script>
    const CURRENT_LOCATION = document.getElementsByClassName('weather-content__overview')[0];
    const CURRENT_TEMP = document.getElementsByClassName('weather-content__temp')[0];
    const FORECAST = document.getElementsByClassName('component__forecast-box')[0];



    const appid = 'e43f64ee98be9268f7a7f49e34aecfdf'; //  API KEY

    // Use Fetch API to GET data from OpenWeather API
    function getWeatherData(position) {
        const URL = `https://api.openweathermap.org/data/2.5/forecast/daily?${position}&cnt=5&units=imperial&APPID=${appid}`;

        return fetch(URL, {
            method: 'GET',
        }).then(data => data.json());
    }

    renderData = (location, forecast) => {
        const currentWeather = forecast[0].weather[0];
        const widgetHeader = `<h1>${location.name}</h1><small>${currentWeather.description}</small>`;
        CURRENT_TEMP.innerHTML = ` ${Math.round(forecast[0].temp.day)} <span>&#8457;</span>`;
        CURRENT_LOCATION.innerHTML = widgetHeader;

        forecast.forEach(day => {
            let date = new Date(day.dt * 1000);
            let days = ['Sun', 'Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat'];
            let name = days[date.getDay()];
            let dayBlock = document.createElement("div");
            dayBlock.className = 'forecast__item';
            dayBlock.innerHTML = `<div class="forecast-item__heading">${name}</div>
      <div class="forecast-item__info"> <span class="degrees">${Math.round(day.temp.day)} <span>&#8457;</span></span></div>`;
            // °F
            FORECAST.appendChild(dayBlock);
        });
    }


    if ("geolocation" in navigator) {
        navigator.geolocation.getCurrentPosition((position) => {
            const coordinates = `lat=${position.coords.latitude}&lon=${position.coords.longitude}`;
            getWeatherData(coordinates).then(weatherData => {
                const city = weatherData.city;
                const dailyForecast = weatherData.list;

                renderData(city, dailyForecast);
            });
        }, e => console.log(e));
    } else {
        console.log('unable to retrieve location from browser')
    }


    var latitude , longitude;


    navigator.geolocation.getCurrentPosition(showPosition);

    function showPosition(position) {
        latitude = position.coords.latitude
        longitude = position.coords.longitude;
        initMap(latitude, longitude);

    }

    function initMap(latitude, longitude) {

        const currentloc = { lat: latitude, lng: longitude
        };
        const map = new google.maps.Map(document.getElementById("map"), {
            zoom: 4,
            center: currentloc,
        });
        const marker = new google.maps.Marker({
            position: currentloc,
            map: map,
        });
    }

</script>

</body>
</html>

