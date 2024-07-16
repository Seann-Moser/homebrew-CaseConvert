class Caseconvert < Formula
  desc "Tool to convert strings between different cases"
  homepage "https://github.com/Seann-Moser/CaseConvert"
  url "https://github.com/Seann-Moser/CaseConvert/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "230bd09e857d4c417a821bfb9ac7312f65165c8c2a889ba626237dbc9009a097"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"casec")
    generate_completions_from_executable(bin/"casec", "completion")
  end

  test do
    # Test converting to camelCase
    assert_equal "exampleText", shell_output("#{bin}/casec conv --input 'example text' --camel").strip

    # Test converting to snake_case
    assert_equal "example_text", shell_output("#{bin}/casec conv --input 'example text' --snake").strip

    # Test converting to PascalCase
    assert_equal "ExampleText", shell_output("#{bin}/casec conv --input 'example text' --pascal").strip

    # Test converting to kebab-case
    assert_equal "example-text", shell_output("#{bin}/casec conv --input 'example text' --kebab").strip

    # Test converting to ENV_VAR_CASE
    assert_equal "EXAMPLE_TEXT", shell_output("#{bin}/casec conv --input 'example text' --env").strip

    # Test converting to camelCase
    assert_equal "exampleText", shell_output("#{bin}/casec conv --input 'EXAMPLE_TEXT' --camel").strip
  end
end
