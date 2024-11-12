package terraform.aws.common

import data.testing as t

test_allow_if_resource_has_owner_tag {
	test_input := {"resource_changes": [{
		"address": "aws_s3_bucket.test_bucket",
		"type": "aws_s3_bucket",
		"change": {
			"actions": ["create"],
			"before": null,
			"after": {
				"name": "test_bucket",
				"tags": {"owner": "squad-a"},
			},
		},
	}]}

	t.no_errors(deny_no_owner_tag) with input as test_input
}

test_deny_if_resource_has_no_owner_tag {
	test_input := {"resource_changes": [{
		"address": "aws_s3_bucket.test_bucket",
		"type": "aws_s3_bucket",
		"change": {
			"actions": ["create"],
			"before": null,
			"after": {
				"name": "test_bucket",
				"tags": {},
			},
		},
	}]}

	t.is_error(deny_no_owner_tag[msg], "error: DENY_NO_OWNER_TAG - Resource aws_s3_bucket.test_bucket must have the tag 'owner'") with input as test_input
}
