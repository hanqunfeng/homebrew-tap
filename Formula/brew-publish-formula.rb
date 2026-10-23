# 由 brew-publish-formula --init 生成。
# 请按项目修改 desc、license 和 install。
class BrewPublishFormula < Formula
  desc "Install brew-publish-formula"
  homepage "https://github.com/hanqunfeng/brew-publish-formula"
  url "https://github.com/hanqunfeng/brew-publish-formula/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "03148561cf4d64f1d33fe05f0b5bd7a37f4619b2d7f58401046d94dde5342730"
  license "MIT"

  def install
    bin.install "brew-publish-formula"
  end

  def caveats
    <<~EOS
      Runtime dependencies are not declared here. These commands must already be installed:
        git, curl, ruby, and brew
        shasum or sha256sum
      shellcheck is only used when publishing this repository. Skip it with --skip-check.
    EOS
  end

  test do
    assert_match "brew-publish-formula", shell_output("#{bin}/brew-publish-formula --help")
  end
end
