# Makefile for Ask The Relic Hugo Blog
# https://github.com/askedrelic/asktherelic.com

.PHONY: help build serve clean install check deploy compare test lint format

# Default target
.DEFAULT_GOAL := help

# Variables
HUGO_VERSION := $(shell hugo version 2>/dev/null | grep -o 'v[0-9.]*' | head -1)
HUGO_PORT := 1313
HUGO_ENV := development
PUBLIC_DIR := public
CONTENT_DIR := content
STATIC_DIR := static

# Colors for output
RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[0;33m
BLUE := \033[0;34m
NC := \033[0m # No Color

help: ## Show this help message
	@echo "$(BLUE)Ask The Relic Hugo Blog$(NC)"
	@echo "$(BLUE)========================$(NC)"
	@echo ""
	@echo "Available commands:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(GREEN)%-15s$(NC) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(YELLOW)Hugo version:$(NC) $(HUGO_VERSION)"
	@echo "$(YELLOW)Site URL:$(NC) http://localhost:$(HUGO_PORT)"

install: ## Install dependencies and check Hugo installation
	@echo "$(BLUE)Checking Hugo installation...$(NC)"
	@if ! command -v hugo >/dev/null 2>&1; then \
		echo "$(RED)Hugo not found. Please install Hugo first:$(NC)"; \
		echo "  brew install hugo"; \
		echo "  or visit https://gohugo.io/installation/"; \
		exit 1; \
	fi
	@echo "$(GREEN)Hugo $(HUGO_VERSION) is installed$(NC)"
	@echo "$(BLUE)Installing Python dependencies...$(NC)"
	@pip3 install requests beautifulsoup4 pyyaml >/dev/null 2>&1 || echo "$(YELLOW)Warning: Could not install Python dependencies$(NC)"
	@echo "$(GREEN)Dependencies check complete$(NC)"

clean: ## Clean generated files
	@echo "$(BLUE)Cleaning generated files...$(NC)"
	@rm -rf $(PUBLIC_DIR)
	@rm -rf resources
	@rm -f .hugo_build.lock
	@rm -f *.json *.log
	@echo "$(GREEN)Clean complete$(NC)"

build: clean ## Build the site for production
	@echo "$(BLUE)Building site for production...$(NC)"
	@HUGO_ENV=production hugo --gc --minify
	@echo "$(GREEN)Build complete$(NC)"
	@echo "$(YELLOW)Output:$(NC) $(PUBLIC_DIR)/"
	@echo "$(YELLOW)Pages:$(NC) $$(find $(PUBLIC_DIR) -name "*.html" | wc -l | tr -d ' ')"
	@echo "$(YELLOW)Size:$(NC) $$(du -sh $(PUBLIC_DIR) | cut -f1)"

serve: ## Start development server
	@echo "$(BLUE)Starting Hugo development server...$(NC)"
	@echo "$(YELLOW)Site will be available at:$(NC) http://localhost:$(HUGO_PORT)"
	@echo "$(YELLOW)Press Ctrl+C to stop$(NC)"
	@hugo server --bind 0.0.0.0 --port $(HUGO_PORT) --buildDrafts --buildFuture --disableFastRender --gc --ignoreCache

dev: serve ## Alias for serve

draft: ## Create a new draft post
	@echo "$(BLUE)Creating new draft post...$(NC)"
	@read -p "Enter post title: " title; \
	slug=$$(echo "$$title" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$$//g'); \
	hugo new posts/$$slug.md; \
	echo "$(GREEN)Created new post:$(NC) content/posts/$$slug.md"

check: ## Check site configuration and content
	@echo "$(BLUE)Checking site configuration...$(NC)"
	@hugo config | head -20
	@echo ""
	@echo "$(BLUE)Content summary:$(NC)"
	@echo "$(YELLOW)Posts:$(NC) $$(find $(CONTENT_DIR)/posts -name "*.md" | wc -l | tr -d ' ')"
	@echo "$(YELLOW)Static files:$(NC) $$(find $(STATIC_DIR) -type f | wc -l | tr -d ' ')"
	@echo "$(YELLOW)Images:$(NC) $$(find $(STATIC_DIR) -name "*.jpg" -o -name "*.png" -o -name "*.gif" | wc -l | tr -d ' ')"

lint: ## Check for common issues in content and format with Prettier
	@echo "$(BLUE)Linting content...$(NC)"
	@echo "$(YELLOW)Checking markdown formatting with Prettier...$(NC)"
	@if [ -f node_modules/.bin/prettier ]; then \
		npx prettier --check "$(CONTENT_DIR)/**/*.md" || (echo "$(RED)Prettier formatting issues found. Run 'make format' to fix.$(NC)" && exit 1); \
		echo "$(GREEN)Prettier formatting check passed$(NC)"; \
	else \
		echo "$(YELLOW)Prettier not found. Run 'npm install' first.$(NC)"; \
	fi
	@echo "$(YELLOW)Checking for broken markdown links...$(NC)"
	@find $(CONTENT_DIR) -name "*.md" -exec grep -l "]()" {} \; | head -5 | while read file; do \
		echo "$(RED)Broken link in:$(NC) $$file"; \
	done || echo "$(GREEN)No broken markdown links found$(NC)"
	@echo "$(YELLOW)Checking for missing alt text in images...$(NC)"
	@find $(CONTENT_DIR) -name "*.md" -exec grep -l "!\[\](" {} \; | head -5 | while read file; do \
		echo "$(RED)Missing alt text in:$(NC) $$file"; \
	done || echo "$(GREEN)No missing alt text found$(NC)"

format: ## Format markdown files with Prettier
	@echo "$(BLUE)Formatting markdown files...$(NC)"
	@if [ -f node_modules/.bin/prettier ]; then \
		npx prettier --write "$(CONTENT_DIR)/**/*.md"; \
		echo "$(GREEN)Formatting complete$(NC)"; \
	else \
		echo "$(YELLOW)Prettier not found. Run 'npm install' first.$(NC)"; \
	fi

compare: ## Compare local site with remote asktherelic.com
	@echo "$(BLUE)Comparing local site with remote...$(NC)"
	@if [ ! -f compare_sites.py ]; then \
		echo "$(RED)compare_sites.py not found$(NC)"; \
		exit 1; \
	fi
	@echo "$(YELLOW)Starting Hugo server for comparison...$(NC)"
	@hugo server --port $(HUGO_PORT) --buildDrafts=false >/dev/null 2>&1 & \
	SERVER_PID=$$!; \
	sleep 3; \
	echo "$(YELLOW)Running comparison...$(NC)"; \
	python3 compare_sites.py; \
	kill $$SERVER_PID 2>/dev/null || true; \
	echo "$(GREEN)Comparison complete$(NC)"

markdown-test: ## Test markdown rendering for specific posts
	@echo "$(BLUE)Testing markdown rendering...$(NC)"
	@echo "$(YELLOW)Building site...$(NC)"
	@hugo --gc --quiet
	@echo "$(YELLOW)Starting Hugo server...$(NC)"
	@hugo server --port $(HUGO_PORT) --buildDrafts=false >/dev/null 2>&1 & \
	SERVER_PID=$$!; \
	sleep 3; \
	echo "$(YELLOW)Testing Adventures in AI post (textbundle)...$(NC)"; \
	curl -s "http://localhost:$(HUGO_PORT)/2025/06/12/adventures-in-ai/" > test_adventures.html; \
	echo "$(BLUE)Checking TOC rendering...$(NC)"; \
	if grep -q '<nav id="TableOfContents">' test_adventures.html; then \
		echo "$(GREEN)✓ TOC found in HTML$(NC)"; \
	else \
		echo "$(RED)✗ TOC not found in HTML$(NC)"; \
	fi; \
	echo "$(BLUE)Checking textbundle image rendering...$(NC)"; \
	if grep -q '<img' test_adventures.html; then \
		echo "$(GREEN)✓ Textbundle images found in HTML$(NC)"; \
		grep '<img' test_adventures.html | head -1; \
	else \
		echo "$(RED)✗ No textbundle images found in HTML$(NC)"; \
	fi; \
	echo "$(YELLOW)Testing GoRuck post (reference-style markdown)...$(NC)"; \
	curl -s "http://localhost:$(HUGO_PORT)/2013/06/16/goruck-light-experiences/" > test_goruck.html; \
	echo "$(BLUE)Checking reference-style image rendering...$(NC)"; \
	if grep -q '<img' test_goruck.html; then \
		echo "$(GREEN)✓ Reference-style images found in HTML$(NC)"; \
		grep '<img' test_goruck.html | head -1; \
	else \
		echo "$(RED)✗ No reference-style images found in HTML$(NC)"; \
		echo "$(YELLOW)Checking for unprocessed markdown...$(NC)"; \
		if grep -q '!\[.*\]\[.*\]' test_goruck.html; then \
			echo "$(RED)Found unprocessed reference-style markdown:$(NC)"; \
			grep '!\[.*\]\[.*\]' test_goruck.html | head -1; \
		fi; \
	fi; \
	echo "$(BLUE)HTML files saved:$(NC) test_adventures.html, test_goruck.html"; \
	kill $$SERVER_PID 2>/dev/null || true; \
	echo "$(GREEN)Markdown test complete$(NC)"
