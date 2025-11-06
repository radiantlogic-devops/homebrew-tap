# 2025-11-06T19:11:35.618080+00:00
class Eocctl < Formula
  desc "Official EOC CLI tool."
  homepage "https://github.com/radiantlogic-devops/eocctl"
  version "v1.0.0-beta.1"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/radiantlogic-devops/rlitools-dist/releases/download/v1.0.0/rlitools_1.0.0_darwin_arm64.tar.gz"
    sha256 "ed82bd2813364cdd1aa536f3961c0ce3ba0023c4acf1e79abbde6abd1d44ebbb"

      def install
        system "./rlitools", "download", "https://dist.saas.radiantlogic.com/releases/eocctl/v1.0.0-beta.1/darwin/eocctl-darwin-arm64"
        expected_sha = "9433efa8f5ba557b698b2fa890aa09d514872cf431a5d5df54ed914caeeffe18"
        actual_sha = Digest::SHA256.file("eocctl").hexdigest

        if actual_sha != expected_sha
          odie "SHA256 mismatch for some_script.sh: expected #{expected_sha} but got #{actual_sha}"
        end
        bin.install "eocctl"
      end

  end
end