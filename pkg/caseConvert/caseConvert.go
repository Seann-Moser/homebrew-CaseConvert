package caseConvert

import (
	"fmt"
	"github.com/gobeam/stringy"
	"strings"
)

type CaseType string

const (
	SnakeCase       = CaseType("snake_case")
	CamelCase       = CaseType("camel_case")
	PascalCase      = CaseType("pascal_case")
	KebabCase       = CaseType("kebab-case")
	EnvironmentCase = CaseType("environment_case")
)

var CaseTypeList = []string{
	string(SnakeCase),
	string(CamelCase),
	string(PascalCase),
	string(KebabCase),
	string(EnvironmentCase),
}

func Convert(data string, c CaseType) (string, error) {
	rules := []string{"?", "", "#", ""}

	str := stringy.New(strings.ToLower(data))
	switch c {
	case SnakeCase:
		return str.SnakeCase(rules...).Get(), nil
	case CamelCase:
		return str.CamelCase(rules...).Get(), nil
	case PascalCase:
		return str.PascalCase(rules...).Get(), nil
	case KebabCase:
		return str.KebabCase(rules...).Get(), nil
	case EnvironmentCase:
		return str.SnakeCase(rules...).ToUpper(), nil
	default:
		return data, fmt.Errorf("invalid case type(%s), expected (%s)", c, strings.Join(CaseTypeList, ","))
	}
}
