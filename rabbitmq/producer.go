package rabbit

import (
	"fmt"

	"github.com/streadway/amqp"
)

func Producer() {
	fmt.Println("RabbitMQ in Golang: Getting started tutorial")

	connection, err := amqp.Dial("amqp://guest:guest@localhost:5672")
	if err != nil {
		panic(err)
	}
	defer connection.Close()
	fmt.Println("Successfully connected to RabbitMQ instance")

	channel, err := connection.Channel()
	if err != nil {
		panic(err)
	}
	defer channel.Close()

	queue, err := channel.QueueDeclare(
		"testing",
		false,
		false,
		false,
		false,
		nil,
	)
	if err != nil {
		panic(err)
	}

	err = channel.Publish(
		"",        //exchange
		"testing", //Key
		false,
		false,
		amqp.Publishing{
			ContentType: "text/plain",
			Body:        []byte("Test Message send to consumer"),
		},
	)
	if err != nil {
		panic(err)
	}
	fmt.Println("Queue status: ", queue)
	fmt.Println("Successfully published message")
}
