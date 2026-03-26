class Lazytask < Formula
  desc "A task manager built for AI coding agents"
  homepage "https://github.com/erikmunkby/lazytask"
  license "MIT"
  version "0.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikmunkby/lazytask/releases/download/lazytask-v#{version}/lt-aarch64-apple-darwin-lazytask-v#{version}.tar.gz"
      sha256 "72c58b26ca57de09873b1a55093656cccdff4b25ee0969d4ed5cd98bdf4b007c"
    else
      url "https://github.com/erikmunkby/lazytask/releases/download/lazytask-v#{version}/lt-x86_64-apple-darwin-lazytask-v#{version}.tar.gz"
      sha256 "08f8b39df213536b75a3b89cf434a6268eb9f16bad248a92b10a4587c3329ea0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "lazytask is not yet available for Linux ARM"
    else
      url "https://github.com/erikmunkby/lazytask/releases/download/lazytask-v#{version}/lt-x86_64-unknown-linux-gnu-lazytask-v#{version}.tar.gz"
      sha256 "dbdd5d5412766d4c2eca3375376f58abce5d4d0710046679b2f1089760835fed"
    end
  end

  def install
    bin.install "lt"
    bin.install_symlink "lt" => "lazytask"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lt --version")
  end
end
