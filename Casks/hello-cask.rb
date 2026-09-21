# Documentation: https://docs.brew.sh/Cask-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "hello-cask" do
  version "1.0.0"
  sha256 "ab4c0b997500f82fdcc11d716687aa8a1912374dd33fc9d27e81c48dfbb9219e"

  url "https://github.com/hanqunfeng/hello_cask/releases/download/v#{version}/HelloCask-#{version}.zip"
  name "HelloCask"
  desc "Tiny demo app for learning Homebrew Casks"
  homepage "https://github.com/hanqunfeng/hello_cask"

  depends_on :macos

  app "HelloCask.app"
end
