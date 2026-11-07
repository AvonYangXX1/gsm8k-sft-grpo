#!/usr/bin/env bash
set -euo pipefail
repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
target="$repo_root/vendor/verl"
revision="b17218ba58a6fbcdfb0de32772e3c2a79f88529d"
if [[ -e "$target" ]]; then
  echo "Existing checkout found: $target. Inspect it manually; no changes made." >&2
  exit 1
fi
mkdir -p "$repo_root/vendor"
git clone https://github.com/verl-project/verl.git "$target"
git -C "$target" checkout --detach "$revision"
echo "Upstream checked out. Follow this revision's installation instructions before training."

