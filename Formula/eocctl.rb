# 2025-10-31T17:11:11.356901+00:00
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
        expected_sha = "220ae4ecb5c7ad02b536bc59270436edd3b5ab00067e6f4aa040ab5cf5f401f9"
        actual_sha = Digest::SHA256.file("eocctl").hexdigest

        if actual_sha != expected_sha
          odie "SHA256 mismatch for some_script.sh: expected #{expected_sha} but got #{actual_sha}"
        end
        bin.install "eocctl"
      end

  end
end