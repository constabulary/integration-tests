package main

import (
	"code.google.com/p/go-sqlite/go1/sqlite3"
	"fmt"
)

func main() {
	c, _ := sqlite3.Open("sqlite.db")
	fmt.Println("c is ", c)
}
