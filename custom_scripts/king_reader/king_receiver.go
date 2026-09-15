package main

import (
	"fmt"
	"io"
	"net"
	"os"
	"time"
)

func main() {
	if len(os.Args) < 3 {
		fmt.Println("Usage: receiver.exe <port> <output_file>")
		fmt.Println("Example: receiver.exe 9000 team.txt")
		// os.Exit(1)
	}
	port := "9000"
	outFile := "team.txt"
	fmt.Println(len(os.Args))
	if len(os.Args) > 1 { port = os.Args[1] }
	if len(os.Args) > 2 { outFile = os.Args[2] }


	ln, err := net.Listen("tcp", ":"+port)
	if err != nil {
		fmt.Printf("Error listening on port %s: %v\n", port, err)
		os.Exit(1)
	}
	defer ln.Close()

	fmt.Printf("Listening on port %s, writing received data to %s\n", port, outFile)

	for {
		conn, err := ln.Accept()
		if err != nil {
			fmt.Printf("Error accepting connection: %v\n", err)
			continue
		}

		handleConnection(conn, outFile)
	}
}

func handleConnection(conn net.Conn, outFile string) {
	defer conn.Close()

	remoteAddr := conn.RemoteAddr().String()
	fmt.Printf("Connection from %s\n", remoteAddr)

	data, err := io.ReadAll(conn)
	if err != nil {
		fmt.Printf("Error reading from connection: %v\n", err)
		return
	}

	f, err := os.OpenFile(outFile, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		fmt.Printf("Error opening file %s: %v\n", outFile, err)
		return
	}
	defer f.Close()

	timestamp := time.Now().Format("2006-01-02 15:04:05")
	line := fmt.Sprintf("[%s] (%s) %s\n", timestamp, remoteAddr, string(data))

	n, err := f.WriteString(line)
	if err != nil {
		fmt.Printf("Error writing to file: %v\n", err)
		return
	}

	fmt.Printf("Appended %d bytes from %s to %s\n", n, remoteAddr, outFile)
}