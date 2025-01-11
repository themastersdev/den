.PHONY: den
den: 
	docker container rm -f den
	docker image rm -f den
	docker build -t den .
	@echo -en "\n\nRun \033[1;32mnvim\033[0m to start building!"
	docker run -it --name den den

.PHONY: code
code:
	docker start -i den
