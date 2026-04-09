class Drop2md < Formula
  desc "macOS document-to-markdown converter with folder watching and LLM integration"
  homepage "https://github.com/docdyhr/drop2md"
  license "MIT"
  version "1.0.0"

  on_arm do
    url "https://github.com/docdyhr/drop2md/releases/download/v#{version}/drop2md-#{version}-arm64.dmg"
    sha256 "65d94ba0a645a5e816e0b03fef4636a31771b14454943fc17e916f1104e3da97"
  end

  on_intel do
    odie "drop2md pre-built binaries are Apple Silicon (arm64) only at this time. " \
         "Install from source: pip install 'drop2md[pdf-light,office,ocr]'"
  end

  # tesseract is called as a subprocess by pytesseract — not bundled in the binary
  depends_on "tesseract"

  # pandoc is used by the EPUB converter
  depends_on "pandoc" => :recommended

  def install
    # Mount the dmg, copy the onedir bundle, unmount
    system "hdiutil", "attach", "-nobrowse", "-quiet",
           "-mountpoint", "/Volumes/drop2md_pkg",
           cached_download

    # Copy the full onedir bundle into libexec — the binary finds _internal/
    # relative to its own path, so a bare bin/ symlink does NOT work.
    (libexec/"drop2md").mkpath
    cp_r "/Volumes/drop2md_pkg/drop2md/.", libexec/"drop2md"

    system "hdiutil", "detach", "/Volumes/drop2md_pkg", "-quiet"

    (bin/"drop2md").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/drop2md/drop2md" "$@"
    EOS
    chmod 0755, bin/"drop2md"
  end

  def caveats
    <<~EOS
      drop2md requires tesseract for OCR (installed automatically).

      Optional — install Ollama for local AI enhancement:
        brew install ollama
        ollama pull llava-llama3:8b

      Get started:
        drop2md setup              # interactive configuration wizard
        drop2md install-service    # install background watcher (launchd)

      For ML-quality PDF conversion (~2 GB download):
        pip install 'drop2md[pdf-ml]'
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/drop2md --version")
    assert_match "convert", shell_output("#{bin}/drop2md --help")
  end
end
