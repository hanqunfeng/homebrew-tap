# frozen_string_literal: true

# Publish npm packages with GitHub Actions OIDC trusted publishing.
class NpmPublishOidc < Formula
  desc "Publish npm packages with GitHub Actions OIDC"
  homepage "https://github.com/hanqunfeng/npm-publish-oidc"
  url "https://github.com/hanqunfeng/npm-publish-oidc/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "fa6945a25904508fb947afb8993cb5fd3ebfd63e2f9ac5d049a0257c7f4d6e08"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "npm-publish-oidc", "publish.yml.tmpl"
    chmod 0755, libexec/"npm-publish-oidc"
    bin.install_symlink libexec/"npm-publish-oidc"
  end

  def caveats
    <<~EOS
      GitHub CLI is required to publish and watch Actions:
        brew install gh
        gh auth login
      --init, --check, and --dry-run do not need gh.
    EOS
  end

  test do
    assert_match "用法", shell_output("#{bin}/npm-publish-oidc --help")
    assert_path_exists libexec/"publish.yml.tmpl"
  end
end
