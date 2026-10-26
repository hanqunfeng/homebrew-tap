# 由 brew-publish-formula --init 生成。
# 请按项目修改 desc、license 和 install。
class BrewPublishFormula < Formula
  desc "Install brew-publish-formula"
  homepage "https://github.com/hanqunfeng/brew-publish-formula"
  url "https://github.com/hanqunfeng/brew-publish-formula/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "3ec0288305d20c34e8db0dede52d61320539cfe98490c2bf71e312135a9bd412"
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
