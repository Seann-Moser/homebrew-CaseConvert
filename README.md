## Install
```bash
git clone git@github.com:Seann-Moser/CaseConvert.git
cd CaseConvert 
go mod vendor
go install
```


### CLI Tool Usage

The `CaseConvert` CLI tool allows you to convert strings to various case formats. Below are some examples of how to use it based on the provided code.

### Available Flags

- **--input, -i**: Specifies the input string to convert. If not provided, the tool will read from standard input.
- **--snake, -s**: Converts the input to snake_case.
- **--camel, -c**: Converts the input to camelCase.
- **--pascal, -p**: Converts the input to PascalCase.
- **--kebab, -k**: Converts the input to kebab-case.
- **--env, -e**: Converts the input to ENV_VAR_CASE.
- **--case**: Allows specifying a custom case type.

### Examples

1. **Convert to Camel Case**:
   ```bash
   ./caseconvert conv --input "example text" --camel
   ```
   Output: `exampleText`

2. **Convert to Snake Case**:
   ```bash
   ./caseconvert conv --input "example text" --snake
   ```
   Output: `example_text`

3. **Convert to Pascal Case**:
   ```bash
   ./caseconvert conv --input "example text" --pascal
   ```
   Output: `ExampleText`

4. **Convert to Kebab Case**:
   ```bash
   ./caseconvert conv --input "example text" --kebab
   ```
   Output: `example-text`

5. **Convert to Environment Variable Case**:
   ```bash
   ./caseconvert conv --input "example text" --env
   ```
   Output: `EXAMPLE_TEXT`

6. **Using Standard Input**:
   ```bash
   echo "example text" | ./caseconvert conv --camel
   ```
   Output: `exampleText`

This will convert the input string to the specified custom case type.

### Help Command

To display the help message with a list of available commands and options:

```bash
./caseconvert conv --help
```

This provides detailed usage instructions and information about all available flags and commands. For more information, visit the [CaseConvert repository](https://github.com/Seann-Moser/CaseConvert).
