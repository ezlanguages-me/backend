package server

import (
	"fmt"
	"reflect"
	"strings"

	"github.com/joho/godotenv"
)

// LoadEnvironmentVariables loads environment variables from .env file and unmarshalls them into the provided structure
// The structure parameter must be a pointer to a struct
// Struct fields should have `env:"VAR_NAME"` tags to map environment variables
func LoadEnvironmentVariables(structure interface{}) error {
	myEnv, err := godotenv.Read()
	if err != nil {
		return fmt.Errorf("failed to read .env file: %w", err)
	}

	// Validate that structure is a pointer to a struct
	v := reflect.ValueOf(structure)
	if v.Kind() != reflect.Ptr {
		return fmt.Errorf("structure must be a pointer to a struct, got %T", structure)
	}

	v = v.Elem()
	if v.Kind() != reflect.Struct {
		return fmt.Errorf("structure must be a pointer to a struct, got pointer to %s", v.Kind())
	}

	t := v.Type()

	// Iterate through struct fields
	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		fieldType := t.Field(i)

		// Skip unexported fields
		if !field.CanSet() {
			continue
		}

		// Get env tag
		envKey := fieldType.Tag.Get("env")
		if envKey == "" {
			// Fallback to uppercase field name if no tag
			envKey = strings.ToUpper(fieldType.Name)
		}

		// Check if required tag is set
		required := fieldType.Tag.Get("required") == "true"

		// Get value from environment map
		value, exists := myEnv[envKey]

		if !exists || value == "" {
			if required {
				return fmt.Errorf("required environment variable %s is missing or empty", envKey)
			}
			continue
		}

		// Set the field value
		if field.Kind() == reflect.String {
			field.SetString(value)
		} else {
			return fmt.Errorf("unsupported field type %s for field %s", field.Kind(), fieldType.Name)
		}
	}

	return nil
}
