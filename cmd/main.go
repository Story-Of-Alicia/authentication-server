package main

import (
	"log"
	"soaauth/internal/api"
	"soaauth/internal/config"
)



func main() {
	log.SetFlags(log.LstdFlags | log.Lshortfile)
	config := config.GetConfigInstance()

	server, err := api.NewAPIServer(config.Address);
	

	if err != nil {
		panic(err)
	}

	server.Serv();
}
