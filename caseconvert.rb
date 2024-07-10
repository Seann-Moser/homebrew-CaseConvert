class Caseconvert < Formula
  desc "CaseConvert is a tool to convert strings between different cases"
  homepage "https://github.com/Seann-Moser/CaseConvert"
  url "https://github.com/Seann-Moser/CaseConvert/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "abaafd92a5853f50ddc3e4018f6b5160eebc661df7f1eabc1276ff26649b6c7e"
  license "MIT"

  depends_on "go" => :build

  on_macos do
    on_intel do
      def install
          system "go", "mod", "tidy"
          system "go", "mod", "vendor"
          system "go", "build", *std_go_args(output: bin/"casec")
      end
    end

    on_arm do
      def install
          system "go", "mod", "tidy"
          system "go", "mod", "vendor"
          system "go", "build", *std_go_args(output: bin/"casec")
      end
    end
  end

  on_linux do
    on_intel do
      def install
          system "go", "mod", "tidy"
          system "go", "mod", "vendor"
          system "go", "build", *std_go_args(output: bin/"casec")
      end
    end

    on_arm do
      def install
          system "go", "mod", "tidy"
          system "go", "mod", "vendor"
          system "go", "build", *std_go_args(output: bin/"casec")
      end
    end
  end

  test do
    system "#{bin}/caseconvert", "--help"
  end
end
