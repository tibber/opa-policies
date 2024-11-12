package testing

no_errors(target) {
	count(target) == 0
}

error_count(target, c) {
	count(target) == c
}

is_error(target, error) {
	count(target) > 0
	target = error
}
