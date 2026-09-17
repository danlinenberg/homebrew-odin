# The Homebrew tap for Odin: https://github.com/danlinenberg/odin
#
# This lives in its own repo so the tap name resolves on its own — `brew install
# --cask danlinenberg/odin/odin` finds danlinenberg/homebrew-odin without being
# told a URL, which is one command less than tapping by hand. It also keeps brew
# out of the app repo's history, which lands PRs as squash merges: a tap cloned
# from that repo diverges from origin/main, and the rebase `brew update` runs
# then conflicts across every file and wedges the tap.
cask "odin" do
  # ponytail: no pinned version/sha — the release workflow always publishes the
  # same asset name, so this tracks whatever is newest with nothing to bump.
  # Swap to a real version + sha256 if `brew upgrade` (without --greedy) or
  # installing an older build ever matters.
  version :latest
  sha256 :no_check

  url "https://github.com/danlinenberg/odin/releases/latest/download/Odin-arm64.dmg"
  name "Odin"
  desc "Personal work console for delegating to coding agents"
  homepage "https://github.com/danlinenberg/odin"

  depends_on arch: :arm64

  app "Odin.app"

  # Clears the quarantine flag the download arrived with. Releases are signed
  # with a self-signed certificate rather than an Apple Developer ID, so
  # Gatekeeper blocks a quarantined copy outright — and Homebrew 7 removed
  # --no-quarantine. `run` is one of the step verbs a cask may use, and
  # writable_paths is what lets it touch the installed bundle.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "/Applications/Odin.app"],
        writable_paths: ["/Applications/Odin.app"],
        must_succeed:   false
  end

  zap trash: [
    "~/.odin",
    "~/Library/Application Support/Odin",
    "~/Library/Logs/Odin",
    "~/Library/Preferences/com.dan.odin.plist",
    "~/Library/Saved Application State/com.dan.odin.savedState",
  ]
end
