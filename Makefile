# fault-chamber developer tasks.
# Run `make help` to list targets.

GO       ?= go
PKGS     := ./...

.DEFAULT_GOAL := help

.PHONY: help build test test-race vet fmt lint tidy cover clean

help: ## List available targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
			awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

build: ## Compile all packages
	$(GO) build $(PKGS)

test: ## Run all tests
	$(GO) test $(PKGS)

test-race: ## Run all tests with the race detector
	$(GO) test -race $(PKGS)

vet: ## Run go vet (built-in static checks)
	$(GO) vet $(PKGS)

fmt: ## Format all code
	$(GO) fmt $(PKGS)

lint: ## Run golangci-lint (must be installed)
	golangci-lint run

tidy: ## Sync go.mod/go.sum with imports
	$(GO) mod tidy

cover: ## Run tests with coverage summary
	$(GO) test -cover $(PKGS)

clean: ## Remove build/test artifacts
	$(GO) clean
	rm -rf bin/ dist/