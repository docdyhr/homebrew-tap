class Batless < Formula
  desc "A non-blocking, LLM-friendly code viewer inspired by bat"
  homepage "https://github.com/docdyhr/batless"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docdyhr/batless/releases/download/v0.6.0/batless-aarch64-apple-darwin.tar.gz"
      sha256 "5c87e3fddc1878cef843b6b4d257b472cc0ad30495a324350ff92a774e9bee5e"
    else
      url "https://github.com/docdyhr/batless/releases/download/v0.6.0/batless-x86_64-apple-darwin.tar.gz"
      sha256 "4907b341168db84c1b0630586db7cbf800aeb194ed832462d45e3b8bea346365"
    end
  end

  on_linux do
    url "https://github.com/docdyhr/batless/releases/download/v0.6.0/batless-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fdf147a267066855af703a44b48aa0c9a2707885453ac98a710772e6b9c59d34"
  end

  def install
    bin.install "batless"
  end

  test do
    assert_match "batless", shell_output("#{bin}/batless --version")
  end
end
