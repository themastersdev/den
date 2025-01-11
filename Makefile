.PHONY: den
den: 
	docker container rm -f den
	docker image rm -f den
	docker build -t den .
	@echo -en "\n\n\033[1;31mCAUTION\033[0m: Going forward you should run \033[1mmake code\033[0m to access the den. If you run \033[1mmake linux-docker-den\033[0m, then your current den will be replaced with a fresh den. You've been warned!\n\n\nRun \033[1;32mnvim\033[0m to start building!\n"
	docker run -it --name den den

.PHONY: code
code:
	docker start -i den
