# 由 brew-publish-formula --init 生成。
# 请按项目修改 desc、license 和 install。
class BrewPublishFormula < Formula
  desc "Install brew-publish-formula"
  homepage "https://github.com/hanqunfeng/brew-publish-formula"
  url "https://github.com/hanqunfeng/brew-publish-formula/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "869138be3f7fa365858e193c899002b60f46cad2bde39f1ec183dbf087508d63"
  license "MIT"

  def install
    bin.install "brew-publish-formula"
  end

  test do
    assert_match "brew-publish-formula", shell_output("#{bin}/brew-publish-formula --help")
  end
end
