package terraform.aws.common

import data.lib as l
import future.keywords
import input as tfplan

deny_no_owner_tag contains msg if {
	resources := ["aws_s3_bucket"]
	resource_changes := tfplan.resource_changes[_]
	tags := resource_changes.change.after.tags
	resource_changes.type in resources
	l.is_create_or_update(resource_changes.change.actions)
	not l.has_key(tags, "owner")
	msg := sprintf("error: DENY_NO_OWNER_TAG - Resource %v must have the tag 'owner'", [resource_changes.address])
}
