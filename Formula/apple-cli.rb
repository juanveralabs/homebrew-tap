class AppleCli < Formula
  desc "On-device speech-to-text and LLM text generation for macOS 26+"
  homepage "https://github.com/juanveralabs/apple-cli"
  url "https://github.com/juanveralabs/apple-cli/releases/download/v0.1.1/apple-cli-0.1.1-macos-arm64.tar.gz"
  sha256 "b1ce2c597d1ec59374adbb33a0f0b24c3e5ea44720ee7329dc7bb5a0eb6b5705"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  # Prebuilt binaries: nothing to compile.
  def install
    bin.install "apple-llm", "apple-transcribe"
  end

  test do
    assert_match "Usage: apple-llm", shell_output("#{bin}/apple-llm --help")
    assert_match "Usage: apple-transcribe", shell_output("#{bin}/apple-transcribe --help")
  end
end
