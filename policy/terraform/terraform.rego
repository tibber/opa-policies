package terraform

import future.keywords.if

flatten_rules(rules) := r if {
	r := [
	rule[_] | # flatten the rule (rule is an array with errors)
		rule := rules[_] # for each rule in rules
		count(rule) > 0 # only return the rules that have errors
	]
}

deny_all[msg] {
	rules := []
	denied_rules := flatten_rules(rules)
	msg := denied_rules[_]
}
