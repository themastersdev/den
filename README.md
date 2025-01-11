1. Run `docker container rm den`
2. Run `docker build -t den .`
3. Run `docker container create --name den den`
4. Run `ocker container cp ./build.sh den:./build.sh`

