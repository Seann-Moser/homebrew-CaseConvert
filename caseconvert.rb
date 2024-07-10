class CaseConvert < Formula
  desc "CaseConvert is a tool to convert strings between different cases"
  homepage "https://github.com/Seann-Moser/CaseConvert"
  url "https://github.com/Seann-Moser/CaseConvert/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d3c7e8d1b2d456aed62d77dcb45d2e356418d07c5c40a61fd1c5293b9ab58b75"
  license "MIT"

  depends_on "go" => :build

  on_macos do
    on_intel do
      def install
          system "go", "mod", "tidy"
          system "go", "mod", "vendor"
          system "go", "build", *std_go_args(output: bin/"cc")
      end
    end

    on_arm do
      def install
          system "go", "mod", "tidy"
          system "go", "mod", "vendor"
          system "go", "build", *std_go_args(output: bin/"cc")
      end
    end
  end

  on_linux do
    on_intel do
      def install
          system "go", "mod", "tidy"
          system "go", "mod", "vendor"
          system "go", "build", *std_go_args(output: bin/"cc")
      end
    end

    on_arm do
      def install
          system "go", "mod", "tidy"
          system "go", "mod", "vendor"
          system "go", "build", *std_go_args(output: bin/"cc")
      end
    end
  end

  test do
    system "#{bin}/caseconvert", "--help"
  end
end
