package main

import (
	"fmt"
)

func display(count map[string]int) {
	for k, v := range count {
		fmt.Printf("%s:%d\n", k, v)
	}
}
