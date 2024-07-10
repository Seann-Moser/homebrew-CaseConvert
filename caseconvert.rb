class Caseconvert < Formula
  desc "CaseConvert is a tool to convert strings between different cases"
  homepage "https://github.com/Seann-Moser/CaseConvert"
  url "https://github.com/Seann-Moser/CaseConvert/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "aac58067004942d71b9503ffe3638a370ef74e641c8f8d0cade56dab9b8e5050"
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
