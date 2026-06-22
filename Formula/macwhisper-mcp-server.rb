# typed: false
# frozen_string_literal: true

class MacwhisperMcpServer < Formula
  desc "Local MCP server exposing MacWhisper transcription to Claude Desktop"
  homepage "https://github.com/docdyhr/macwhisper-mcp-server"
  url "https://files.pythonhosted.org/packages/b0/2e/b793700eee8f030021383b6e4d76dedd511b96fed28218b1564f2c36e47c/macwhisper_mcp_server-1.1.0.tar.gz"
  sha256 "6cc41204b178a3647282c2e2a16214e5c141fd6d141ec966e4e6251ee5c86aa3"
  license "MIT"

  depends_on "python@3.13"
  depends_on :macos

  def install
    python = Formula["python@3.13"].opt_bin/"python3.13"
    venv = libexec/"venv"
    system python, "-m", "venv", venv
    system "#{venv}/bin/pip", "install", "--no-cache-dir",
           "macwhisper-mcp-server==#{version}"
    bin.install_symlink "#{venv}/bin/macwhisper-mcp"
  end

  test do
    system libexec/"venv/bin/python", "-c", "import macwhisper_mcp; print('ok')"
  end
end
