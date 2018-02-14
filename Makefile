all: build/fk-lan-sync build/fk-log-analyzer build/fk-data-tool build/fk-wifi-tool

build/fk-lan-sync: lan-sync/*.go
	go build -o build/fk-lan-sync lan-sync/*.go

build/fk-log-analyzer: log-analyzer/*.go
	go build -o build/fk-log-analyzer log-analyzer/*.go

build/fk-data-tool: data-tool/*.go
	go build -o build/fk-data-tool data-tool/*.go

build/fk-wifi-tool: wifi-tool/*.go
	go build -o build/fk-wifi-tool wifi-tool/*.go

install: all

clean:
	rm -rf build
