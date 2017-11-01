IMAGE_NAME := waja/bombardier

build:
	docker build --rm -t $(IMAGE_NAME) .
	
run:
	@echo docker run --rm -it $(IMAGE_NAME) 
	
shell:
	docker run --rm -it --entrypoint sh $(IMAGE_NAME) -l

test: build
	@if ! [ "$$(docker run --rm -it waja/bombardier --help | head -1 | cut -d' ' -f2 | xargs basename)" = "bombardier" ]; then exit 1; fi
