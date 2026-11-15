class AppleCli < Formula
  desc "On-device speech-to-text and LLM text generation for macOS 26+"
  homepage "https://github.com/juanveralabs/apple-cli"
  url "https://github.com/juanveralabs/apple-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "447882ccb402cb8c811aec9046a1e04d12d3cc09f1139b3733995e4154183099"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "Usage: apple-llm", shell_output("#{bin}/apple-llm --help")
    assert_match "Usage: apple-transcribe", shell_output("#{bin}/apple-transcribe --help")
  end
end
