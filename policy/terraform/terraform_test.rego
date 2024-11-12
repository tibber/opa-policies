package terraform

import data.testing as t

test_deny_all_rules {
	test_input := {"resource_changes": [{
		"address": "aws_s3_bucket.test_bucket",
		"type": "aws_s3_bucket",
		"change": {
			"actions": ["create"],
			"before": null,
			"after": {"tags": {"owner": "squad-a"}},
		},
	}]}
	t.error_count(deny_all, 0) with input as test_input
}
