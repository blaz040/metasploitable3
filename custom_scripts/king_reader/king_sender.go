package main

import (
	"fmt"
	"net"
	"os"
	"strconv"
	"time"
	"os/exec"
)

func main() {
	if len(os.Args) < 5 {
		fmt.Println("Usage: sendfile.exe <filepath> <server_ip> <port> <interval_seconds>")
		fmt.Println(`Example: sendfile.exe C:\kingofthehill.txt 10.172.0.100 9000 10`)
		// os.Exit(1)
	}

	filePath := `C:\kingofthehill.txt`
	serverIP := "10.172.0.102"
	port := "9000"
	intervalSec := 10

	if len(os.Args) >= 2 { filePath = os.Args[1] }
	if len(os.Args) >= 3 { serverIP = os.Args[2] }
	if len(os.Args) >= 4 { port = os.Args[3] }
	if len(os.Args) >= 5 {
		val, err := strconv.Atoi(os.Args[4])
		if err != nil || val <= 0 {
			fmt.Println("Error: interval_seconds must be a positive integer")
			os.Exit(1)
		}
		intervalSec = val
	}

	address := net.JoinHostPort(serverIP, port)
	interval := time.Duration(intervalSec) * time.Second

	fmt.Printf("Starting sender: file=%s target=%s interval=%ds\n", filePath, address, intervalSec)

	for {
		createFileIfNotExists(filePath)
		sendFile(filePath, address)
		print("Sleeping for " + strconv.Itoa(intervalSec) + " seconds...\n")
		time.Sleep(interval)
	}
}

func createFileIfNotExists(filePath string) {
	if _, err := os.Stat(filePath); os.IsNotExist(err) {
		// Create the file with content
		err := os.WriteFile(filePath, []byte("No King yet"), 0666)
		if err != nil {
			panic(err)
		}
		print("Created file: " + filePath + "\n")
	}
	// Grant full access to Everyone
	// cmd := exec.Command("icacls", filePath, "/grant", "Everyone:F")
	// var err = cmd.Run()
	// if err != nil {
	// 	panic(err)
	// }
	print("Granted full access to Everyone for file: " + filePath + "\n")

}

func sendFile(filePath, address string) {
	content, err := os.ReadFile(filePath)
	if err != nil {
		fmt.Printf("[%s] Error reading file %s: %v\n", timestamp(), filePath, err)
		return
	}

	conn, err := net.DialTimeout("tcp", address, 5*time.Second)
	if err != nil {
		fmt.Printf("[%s] Error connecting to %s: %v\n", timestamp(), address, err)
		return
	}
	defer conn.Close()

	_, err = conn.Write(content)
	if err != nil {
		fmt.Printf("[%s] Error sending data: %v\n", timestamp(), err)
		return
	}

	fmt.Printf("[%s] Sent %d bytes to %s\n", timestamp(), len(content), address)
}

func timestamp() string {
	return time.Now().Format("2006-01-02 15:04:05")
}