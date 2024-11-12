ROOT_POLICY_DIR=policy
CONFTEST_VERSION=0.56.0
ARCH=$(shell uname -m)
SYSTEM=$(shell uname -s)

unit-tests:
	conftest verify
fmt:
	conftest fmt $(ROOT_POLICY_DIR)
check:
	conftest fmt --check $(ROOT_POLICY_DIR)
download:
	curl -L -o conftest.tar.gz https://github.com/open-policy-agent/conftest/releases/download/v$(CONFTEST_VERSION)/conftest_$(CONFTEST_VERSION)_$(SYSTEM)_$(ARCH).tar.gz
	tar xzf conftest.tar.gz
	chmod +x conftest
