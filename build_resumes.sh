#!/usr/bin/env bash
# Build resume PDFs from the single canonical source, injecting the
# Objective line per variant so no specialist source file is needed.
#
# Usage:
#   ./build_resumes.sh              # build both variants
#   ./build_resumes.sh generalist   # live site resume
#   ./build_resumes.sh specialist   # US startup resume (git-ignored output)
set -euo pipefail
cd "$(dirname "$0")"

SOURCE="Vaughan_Love_Resume_source.typ"
GENERALIST_OBJECTIVE='Full-stack engineer who builds and ships production AI products end-to-end.'
SPECIALIST_OBJECTIVE='Founding engineer building production AI for life sciences and regulated environments, from LLM workflows and self-hosted inference to the tools researchers and clients use.'

command -v typst >/dev/null 2>&1 || { echo "error: typst not found on PATH" >&2; exit 1; }
[[ -f "$SOURCE" ]] || { echo "error: $SOURCE not found" >&2; exit 1; }

build() {
    local objective="$1" output="$2"
    local tmp
    tmp="$(mktemp /tmp/resume_variant_XXXXXX.typ)"
    # Replace the line immediately following the Objective section header.
    awk -v obj="$objective" '
        prev == "#section(\"Objective\")" { print obj; prev = ""; next }
        { print; prev = $0 }
    ' "$SOURCE" > "$tmp"
    grep -qF "$objective" "$tmp" || { echo "error: objective injection failed" >&2; rm -f "$tmp"; exit 1; }
    typst compile "$tmp" "$output"
    rm -f "$tmp"
    echo "built $output"
}

target="${1:-all}"
case "$target" in
    generalist) build "$GENERALIST_OBJECTIVE" "Vaughan_Love_Resume.pdf" ;;
    specialist) build "$SPECIALIST_OBJECTIVE" "Vaughan_Love_Resume_specialist.pdf" ;;
    all)
        build "$GENERALIST_OBJECTIVE" "Vaughan_Love_Resume.pdf"
        build "$SPECIALIST_OBJECTIVE" "Vaughan_Love_Resume_specialist.pdf"
        ;;
    *) echo "usage: $0 [generalist|specialist]" >&2; exit 2 ;;
esac
