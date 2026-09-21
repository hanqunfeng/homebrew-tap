# Documentation: https://docs.brew.sh/Cask-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "hello-cask" do
  version "1.0.0"
  sha256 "ab4c0b997500f82fdcc11d716687aa8a1912374dd33fc9d27e81c48dfbb9219e"

  url "https://github.com/hanqunfeng/hello_cask/releases/download/v#{version}/HelloCask-#{version}.zip"
  name "HelloCask"
  desc "A tiny demo macOS app for learning Homebrew Casks"
  homepage "https://github.com/hanqunfeng/hello_cask"


  app "HelloCask.app"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  # 可选：brew uninstall --zap 时清理偏好设置等残留
  zap trash: [
    "~/Library/Saved Application State/com.apple.ScriptEditor.id.HelloCask.savedState",
  ]
end
