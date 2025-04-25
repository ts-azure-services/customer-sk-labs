RED = \033[0;31m
NC = \033[0m # No Color
GREEN = \033[0;32m

define log_section
	@printf "\n${GREEN}--> $(1)${NC}\n\n"
endef

# Create the env file structure, then manually input details
create-env-file:
	$(call log_section, Create env file...)
	# echo "GLOBAL_LLM_SERVICE=" > .env
	echo "AZURE_OPENAI_CHAT_DEPLOYMENT_NAME=<enter chat deployment>" > .env
	echo "AZURE_OPENAI_TEXT_DEPLOYMENT_NAME=<enter text deployemnt>" >> .env
	echo "AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME=<enter embedding deployment>" >> .env
	echo "AZURE_OPENAI_ENDPOINT=<enter openai endpoint>" >> .env
	echo "AZURE_OPENAI_API_KEY=<enter openai api key>" >> .env
	echo "AZURE_AI_SEARCH_API_KEY=" >> .env
	echo "AZURE_AI_SEARCH_ENDPOINT=" >> .env

# Copy env file over to both lab folders
copy-env-file:
	$(call log_section, Copy env file to each folder...)
	cp ./.env ./sk-concepts/
	cp ./.env ./agent-concepts/

# Create a virtual env
create-venv:
	$(call log_section, Create virtual env...)
	rm -rf .venv
	python -m venv .venv
	.venv/bin/python -m pip install -r ./requirements.txt


# Commit local branch changes
branch=$(shell git symbolic-ref --short HEAD)
now=$(shell date '+%F_%H:%M:%S' )

get-branch:
	@echo $(branch)

git-push:
	# Clean out notebook commits
	find . -name "*.ipynb" -exec jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace {} \;
	@read -p "Enter commit message: " msg && git add . && git commit -m "$$msg" && git push -u origin $(branch)


# Force remote to align with the local branch
force-remote:
	git push origin main --force

git-pull:
	git pull origin $(branch)
