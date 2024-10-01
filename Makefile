.PHONY: default
default: help

.PHONY: help
##@ Pattern tasks
help:
	@make -f common/Makefile MAKEFILE_LIST="Makefile common/Makefile" help


%:
	make -f common/Makefile $*

.PHONY: install upgrade
install upgrade: operator-deploy post-install ## installs the pattern, loads the secrets and starts the pipelines
	echo "Installed"

.PHONY: install-no-pipelines
install-no-pipelines: operator-deploy ## installs the pattern
	echo "Installed without pipeline setup"

.PHONY: post-install
post-install:
	make load-secrets
	make start-pipelines

.PHONY: start-pipelines
start-pipelines:
	./scripts/start_pipelines.sh
