# typed: false
# frozen_string_literal: true

class MacwhisperMcpServer < Formula
  desc "Local MCP server exposing MacWhisper transcription to Claude Desktop"
  homepage "https://github.com/docdyhr/macwhisper-mcp-server"
  url "https://files.pythonhosted.org/packages/fd/24/e383a77d0bc4fcd15e1beab5372bbb8a46ba234c41dccbbc5bba27475335/macwhisper_mcp_server-1.2.1.tar.gz"
  sha256 "9e91a7867aebc9a5c647d6ea989f17c520737c07b603479f7b9af87042c8771e"
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
