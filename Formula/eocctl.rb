# 2025-10-31T17:08:21.764176+00:00
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
        expected_sha = "adaddf05a1491d5f15d3fed8bde48c8d7b55f6beca424a5c510b481ef35b9c44"
        actual_sha = Digest::SHA256.file("eocctl").hexdigest

        if actual_sha != expected_sha
          odie "SHA256 mismatch for some_script.sh: expected #{expected_sha} but got #{actual_sha}"
        end
        bin.install "eocctl"
      end

  end
end