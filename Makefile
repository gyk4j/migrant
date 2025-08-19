LDFLAGS=-ldflags "-s -w"

all: clean migrant

.PHONY: all

migrant: main.go
	go build $(LDFLAGS)

clean:
	rm -f migrant*
