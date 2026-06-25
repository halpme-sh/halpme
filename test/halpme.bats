#!/usr/bin/env bats

setup() {
  export HALPME_DIR="$BATS_TEST_DIRNAME/fixtures"
  export PATH="$BATS_TEST_DIRNAME/mocks:$PATH"
  SCRIPT="$BATS_TEST_DIRNAME/../halpme.zsh"
}

@test "no args shows TOC with section keywords" {
  run zsh "$SCRIPT"
  [ "$status" -eq 0 ]
  [[ "$output" == *"git"* ]]
  [[ "$output" == *"shell"* ]]
}

@test "TOC groups sections by filename" {
  run zsh "$SCRIPT"
  [ "$status" -eq 0 ]
  [[ "$output" == *"git.md"* ]]
  [[ "$output" == *"shell.md"* ]]
}

@test "keyword shows matching section content" {
  run zsh "$SCRIPT" git
  [ "$status" -eq 0 ]
  [[ "$output" == *"Git Workflow"* ]]
}

@test "keyword matches multiple sections across a file" {
  run zsh "$SCRIPT" git
  [ "$status" -eq 0 ]
  [[ "$output" == *"Git Workflow"* ]]
  [[ "$output" == *"Making a Commit"* ]]
}

@test "unknown keyword exits nonzero with helpful message" {
  run bash -c "zsh \"$SCRIPT\" zzznomatch 2>&1"
  [ "$status" -eq 1 ]
  [[ "$output" == *"no section matching"* ]]
  [[ "$output" == *"halpme"* ]]
}

@test "empty HALPME_DIR exits nonzero" {
  export HALPME_DIR="$BATS_TMPDIR/empty-halpme-$$"
  mkdir -p "$HALPME_DIR"
  run bash -c "HALPME_DIR=\"$BATS_TMPDIR/empty-halpme-$$\" zsh \"$SCRIPT\" 2>&1"
  [ "$status" -eq 1 ]
  [[ "$output" == *"no topic files"* ]]
}
