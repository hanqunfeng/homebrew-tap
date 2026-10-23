# frozen_string_literal: true

# Publish npm packages with GitHub Actions OIDC trusted publishing.
class NpmPublishOidc < Formula
  desc "Publish npm packages with GitHub Actions OIDC"
  homepage "https://github.com/hanqunfeng/npm-publish-oidc"
  url "https://github.com/hanqunfeng/npm-publish-oidc/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "4d1aef4c21a6b50a48b87ecc881855f343f94134164e16517836d76d1b3dd744"
  license "MIT"

  def install
    libexec.install "npm-publish-oidc", "publish.yml.tmpl"
    chmod 0755, libexec/"npm-publish-oidc"
    bin.install_symlink libexec/"npm-publish-oidc"
  end

  def caveats
    <<~EOS
      Node.js and npm are required and are not installed by this formula.
      Install them yourself and make sure both are on PATH.

      GitHub CLI is required to publish and watch Actions:
        brew install gh
        gh auth login
      --init, --check, and --dry-run do not need gh.
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/npm-publish-oidc --help")
    assert_path_exists libexec/"publish.yml.tmpl"
  end
end
