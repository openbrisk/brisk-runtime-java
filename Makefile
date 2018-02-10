.PHONY: build run

build:
	docker build -t openbrisk/brisk-runtime-java .

run:
	docker run -it \
	-p 8080:8080 \
	openbrisk/brisk-runtime-java