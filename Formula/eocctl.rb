class Eocctl < Formula
  desc "Official EOC CLI tool."
  homepage "https://github.com/radiantlogic-devops/eocctl"
  version "v1.0.0-beta.1"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/radiantlogic-devops/rlitools-dist/releases/download/v1.0.0/rlitools_1.0.0_darwin_arm64.tar.gz"
    sha256 "6c876431316a658bb0bbfffa1b25243abaff1ae0713918c1644d85288678101a"

      def install
        system "./rlitools", "download", "https://dist.saas.radiantlogic.com/releases/eocctl/v1.0.0-beta.1/darwin/eocctl-darwin-arm64"
        bin.install "eocctl"
      end

  end
end