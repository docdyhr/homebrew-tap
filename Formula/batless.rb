class Batless < Formula
  desc "Fast, non-blocking code and text viewer inspired by bat"
  homepage "https://github.com/docdyhr/batless"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docdyhr/batless/releases/download/v0.7.0/batless-aarch64-apple-darwin.tar.gz"
      sha256 "9009007edfc7fdda553693b7453e0976ff8f6393fa7d9ab83b82747910244eed"
    else
      url "https://github.com/docdyhr/batless/releases/download/v0.7.0/batless-x86_64-apple-darwin.tar.gz"
      sha256 "fa064abcaf346fdbd0027b1a7f1af09fe2ef43e3c9456e9811731ef1b1c0fc39"
    end
  end

  on_linux do
    url "https://github.com/docdyhr/batless/releases/download/v0.7.0/batless-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cca764e973dd8b6bf95adb03a31cc53c00942dcd86c3b0bb4c1ec5194cdc1bf1"
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
