package main

import (
	"bufio"
	"os"
	"strings"
	"unicode"
)

func scanAndCount(readFile *os.File) map[string]int {
	fileScanner := bufio.NewScanner(readFile)
	fileScanner.Split(bufio.ScanLines)

	charCounts := make(map[string]int)

	for fileScanner.Scan() {
		word := fileScanner.Text()

		for i, c := range word {
			if !unicode.IsLetter(c) {
				continue
			}

			char := strings.ToUpper(string(word[i]))
			charCounts[char]++
		}
	}

	keys := make([]string, 0, len(charCounts))
	for k := range charCounts {
		keys = append(keys, k)
	}

	return charCounts
}
