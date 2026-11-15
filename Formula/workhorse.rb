class Workhorse < Formula
  desc "Zero-dependency coding agent that runs scoped tasks on cheap models"
  homepage "https://github.com/juanveralabs/workhorse"
  url "https://github.com/juanveralabs/workhorse/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "54dd2742a0b4734aa7e5a1e799a5a082e69826bf7d14e3653520ef0d148ca57b"
  license "MIT"

  depends_on "python@3.13"

  # Pure Python with no dependencies: the packages are copied as they are and
  # run with Homebrew's Python. Nothing is compiled or downloaded.
  def install
    libexec.install "src/workhorse", "src/provider_core"
    (bin/"workhorse").write <<~SH
      #!/bin/bash
      PYTHONPATH="#{libexec}" exec "#{Formula["python@3.13"].opt_bin}/python3.13" -m workhorse "$@"
    SH
  end

  test do
    assert_match "workhorse #{version}", shell_output("#{bin}/workhorse version")
    assert_match "name: workhorse", shell_output("#{bin}/workhorse --skill")
  end
end
