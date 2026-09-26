#!/bin/sh
# Regenerate the autotools build system.
#
# Needed because configure, Makefile.in and friends are not kept in the
# repository (see .gitignore); a fresh checkout has no ./configure.
#
# Usage: ./autogen.sh && ./configure && make

set -e

srcdir=$(dirname "$0")
cd "$srcdir"

for tool in autoreconf autoconf automake aclocal; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "error: $tool not found; install autoconf and automake" >&2
        exit 1
    fi
done

# libutf8proc is located through PKG_CHECK_MODULES, which needs pkg-config.
if ! command -v pkg-config >/dev/null 2>&1; then
    echo "error: pkg-config not found; it is required to find libutf8proc" >&2
    exit 1
fi

echo "Regenerating build system..."
autoreconf -i

echo
echo "Done. Now run:"
echo "    ./configure && make"
