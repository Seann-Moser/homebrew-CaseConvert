class Caseconvert < Formula
  desc "a tool to convert strings between different cases"
  homepage "https://github.com/Seann-Moser/CaseConvert"
  url "https://github.com/Seann-Moser/CaseConvert/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "abaafd92a5853f50ddc3e4018f6b5160eebc661df7f1eabc1276ff26649b6c7e"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"casec")
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

    # Test converting to ENV_VAR_CASE
    assert_equal "exampleText", shell_output("#{bin}/casec conv --input 'EXAMPLE_TEXT' --camel").strip
  end
end
