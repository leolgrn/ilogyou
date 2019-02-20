class Ilogyou < Formula
  desc "Swift Framework for membership handling"
  homepage "https://github.com/leolgrn/homebrew-ilogyou/"
  url "https://github.com/leolgrn/homebrew-ilogyou/releases/download/v1.0.0/ilogyou.tar.gz"
  version "1.0.0"
  sha256 "fe7d4d454e591d80ad46e83839dbc0a7eb754b5dc5f951ff1680945686df5257"

  def install
    bin.install "ilogyou"
  end
end
