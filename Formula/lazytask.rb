class Lazytask < Formula
  desc "A task manager built for AI coding agents"
  homepage "https://github.com/erikmunkby/lazytask"
  license "MIT"
  version "0.6.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikmunkby/lazytask/releases/download/lazytask-v#{version}/lt-aarch64-apple-darwin-lazytask-v#{version}.tar.gz"
      sha256 "5f9daaed238751739c5a507a2867d08e3a9cc02072a01b4bf543b8fa107d0221"
    else
      url "https://github.com/erikmunkby/lazytask/releases/download/lazytask-v#{version}/lt-x86_64-apple-darwin-lazytask-v#{version}.tar.gz"
      sha256 "f5b5def67e3b4d2ea6f4d367928bc82fc11557fc5b1d9a6b71a877f3da76eb83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "lazytask is not yet available for Linux ARM"
    else
      url "https://github.com/erikmunkby/lazytask/releases/download/lazytask-v#{version}/lt-x86_64-unknown-linux-gnu-lazytask-v#{version}.tar.gz"
      sha256 "a4b877dc7927e6d16aaf12864c8029b1cda7a53eb3c510f71e76add9f3d9fdd0"
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
