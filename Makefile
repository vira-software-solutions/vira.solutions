.PHONY: help submodules build deploy clean serve setup

# Default target
help:
	@echo "Vira Solutions Deployment"
	@echo ""
	@echo "Available targets:"
	@echo "  make deploy      - Full deployment: update submodules, build, commit, and push"
	@echo "  make build       - Build Hugo site (includes submodule update)"
	@echo "  make serve       - Run local Hugo server for preview"
	@echo "  make submodules  - Update git submodules"
	@echo "  make clean       - Remove generated files"
	@echo "  make setup       - Initial setup (for new clones)"

# Update git submodules
submodules:
	@echo "Updating git submodules..."
	@git submodule update --init --recursive
	@echo "Submodules updated"

# Build Hugo site
build: submodules
	@echo "Building Hugo site..."
	@hugo --gc --minify
	@echo "Hugo build completed"

# Full deployment workflow
deploy: build
	@echo ""
	@echo "Changes to be committed:"
	@git status --short
	@echo ""
	@read -p "Enter commit message: " msg; \
	if [ -n "$$msg" ]; then \
		echo "Staging changes..."; \
		git add .; \
		echo "Committing changes..."; \
		git commit -m "$$msg"; \
		echo "Pushing to remote..."; \
		git push; \
		echo "Successfully pushed to remote"; \
		echo "Alpine container will pull the updated public/ folder"; \
	else \
		echo "No commit message provided. Skipping commit."; \
	fi

# Run local Hugo server
serve: submodules
	@echo "Starting Hugo development server..."
	@echo "Server will be available at http://localhost:1313"
	@hugo server --ignoreCache --disableFastRender

# Clean generated files
clean:
	@echo "Cleaning generated files..."
	@rm -rf public/ resources/_gen/ .hugo_build.lock
	@echo "Cleaned"

# Initial setup for new clones
setup: submodules
	@echo "Initial setup complete"
	@echo ""
	@echo "Next steps:"
	@echo "  1. Edit hugo.yaml or content files"
	@echo "  2. Run: make deploy"
