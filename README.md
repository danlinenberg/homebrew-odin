# homebrew-odin

The Homebrew tap for [Odin](https://github.com/danlinenberg/odin) — a personal
work console for delegating to coding agents.

```sh
brew trust --tap danlinenberg/odin && brew install --cask danlinenberg/odin/odin
```

`brew trust` is not optional: Homebrew 7 refuses to load a tap that isn't
official until it is trusted, and there is no environment variable that
pre-trusts one.

Odin updates itself after that, so there is no `brew upgrade` step in the normal
loop — **Odin → Check for Updates…**, or it offers on launch. `brew upgrade
--cask --greedy odin` still works if you would rather brew did it.

macOS on Apple Silicon only. Releases are signed with an Apple Developer ID and
notarized, so macOS opens the app without a warning.

One command instead of two, at the cost of trusting a `curl` line, is in the
[Odin README](https://github.com/danlinenberg/odin#install).
