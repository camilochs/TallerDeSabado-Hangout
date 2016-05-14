//Ejemplo Sub ZeroMQ - Taller de sabado 14 mayo 2016
//Autor: Camilo Chacón Sartori
package main

import (
	zmq "github.com/pebbe/zmq4"
	"fmt"
)

func main() {
	subscriber, _ := zmq.NewSocket(zmq.SUB)
	defer subscriber.Close()
	subscriber.Connect("tcp://localhost:6001")
	subscriber.SetSubscribe("TallerDeSabado")

	for {
		// Se extrae el canal de comunicación
		channel, _ := subscriber.Recv(0)
		// Se extrae el mensaje
		message, _ := subscriber.Recv(0)
		fmt.Printf("Golang -- [Channel: %s] Message: %s\n", channel, message)
	}
}

