.PHONY: build run start

build:
	docker build -t openbrisk/brisk-runtime-java .

run:
	docker run -it \
	-p 8080:8080 \
	-v `pwd`/examples:/openbrisk \
	-e MODULE_NAME=HelloWorld \
	-e FUNCTION_HANDLER=execute \
	openbrisk/brisk-runtime-java