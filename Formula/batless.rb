class Batless < Formula
  desc "A non-blocking, LLM-friendly code viewer inspired by bat"
  homepage "https://github.com/docdyhr/batless"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docdyhr/batless/releases/download/v0.5.0/batless-aarch64-apple-darwin.tar.gz"
      sha256 "b5b281bae51cb06178b614abe14d3c438e35f7a56fe70caa85aca317bb5ed3bb"
    else
      url "https://github.com/docdyhr/batless/releases/download/v0.5.0/batless-x86_64-apple-darwin.tar.gz"
      sha256 "81c3f2deddcae8df1e523286661ebed618cc9fdc73361b30ed55ed87573a6510"
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
