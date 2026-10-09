class Batless < Formula
  desc "Fast, non-blocking code and text viewer inspired by bat"
  homepage "https://github.com/docdyhr/batless"
  version "0.7.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docdyhr/batless/releases/download/v0.7.3/batless-aarch64-apple-darwin.tar.gz"
      sha256 "3d0e7e5ae113df76638a766a6635438bf8321074256274daaa7ebf96650ed957"
    else
      url "https://github.com/docdyhr/batless/releases/download/v0.7.3/batless-x86_64-apple-darwin.tar.gz"
      sha256 "b7dd49baf38a89a952c11f6475efbc23bdf7a7fd539ced2c9fdc3c945f37893e"
    end
  end

  on_linux do
    url "https://github.com/docdyhr/batless/releases/download/v0.7.3/batless-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "97a9e3f89ba4607ddb42719a486f04814f67f68b635781762e03a8f55e0a8e6f"
  end

  def install
    bin.install "batless"
  end

  test do
    (testpath/"test.rs").write <<~EOS
      fn main() {
          println!("Hello, batless!");
      }
    EOS

    assert_match version.to_s, shell_output("#{bin}/batless --version")
    assert_match "batless", shell_output("#{bin}/batless --help")
    assert_match "Hello, batless!", shell_output("#{bin}/batless #{testpath}/test.rs")

    json_output = shell_output("#{bin}/batless --mode=json #{testpath}/test.rs")
    assert_match(/"mode":\s*"json"/, json_output)
    assert_match(/"language":\s*"Rust"/, json_output)

    index_output = shell_output("#{bin}/batless --mode=index #{testpath}/test.rs")
    assert_match "main", index_output
  end
end
