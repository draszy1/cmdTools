package main

import (
	"fmt"
	"os"
)

func main() {

	if !filePathProvided() {
		fmt.Println("No file provided in the argument.")
		return
	}

	readFile, err := os.Open(os.Args[1])

	if err != nil {
		fmt.Println("Can not open the file: " + os.Args[1])
		return
	}

	defer readFile.Close()

	count := scanAndCount(readFile)
	display(count)
}

func filePathProvided() bool {
	return len(os.Args) > 1
}
