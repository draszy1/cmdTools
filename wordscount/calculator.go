package main

import (
	"bufio"
	"os"
	"regexp"
	"strings"
)

func scanAndCount(readFile *os.File) map[string]int {
	scanner := bufio.NewScanner(readFile)
	scanner.Split(bufio.ScanWords)
	wordCounts := make(map[string]int)

	for scanner.Scan() {
		word := removeNonLetters(strings.ToLower(scanner.Text()))
		wordCounts[word]++
	}

	return wordCounts
}

func removeNonLetters(text string) string {
	var nonAlphanumericRegex = regexp.MustCompile(`[^a-z ]+`)

	return nonAlphanumericRegex.ReplaceAllString(text, "")
}
