REPORTER = $(if $(CI),spec,dot)

build: node_modules/

test: node_modules/ build lint
	phantomjs ./node_modules/mocha-phantomjs-core/mocha-phantomjs-core.js \
		./test/test.html $(REPORTER) '{"useColors":true}'

lint: node_modules/
	./node_modules/.bin/jshint *.js test/*.js

node_modules/:
	npm install

clean:
	rm -rf ./node_modules

.PHONY: build clean lint test
