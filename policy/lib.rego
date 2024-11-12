package lib

has_key(obj, k) {
	_ = obj[k]
}

is_false(val) {
	val == "false"
} else {
	val == false
}

is_true(val) {
	val == "true"
} else {
	val == true
}

not_existing_or_true(obj, k) {
	not has_key(obj, k)
} else {
	is_true(obj[k])
}

contains_element(arr, elem) {
	arr[_] = elem
} else = false

is_create_or_update(action) {
	contains_element(["create", "update"], action[_])
}
