package main

import (
	"bananaScript/evaluator"
	"bananaScript/lexer"
	"bananaScript/object"
	"bananaScript/parser"
	"bytes"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/joho/godotenv"
)

type Request struct {
	Code string `json:"code"`
}

type Response struct {
	Output string   `json:"output"`
	Errors []string `json:"errors"`
}

func indexHtml(w http.ResponseWriter, req *http.Request) {
	http.ServeFile(w, req, "index.html")
}

func executeCode(w http.ResponseWriter, req *http.Request) {
	var body Request
	var logs bytes.Buffer

	log.SetOutput(&logs)

	err := json.NewDecoder(req.Body).Decode(&body)
	if err != nil {
		http.Error(w, string(stringToJson("", []string{err.Error()}, true)), http.StatusBadRequest)
		return
	}

	codeInput := body.Code

	l := lexer.New(codeInput)
	p := parser.New(l)
	program := p.ParseProgram()
	if len(p.Errors()) > 0 {
		jsonData := stringToJson("", p.Errors(), true)

		w.WriteHeader(http.StatusBadRequest)
		w.Write(jsonData)
		return
	}

	env := object.NewEnvironment()
	output := evaluator.Eval(program, env)

	if output == nil {
		fmt.Println("Output: nil")
		fmt.Println("Errors:", p.Errors())
		jsonData := stringToJson(""+"\n\nLogs:\n"+logs.String(), nil, false)
		w.WriteHeader(http.StatusOK)
		w.Write(jsonData)
		return
	}

	errObj, ok := output.(*object.Error)

	fmt.Println("Output:", output.Inspect())
	fmt.Println("Errors:", p.Errors())

	if ok {
		http.Error(w, string(stringToJson("", []string{errObj.Message}, true)), http.StatusBadRequest)
		return
	}

	jsonData := stringToJson(output.Inspect()+"\n\nLogs:\n"+logs.String(), nil, false)
	w.WriteHeader(http.StatusOK)
	w.Write(jsonData)

}

func stringToJson(message string, errors []string, isError bool) []byte {
	var response Response
	if isError {
		response = Response{Errors: errors}
	} else {
		response = Response{Output: message}
	}

	jsonData, err := json.Marshal(response)
	if err != nil {
		log.Println("Error marshaling JSON:", err)
		return nil
	}

	return jsonData
}

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	http.HandleFunc("/", indexHtml)
	http.HandleFunc("/api/execute", executeCode)

	port := os.Getenv("PORT")

	fmt.Printf("Listening on port %s...\n", port)
	http.ListenAndServe(":"+port, nil)
}
