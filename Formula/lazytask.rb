class Lazytask < Formula
  desc "A task manager built for AI coding agents"
  homepage "https://github.com/erikmunkby/lazytask"
  license "MIT"
  version "0.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikmunkby/lazytask/releases/download/lazytask-v#{version}/lt-aarch64-apple-darwin-lazytask-v#{version}.tar.gz"
      sha256 "b8ed0bd5fd0c7cc87be44b8bd6b8eabcec9584cd57af3684c85babda1b3bf6cf"
    else
      url "https://github.com/erikmunkby/lazytask/releases/download/lazytask-v#{version}/lt-x86_64-apple-darwin-lazytask-v#{version}.tar.gz"
      sha256 "53ec958a40dbf190fa88d12e45a8c22a4c1b3d1e7ffc9e851bf2211663381225"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "lazytask is not yet available for Linux ARM"
    else
      url "https://github.com/erikmunkby/lazytask/releases/download/lazytask-v#{version}/lt-x86_64-unknown-linux-gnu-lazytask-v#{version}.tar.gz"
      sha256 "eabd3add71af245364f023dbeb42ff6003b74285ff40edce3d310b29ac38a089"
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
