.PHONY: den
den: 
	docker container rm -f den
	docker image rm -f den
	docker build -t den .
	@echo -en "\nRun \e[1;32mnvim\e[0m to start building\!\n"
	docker run -it --name den den

.PHONY: code
code:
	docker start -i den
