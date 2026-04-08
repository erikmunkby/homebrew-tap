class Lazytask < Formula
  desc "A task manager built for AI coding agents"
  homepage "https://github.com/erikmunkby/lazytask"
  license "MIT"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikmunkby/lazytask/releases/download/lazytask-v#{version}/lt-aarch64-apple-darwin-lazytask-v#{version}.tar.gz"
      sha256 "cbdcc4df65e208d437da18932cc63f72ea0a4acc165582150770f5be6d1ef275"
    else
      url "https://github.com/erikmunkby/lazytask/releases/download/lazytask-v#{version}/lt-x86_64-apple-darwin-lazytask-v#{version}.tar.gz"
      sha256 "1a6d449656709303497484fa16aa9356e9fd2f29b0f5a37cfb28f9f6bfbff15f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "lazytask is not yet available for Linux ARM"
    else
      url "https://github.com/erikmunkby/lazytask/releases/download/lazytask-v#{version}/lt-x86_64-unknown-linux-gnu-lazytask-v#{version}.tar.gz"
      sha256 "4416c6d462042f40fb2ad60aba4c7d26419a28b1ee9885689b3a247c8c617e33"
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
