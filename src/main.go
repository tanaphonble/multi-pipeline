package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

const appVersion = "v19.0"

func main() {
	fmt.Println("app ", appVersion)

	r := gin.Default()
	r.GET("/ping", pong)
	r.Run(":3000")
}

func pong(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"message": "pong",
		"version": appVersion,
	})
}
