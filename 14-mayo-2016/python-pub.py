#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''  
Ejemplo PUB ZeroMQ - Taller De Sabado 14 mayo 2016
Autor: Camilo Chacón Sartori
'''

import zmq
import time
import datetime

context = zmq.Context()
socket = context.socket(zmq.PUB)
socket.bind("tcp://127.0.0.1:6001")

channel = "TallerDeSabado"

while True:
    message = "Hola Taller de Sabado desde Python - Hora de envío: " + str(datetime.datetime.now().time())
    socket.send_multipart([channel, message])
    time.sleep(1)
