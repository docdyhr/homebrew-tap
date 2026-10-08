class Batless < Formula
  desc "Fast, non-blocking code and text viewer inspired by bat"
  homepage "https://github.com/docdyhr/batless"
  version "0.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docdyhr/batless/releases/download/v0.7.2/batless-aarch64-apple-darwin.tar.gz"
      sha256 "b2b44fa28897c0bdb327829ee0f4e17ce73d88bd28035574172a4fa9917d181d"
    else
      url "https://github.com/docdyhr/batless/releases/download/v0.7.2/batless-x86_64-apple-darwin.tar.gz"
      sha256 "59932a3a0814b366693b4eab82406b68584ac2c6beaba0537b0657da790ae949"
    end
  end

  on_linux do
    url "https://github.com/docdyhr/batless/releases/download/v0.7.2/batless-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dc75fd5f34b060e2a8a5dfae9719c1b20bbbae5f6fd7b6f89748983c2d69ad99"
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
