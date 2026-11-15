class AppleCli < Formula
  desc "On-device speech-to-text and LLM text generation for macOS 26+"
  homepage "https://github.com/juanveralabs/apple-cli"
  url "https://github.com/juanveralabs/apple-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3ffe4c2acf212bda2d0fde04a1c8f5ba095b2925a3342045e7a1aa8c3c6d6c0a"
  license "MIT"

  bottle do
    root_url "https://github.com/juanveralabs/apple-cli/releases/download/v0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e4e2db80f6fda0afdd74b02406b3695d86c9a1241ac385f07a30aca3a2dd10eb"
  end

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
