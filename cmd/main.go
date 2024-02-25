package main

import (
	"fmt"

	rabbitmq "go/pm/rabbitmq"
)

func main() {
	fmt.Println("Hello World!")
	rabbitmq.Producer()
}
