format:
	@echo "No formatting necessary here (yet)"

licenses:
	@echo "No license checks necessary in this repository (yet)."

.PHONY: docker
docker:
	docker build -t oryd/k8s-toolbox:dev -f docker/Dockerfile .
