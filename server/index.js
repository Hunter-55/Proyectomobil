const path = require('path');
const express = require('express');
const app = express();
const socket = require('socket.io');

app.set('port', process.env.PORT || 3000);

app.use(express.static(path.join(__dirname, 'public')));

const server = app.listen(app.get('port'), () => {
    console.log("iniciado puerto: ", app.get('port'), "");
});
const io = socket(server);


UserOnId = new Array();
IdOnUser = new Array();

io.on('connection', (socket) => {

    //personas conectadas
    console.log("connected: ", socket.id, " :", socket.address);

    /*socket.on("test",text=>{
        console.log(text);
        socket.emit("mobil","conectado al server");
    });*/

    //cordenadas
    socket.on('latlng',(latitude, longitude, nombreusuario)=>{
        userId = socket.id;
        user = nombreusuario

        io.emit("coords",{latitude:latitude,longitude:longitude,nombre:nombreusuario});

        if(IdOnUser[user] === null)
        {
            UserConnected({nombre:nombreusuario,id:userId});
        }
    });

    //alerta
    socket.on('alert',function(latitude,
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
            io.emit("alertuser",latitude,
            logitude,
            nombre,
            paterno,
            materno,
            direccion,
            sexo,
            edad,
            fecha,
            telefono,
            correo);
    });

    //ayuda
    socket.on("help",function(latitude,
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
            console.log(logitude);
            io.emit("help2",(latitude,
                logitude,
                nombre,
                paterno,
                materno,
                direccion,
                sexo,
                edad,
                fecha,
                telefono,
                correo));
        });
   
/******************** [ socket desconnect ] ***********************/
    socket.on('disconnect', function() {
        console.log("############# usuarios desconectaods ###########");
        console.log(' has disconnected ' + socket.id);
    });//cierre de "disconnect"

});//cierre de conexion socket



function UserConnected(info)
{
    user = info.nombre;
    id_socket = info.id;
    //se guarda usuario por id
    UserOnId[id_socket] = user;
    //guardar id por usuario
    if(IdOnUser[user] === null)
    {
        IdOnUser[user] = new Array();
    }
    IdOnUser[user].push(id_socket);

}