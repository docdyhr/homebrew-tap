class Macversiontracker < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for tracking macOS apps installed outside the App Store"
  homepage "https://github.com/docdyhr/versiontracker"
  url "https://github.com/docdyhr/versiontracker/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "ea45aaaec1f0d2d7933f9f11918237e5b081c84e56abd10dbba7cae57d7d8947"
  license "MIT"

  depends_on "python@3.12"

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959b7f74571d160e6ef0f7f12"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/2a/80/336820c1ad9286a4ded7e845b2eccfcb27851ab8ac6abece774a6ff4d3de/psutil-6.1.1.tar.gz"
    sha256 "cf8496728c18f2d0b45198f06895be52f36611711746b7f30c464b422b50e2f5"
  end

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/ec/fe/802052aecb21e3f7571f8b7571b6da800c0bacdf002ab3543cae5e75dca1/tabulate-0.9.0.tar.gz"
    sha256 "0095b12bf5966de529c0feb1fa08671671b3f7f0450b5a1e2a40d24c9e867b88"
  end

  resource "aiohttp" do
    url "https://files.pythonhosted.org/packages/1a/f0/e15f5f4339bc23a1e9c19660a67e45e34e1b7a50a53f18b4d85f7ec5e4a4/aiohttp-3.11.16.tar.gz"
    sha256 "16f8a2c9538c14a557b4d309ed4d0a4f4e7b2b1d6c0f2d45d5093d6d076a92e4"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "versiontracker", shell_output("#{bin}/versiontracker --help 2>&1", 0)
  end
end
