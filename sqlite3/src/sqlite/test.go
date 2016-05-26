package main

import (
	"fmt"
	"github.com/mattn/go-sqlite3"
)

func main() {
	c, _ := sqlite3.Open("sqlite.db")
	fmt.Println("c is ", c)
}
