class Batless < Formula
  desc "Fast, non-blocking code and text viewer inspired by bat"
  homepage "https://github.com/docdyhr/batless"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/docdyhr/batless/releases/download/v0.7.1/batless-aarch64-apple-darwin.tar.gz"
      sha256 "293b805e58ac5b601c50b111b598aec91209d3d336ef30a5e8fb103c4c83e86d"
    else
      url "https://github.com/docdyhr/batless/releases/download/v0.7.1/batless-x86_64-apple-darwin.tar.gz"
      sha256 "e2d4c6c374d634f518f5db5a64075ea4151337bbc13fa30660758ad14678bf53"
    end
  end

  on_linux do
    url "https://github.com/docdyhr/batless/releases/download/v0.7.1/batless-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ff26d0f19ec18a50679a4ace171d8faef58d882209bf9fd86a9775ae2b16ea6b"
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
