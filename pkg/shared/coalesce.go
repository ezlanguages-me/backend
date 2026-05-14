package shared

// Coalesce returns the first non-empty string from the provided values
func Coalesce(values ...string) string {
	for _, v := range values {
		if v != "" {
			return v
		}
	}
	return ""
}
