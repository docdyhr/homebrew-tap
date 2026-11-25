# typed: false
# frozen_string_literal: true

class MacwhisperMcpServer < Formula
  desc "Local MCP server exposing MacWhisper transcription to Claude Desktop"
  homepage "https://github.com/docdyhr/macwhisper-mcp-server"
  url "https://files.pythonhosted.org/packages/5c/d9/f43cf6d2f15748b2c5d6a567866a2f6da9f71208723198d6e83501fb47df/macwhisper_mcp_server-1.2.2.tar.gz"
  sha256 "cab776c988a4285dd998e41b3c3c748cbd6c140b45e0727a3f59fc54a5ccfe95"
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
