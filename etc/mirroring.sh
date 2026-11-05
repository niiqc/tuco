#!/usr/bin/env bash
set -e
git remote set-url origin git@git.sr.ht:~niqc/tuco
git config --unset-all remote.origin.pushurl || true
for url in \
    git@git.sr.ht:~niqc/tuco \
    git@codeberg.org:niqc/tuco.git \
    git@github.com:niiqc/tuco.git
do
    git remote set-url --add --push origin "$url"
done
git config push.followTags true
