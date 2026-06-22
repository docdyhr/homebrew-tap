# typed: false
# frozen_string_literal: true

class MacwhisperMcpServer < Formula
  desc "Local MCP server exposing MacWhisper transcription to Claude Desktop"
  homepage "https://github.com/docdyhr/macwhisper-mcp-server"
  url "https://files.pythonhosted.org/packages/6f/71/21f193351e74cd9d007a0c71390492bd7bc43b775a227856a8cf1ef5a9f6/macwhisper_mcp_server-1.1.1.tar.gz"
  sha256 "116b0eb7aa86e677093cf839c3dab951181313f60bc182970047160e8fdcd3fa"
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
