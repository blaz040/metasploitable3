build_binary:
	@echo "Building Sender binary..."
	@GOOS=windows GOARCH=amd64 CGO_ENABLED=0 go1.20.14 build -o sender.exe king_sender.go 
	@echo "Sender Binary built successfully."
	@echo "Building Receiver binary..."
	@go build -o receiver king_receiver.go