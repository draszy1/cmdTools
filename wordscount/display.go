package main

import (
	"fmt"
)

func display(count map[string]int) {
	for k, v := range count {
		if v == 1 || len(k) == 1 {
			continue
		}
		fmt.Printf("%s:%d\n", k, v)
	}
}
