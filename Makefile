-include .env

.PHONY: all test clean coverage

all: clean install build

clean  :; forge clean

install :; yarn install

update:; forge update

build:; forge build

test :; forge test

snapshot :; forge snapshot

format :; npx prettier --write contracts/**/*.sol && npx prettier --write contracts/*.sol

coverage:
	mkdir -p coverage
	forge coverage --report lcov
	lcov --remove lcov.info -o lcov.info 'test/*'
	genhtml lcov.info --output-dir coverage

lint :; npx solhint contracts/**/*.sol && npx solhint contracts/*.sol
