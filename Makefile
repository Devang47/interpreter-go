.PHONY: help build run test test-verbose test-coverage clean fmt vet lint install deps tidy repl api docker-build docker-run

# Default target
.DEFAULT_GOAL := help

# Variables
BINARY_NAME=bananascript
API_BINARY_NAME=bananascript-api
COVERAGE_FILE=coverage.out
COVERAGE_HTML=coverage.html

# Build the main REPL application
build:
	@echo "Building $(BINARY_NAME)..."
	@go build -o $(BINARY_NAME) main.go

# Build the API server
build-api:
	@echo "Building $(API_BINARY_NAME)..."
	@go build -o $(API_BINARY_NAME) api/main.go

# Build both applications
build-all: build build-api

# Run the REPL
run:
	@echo "Starting BananaScript REPL..."
	@go run main.go

# Run the API server
run-api:
	@echo "Starting BananaScript API server..."
	@go run api/main.go

# Start REPL with built binary
repl: build
	@echo "Starting BananaScript REPL..."
	@./$(BINARY_NAME)

# Start API with built binary
api: build-api
	@echo "Starting BananaScript API server..."
	@./$(API_BINARY_NAME)

# Run all tests
test:
	@echo "Running tests..."
	@go test ./...

# Run tests with verbose output
test-verbose:
	@echo "Running tests with verbose output..."
	@go test -v ./...

# Run tests with race detection
test-race:
	@echo "Running tests with race detection..."
	@go test -race ./...

# Run tests with coverage
test-coverage:
	@echo "Running tests with coverage..."
	@go test -coverprofile=$(COVERAGE_FILE) ./...
	@go tool cover -html=$(COVERAGE_FILE) -o $(COVERAGE_HTML)
	@echo "Coverage report generated: $(COVERAGE_HTML)"

# Show coverage in terminal
coverage-func: test-coverage
	@go tool cover -func=$(COVERAGE_FILE)

# Run tests like CI
test-ci:
	@echo "Running CI tests..."
	@go test -v -race -coverprofile=$(COVERAGE_FILE) ./...

# Format code
fmt:
	@echo "Formatting code..."
	@go fmt ./...

# Run go vet
vet:
	@echo "Running go vet..."
	@go vet ./...

# Run both fmt and vet
check: fmt vet

# Download dependencies
deps:
	@echo "Downloading dependencies..."
	@go mod download

# Verify dependencies
verify:
	@echo "Verifying dependencies..."
	@go mod verify

# Tidy dependencies
tidy:
	@echo "Tidying dependencies..."
	@go mod tidy

# Install tools (if you add any in the future)
install-tools:
	@echo "Installing development tools..."
	# Add tool installations here when needed
	# @go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	@rm -f $(BINARY_NAME) $(API_BINARY_NAME)
	@rm -f $(COVERAGE_FILE) $(COVERAGE_HTML)
	@rm -rf tmp/

# Run benchmarks (if you add any)
bench:
	@echo "Running benchmarks..."
	@go test -bench=. ./...

# Build for multiple platforms
build-cross:
	@echo "Building for multiple platforms..."
	@GOOS=linux GOARCH=amd64 go build -o $(BINARY_NAME)-linux-amd64 main.go
	@GOOS=windows GOARCH=amd64 go build -o $(BINARY_NAME)-windows-amd64.exe main.go
	@GOOS=darwin GOARCH=amd64 go build -o $(BINARY_NAME)-darwin-amd64 main.go
	@GOOS=darwin GOARCH=arm64 go build -o $(BINARY_NAME)-darwin-arm64 main.go

# Docker build (if you want to add Docker support)
docker-build:
	@echo "Building Docker image..."
	@docker build -t bananascript .

# Docker run (if you want to add Docker support)
docker-run:
	@echo "Running Docker container..."
	@docker run -it --rm bananascript

# Development setup
setup: deps verify tidy
	@echo "Development setup complete!"

# Full development workflow
dev: clean setup check test
	@echo "Development workflow complete!"

# Release build (optimized)
release: clean
	@echo "Building release version..."
	@go build -ldflags="-s -w" -o $(BINARY_NAME) main.go
	@go build -ldflags="-s -w" -o $(API_BINARY_NAME) api/main.go

# Help target
help:
	@echo "BananaScript Interpreter - Available Make Targets:"
	@echo ""
	@echo "Building:"
	@echo "  build       - Build the REPL application"
	@echo "  build-api   - Build the API server"
	@echo "  build-all   - Build both applications"
	@echo "  build-cross - Build for multiple platforms"
	@echo "  release     - Build optimized release versions"
	@echo ""
	@echo "Running:"
	@echo "  run         - Run the REPL with go run"
	@echo "  run-api     - Run the API server with go run"
	@echo "  repl        - Build and run the REPL"
	@echo "  api         - Build and run the API server"
	@echo ""
	@echo "Testing:"
	@echo "  test        - Run all tests"
	@echo "  test-verbose- Run tests with verbose output"
	@echo "  test-race   - Run tests with race detection"
	@echo "  test-coverage- Run tests and generate coverage report"
	@echo "  coverage-func- Show coverage in terminal"
	@echo "  test-ci     - Run tests like CI pipeline"
	@echo "  bench       - Run benchmarks"
	@echo ""
	@echo "Code Quality:"
	@echo "  fmt         - Format code with go fmt"
	@echo "  vet         - Run go vet"
	@echo "  check       - Run fmt and vet"
	@echo ""
	@echo "Dependencies:"
	@echo "  deps        - Download dependencies"
	@echo "  verify      - Verify dependencies"
	@echo "  tidy        - Tidy dependencies"
	@echo ""
	@echo "Development:"
	@echo "  setup       - Setup development environment"
	@echo "  dev         - Full development workflow"
	@echo "  clean       - Clean build artifacts"
	@echo ""
	@echo "Docker:"
	@echo "  docker-build- Build Docker image"
	@echo "  docker-run  - Run Docker container"
	@echo ""
	@echo "Other:"
	@echo "  help        - Show this help message"
