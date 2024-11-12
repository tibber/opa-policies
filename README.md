# opa-policies

OPA policies used at Tibber

## Getting started

* Read the [OPA documentation](https://www.openpolicyagent.org/docs/latest/#overview)
* OPA uses a languages called rego. You can find documentation [here](https://www.openpolicyagent.org/docs/latest/#rego)
* OPA is run through [conftest](https://www.conftest.dev/)

## Installing

```
make download
# copy the binary to /usr/local/bin or any other location for binaries in the system
sudo mv conftest /usr/local/bin/conftest
```

## Usage

The common usage of those policies are as a library in [Atlantis Conftest](https://www.runatlantis.io/docs/policy-checking)

## Writing new rules

* Create `<rule_name>.rego` and `<rule_name>_test.rego` under `policy/terraform/aws/<aws-service>/`. If the `<aws-service>` does not exist yet, then it must be created
* Rule names must be prefixed with `deny` or `allow`. Rules usually deny changes to resources.


Once the rule is created, add it to the `rules` array at `policy/terraform/terraform.rego`.

### Testing the rules

Write tests for the rule in the `<rule_name>_test.rego` file. Use existing rule tests as the starting point.

## Tests

Run `make unit-tests` for testing all the rules.

## Formatting

Rego files must follow OPA's formating standard. Run `make fmt` to ensure that rego files are formatted.

