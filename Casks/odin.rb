# The Homebrew tap for Odin: https://github.com/danlinenberg/odin
#
# This lives in its own repo so the tap name resolves on its own — `brew install
# --cask danlinenberg/odin/odin` finds danlinenberg/homebrew-odin without being
# told a URL, which is one command less than tapping by hand. It also keeps brew
# out of the app repo's history, which lands PRs as squash merges: a tap cloned
# from that repo diverges from origin/main, and the rebase `brew update` runs
# then conflicts across every file and wedges the tap.
cask "odin" do
  # Pinned rather than :latest: silent releases never become GitHub's latest,
  # so /releases/latest can lag the newest signed build. Odin updates itself
  # after install, so a pin that trails a release costs nothing.
  version "1.1.7"
  sha256 "1a5a00fbe55d3deceab305cf67290c688ce88356bf22f57d9d19aa343c64a8c0"

  url "https://github.com/danlinenberg/odin/releases/download/v#{version}/Odin-arm64.dmg"
  name "Odin"
  desc "Personal work console for delegating to coding agents"
  homepage "https://github.com/danlinenberg/odin"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on arch: :arm64

  app "Odin.app"

  zap trash: [
    "~/.odin",
    "~/Library/Application Support/Odin",
    "~/Library/Logs/Odin",
    "~/Library/Preferences/com.dan.odin.plist",
    "~/Library/Saved Application State/com.dan.odin.savedState",
  ]
end
