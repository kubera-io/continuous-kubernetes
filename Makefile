# go mod download modules to local cache
# make vendored copy of dependencies
# install other go binaries for code generation
.PHONY: vendor
vendor: go.mod go.sum
	@GO111MODULE=on go mod download
	@GO111MODULE=on go mod tidy
	@GO111MODULE=on go mod vendor

.PHONY: test
test: 
	@go test ./... -cover

.PHONY: testv
testv:
	@go test ./... -cover -v -args --logtostderr -v=2

.PHONY: e2e-test
e2e-test: 
	@cd test/e2e && ./suite.sh

