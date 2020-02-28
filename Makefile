.PHONY: all binaries test clean

all: binaries test

binaries: cmd/labd cmd/labctl cmd/labagent cmd/labapp

FORCE:

cmd/%: FORCE
	@echo "$@"
	@go build -o "./bin/$$(basename $@)" "./$@"
	@cp bin/$$(basename $@) $$HOME/go/bin/

test:
	@echo "$@"
	@go test -v ./...

clean:
	@echo "$@"
	@rm -rf ./bin ./tmp
