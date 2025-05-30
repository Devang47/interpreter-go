# BananaScript Language Interpreter in Go

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

### Testing Strategy

- **Unit Tests**: Individual component testing
- **Integration Tests**: End-to-end interpreter testing
- **Parser Testing**: Extensive AST validation
- **Evaluator Testing**: Expression and statement evaluation verification
- **Error Case Testing**: Comprehensive error condition coverage

## 🏗️ Architecture

The interpreter follows a classic three-phase design:

```
Source Code → Lexer → Tokens → Parser → AST → Evaluator → Result
```

### Package Structure

```
interpreter-go/
├── lexer/          # Tokenization and lexical analysis
├── token/          # Token definitions and utilities
├── parser/         # Recursive descent parser
├── ast/            # Abstract Syntax Tree definitions
├── object/         # Runtime object system and environment
├── evaluator/      # Tree-walking interpreter
├── repl/           # Read-Eval-Print Loop
└── main.go         # Entry point
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

# Run specific package tests
go test ./lexer
go test ./parser
go test ./evaluator
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
- New features include comprehensive tests
- Documentation is updated accordingly

## 📄 License

This project is for educational purposes, following the examples and principles from "Writing an Interpreter in Go".
