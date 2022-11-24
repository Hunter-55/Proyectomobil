const socket = io();//cliente socket  cordenadasUsuarioSM

//mostramos el mapa
var map = L.map('map').setView([46.31658418182218,-111.62109375000001], 11);
L.tileLayer('https://{s}.tile.openstreetmap.de/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
}).addTo(map);


//map.locate({enableHighAccuracy: true});
//var cooo = map.on('locationfound',e =>{

    const coords = [25.441854455477056, -100.86058058127499];
    //mostrar la ubicacion de la web
    var marker = L.marker(coords).addTo(map);
    marker.bindPopup("me").openPopup();


    /********* mostrar la posicion del ususraio ********/
    var marker;//marcador del usuario
    var ListCoords = [];//se almacena temporalmente las cordenadas
    socket.on("coords",function(info){
        //console.log(info.latitude+" "+info.longitude+" "+info.nombre);

        //distancia de los centro respeto al mensaje enviado
        var distance1 = (map.distance([info.latitude,info.longitude],coords))/1000;

        // se cambia las cordenadas del usuario
        if(ListCoords.length != 0)
        {
          ListCoords.shift();
          marker.removeFrom(map);
        }

        ListCoords.push(info.latitude);
        marker = L.marker([info.latitude, info.longitude]).addTo(map);
        marker.bindPopup(info.nombre+" Distancia:\n"+distance1+" 'KM'").openPopup();
    
    });

    socket.on("alertuser",function(latitude,
        logitude,
        nombre,
        paterno,
        materno,
        direccion,
        sexo,
        edad,
        fecha,
        telefono,
        correo){
        document.getElementById('h0').innerHTML = latitude;
        document.getElementById('h1').innerHTML = logitude;
        document.getElementById('h2').innerHTML = nombre;
        document.getElementById('h3').innerHTML = paterno;
        document.getElementById('h4').innerHTML = materno;
        document.getElementById('h5').innerHTML = direccion;
        document.getElementById('h6').innerHTML = sexo;
        document.getElementById('h7').innerHTML = edad;
        document.getElementById('h8').innerHTML = fecha;
        document.getElementById('h9').innerHTML = telefono;
        document.getElementById('h10').innerHTML = correo;

        alert(
            "¡ALERTA! DE:\n"+
            nombre+" "+
            paterno+" "+
            materno+"\n"+
            latitude+","+
            logitude
            );

        L.polyline([[latitude, logitude],coords], {
            color: 'blue'
          }).addTo(map);
  

          L.Routing.control({
            color: 'yellow',
            waypoints: [[latitude, logitude],coords
            ]
          }).addTo(map);

    });


    //función onclick
    var popup = L.popup();
    function onMapClick(e) {
        popup
            .setLatLng(e.latlng)
            .setContent(e.latlng.lat.toString()+","+e.latlng.lng.toString())
            .openOn(map);
    }
    map.on('click', onMapClick);

//});