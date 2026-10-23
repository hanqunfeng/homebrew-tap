# frozen_string_literal: true

# Publish npm packages with GitHub Actions OIDC trusted publishing.
class NpmPublishOidc < Formula
  desc "Publish npm packages with GitHub Actions OIDC"
  homepage "https://github.com/hanqunfeng/npm-publish-oidc"
  url "https://github.com/hanqunfeng/npm-publish-oidc/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "96b8f7d523d898f5df98d8a41428c9914f89b6cdc878270129f01950bf7c9726"
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
    assert_match "用法", shell_output("#{bin}/npm-publish-oidc --help")
    assert_path_exists libexec/"publish.yml.tmpl"
  end
end
