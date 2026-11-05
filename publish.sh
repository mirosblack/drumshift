#!/bin/zsh
# Publishes the support + privacy pages as a public GitHub repo with GitHub Pages:
#   https://mirosblack.github.io/drumshift/          (Support URL)
#   https://mirosblack.github.io/drumshift/privacy.html (Privacy Policy URL)
set -e
cd "$(dirname "$0")"
[ -d .git ] || { git init -q -b main; git add .; git commit -qm "Drumshift support and privacy pages"; }
gh repo create mirosblack/drumshift --public --description "Drumshift: support and privacy policy" --source . --push
gh api -X POST repos/mirosblack/drumshift/pages -f "source[branch]=main" -f "source[path]=/" >/dev/null
gh repo edit mirosblack/drumshift --enable-issues --homepage https://mirosblack.github.io/drumshift/
echo "Live in a minute: https://mirosblack.github.io/drumshift/"
