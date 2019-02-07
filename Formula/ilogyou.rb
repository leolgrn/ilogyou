class Ilogyou < Formula
  desc "Swift Framework for membership handling"
  homepage "https://github.com/leolgrn/iLogYou/"
  url "https://github.com/leolgrn/homebrew-ilogyou/releases/download/ilogyou/ilogyou.tar.gz"
  version "1.0.0"
  sha256 "fe7d4d454e591d80ad46e83839dbc0a7eb754b5dc5f951ff1680945686df5257"

  def install
    bin.install "iLogYou"
  end
end
