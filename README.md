# BananaScript Language Interpreter in Go


<p align="center">
  <a href="https://github.com/Devang47/interpreter-go/actions/workflows/test.yml/badge.svg"><img src="https://github.com/Devang47/interpreter-go/actions/workflows/test.yml/badge.svg" alt="GitHub Actions CI Status" /></a>
  <a href="https://kaos.sh/r/go-badge"><img src="https://kaos.sh/r/go-badge.svg" alt="GoReportCard" /></a>
  <a href="https://kaos.sh/c/go-badge"><img src="https://kaos.sh/c/go-badge.svg" alt="Coverage Status" /></a><br/>
  <a href="https://kaos.sh/y/go-badge"><img src="https://kaos.sh/y/a090e4e0d8e14e58bc9c7a5458c2803e.svg" alt="Codacy badge" /></a>
  <a href="https://kaos.sh/w/go-badge/codeql"><img src="https://kaos.sh/w/go-badge/codeql.svg" alt="GitHub Actions CodeQL Status" /></a>
</p>

A complete interpreter implementation for the BananaScript programming language, built from scratch in Go. This project follows the excellent book ["Writing an Interpreter in Go"](https://interpreterbook.com/) by Thorsten Ball.

## 📊 Project Status

**70% Complete** - Core interpreter functionality implemented with room for additional features and optimizations.

## 🚀 Features

### Implemented ✅

- **Lexical Analysis**: Complete tokenization of BananaScript source code
- **Parsing**: Recursive descent parser with operator precedence
- **AST Generation**: Abstract Syntax Tree construction and traversal
- **Expression Evaluation**: Support for arithmetic, boolean, and comparison operations
- **Control Flow**: If-else expressions with proper scoping
- **Variable Binding**: Let statements with environment-based variable storage
- **Function Definitions**: First-class functions with lexical scoping
- **Function Calls**: Support for function invocation with arguments
- **Return Statements**: Early returns with proper value propagation
- **Error Handling**: Comprehensive error reporting and propagation
- **REPL**: Interactive Read-Eval-Print Loop for live coding
- **CI/CD Pipeline**: Automated testing with GitHub Actions

### Language Features Supported

```js
// Variables
let x = 5;
let y = 10;

// Functions
let add = fn(a, b) { a + b; };
let result = add(x, y);

// Control flow
if (x < y) {
    return "x is smaller";
} else {
    return "y is smaller or equal";
}

// Complex expressions
let factorial = fn(n) {
    if (n == 0) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
};
```

## 🛠️ Tools & Technologies

### Core Technologies

- **Go 1.22.2**: Modern Go with latest language features
- **Standard Library**: Pure Go implementation without external dependencies

### Development Practices

- **Test-Driven Development (TDD)**: Comprehensive test suite with >90% coverage
- **Modular Architecture**: Clean separation of concerns across packages
- **Interface-Driven Design**: Extensible architecture using Go interfaces
- **Error Handling**: Idiomatic Go error handling patterns
- **Memory Management**: Efficient object allocation and garbage collection
- **Continuous Integration**: Automated testing with GitHub Actions

### Testing Strategy

- **Unit Tests**: Individual component testing
- **Integration Tests**: End-to-end interpreter testing
- **Parser Testing**: Extensive AST validation
- **Evaluator Testing**: Expression and statement evaluation verification
- **Error Case Testing**: Comprehensive error condition coverage
- **Automated CI/CD**: GitHub Actions workflow for continuous testing

### Quality Assurance

- **Code Coverage**: Minimum 80% test coverage requirement
- **Code Formatting**: Automated `go fmt` checks
- **Static Analysis**: `go vet` for potential issues
- **Race Detection**: Concurrent execution testing
- **Multi-version Support**: Testing on Go 1.22.x and 1.23.x

## 🏗️ Architecture

The interpreter follows a classic three-phase design:

```
Source Code → Lexer → Tokens → Parser → AST → Evaluator → Result
```

### Package Structure

```
interpreter-go/
├── .github/
│   └── workflows/      # GitHub Actions CI/CD
├── lexer/              # Tokenization and lexical analysis
├── token/              # Token definitions and utilities
├── parser/             # Recursive descent parser
├── ast/                # Abstract Syntax Tree definitions
├── object/             # Runtime object system and environment
├── evaluator/          # Tree-walking interpreter
├── repl/               # Read-Eval-Print Loop
└── main.go             # Entry point
```

### Key Components

#### Lexer (`lexer/`)

- Character-by-character source code scanning
- Token recognition and generation
- Support for keywords, operators, and delimiters
- Unicode-aware string processing

#### Parser (`parser/`)

- Recursive descent parsing algorithm
- Operator precedence handling
- AST node construction
- Comprehensive error reporting

#### AST (`ast/`)

- Node interface implementation
- Expression and statement types
- String representation for debugging
- Visitor pattern support

#### Object System (`object/`)

- Runtime value representation
- Environment-based variable scoping
- Type system with integers, booleans, functions
- Memory-efficient object allocation

#### Evaluator (`evaluator/`)

- Tree-walking interpretation
- Expression evaluation
- Control flow handling
- Function call resolution

## 🚦 Usage

### Running the REPL

```bash
go run main.go
```

### Running Tests

```bash
# Run all tests
go test ./...

# Run tests with coverage
go test -cover ./...

# Run tests with race detection
go test -race ./...

# Run specific package tests
go test ./lexer
go test ./parser
go test ./evaluator

# Generate coverage report
go test -coverprofile=coverage.out ./...
go tool cover -html=coverage.out -o coverage.html
```

### Development Workflow

```bash
# Format code
go fmt ./...

# Check for potential issues
go vet ./...

# Run full test suite (same as CI)
go test -v -race -coverprofile=coverage.out ./...
```

### Example Session

```
Hello kitatsu! This is the BananaScript programming language!
Feel free to type in commands
>> let add = fn(x, y) { x + y; };
>> add(2, 3)
5
>> let fibonacci = fn(n) { if (n < 2) { n } else { fibonacci(n-1) + fibonacci(n-2) } };
>> fibonacci(10)
55
```

## 📚 Learning Outcomes

This project demonstrates proficiency in:

- **Language Implementation**: Complete interpreter construction
- **Compiler Theory**: Lexical analysis, parsing, and evaluation
- **Go Programming**: Idiomatic Go code and patterns
- **Software Architecture**: Clean, modular design principles
- **Testing**: Comprehensive test-driven development
- **Data Structures**: AST manipulation and environment management
- **DevOps**: CI/CD pipeline setup and automation

## 🎯 Future Enhancements

### Planned Features

- [ ] Add colors to CLI output
- [ ] Implement increment/decrement operators (`++`, `--`)
- [ ] Add support for floating-point numbers
- [ ] Improve error messages with line/column numbers
- [ ] Implement comments (single-line `//` and multi-line `/* */`)
- [ ] Add string interpolation support
- [ ] Extend built-in function library
- [ ] Support Unicode characters in identifiers
- [ ] Add ternary expressions (`condition ? expr1 : expr2`)

### Potential Optimizations

- [ ] Bytecode compilation for improved performance
- [ ] Garbage collection optimizations
- [ ] Symbol table implementation
- [ ] Constant folding and dead code elimination

### CI/CD Improvements

- [ ] Add benchmarking tests to track performance
- [ ] Implement semantic versioning with automated releases
- [ ] Add security scanning with CodeQL
- [ ] Create multi-platform builds (Linux, macOS, Windows)

## 📖 Book Reference

This implementation closely follows the methodology and examples from:
**"Writing an Interpreter in Go"** by Thorsten Ball

The book provides excellent guidance on:

- Interpreter design principles
- Go-specific implementation patterns
- Testing strategies for language implementations
- Progressive development approach

## 🤝 Contributing

While this is primarily a learning project, contributions are welcome! Please ensure:

- All tests pass (`go test ./...`)
- Code follows Go conventions (`go fmt`, `go vet`)
- Maintain minimum 80% test coverage
- New features include comprehensive tests
- Documentation is updated accordingly
- GitHub Actions CI pipeline passes

The CI pipeline will automatically:

- Run tests on multiple Go versions
- Check code formatting and style
- Verify test coverage meets requirements
- Generate coverage reports

## 📄 License

This project is for educational purposes, following the examples and principles from "Writing an Interpreter in Go".
