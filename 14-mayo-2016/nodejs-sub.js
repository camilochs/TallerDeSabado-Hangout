//Ejemplo Sub ZeroMQ - Taller de sabado 14 mayo 2016
//Autor: Camilo Chacón Sartori

var zeromq = require('zmq'),
    ipPort = 'tcp://127.0.0.1:6001', //Ip-port del socket a conectarse
    socket = zeromq.socket('sub'); //Se elige un socket de tipo SUB

var channel = "TallerDeSabado";
//Me suscribo a TallerDeSabado
socket.subscribe(channel);
//Se conecta a otro socket
socket.connect(ipPort);



socket.on('message', function(topic, message) {
    console.log("Node.JS -- [Channel: %s] Message: %s", topic.toString(), message.toString());
});
