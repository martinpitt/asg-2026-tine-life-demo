#!/bin/sh
set -eux

git reset --hard origin/main
git checkout main^
git worktree remove -f .upstream-rpm || true
git branch -D upstream-rpm || true

sed -i 's/4636deb4a7b707a9f04c602db033f9837e50b3f6/0331c7468a5c5142bfb8718d6ff20ce408c8a575/' BUCK
tine/bin/tine buck build :duf :go.box tine//tools:dev.box
git checkout BUCK
