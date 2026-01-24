# RHTLC Release Assets

This directory contains release binaries for RHTLC (Red Hat Training Lab Connector).

## Why Are Binaries Here?

The source code repository is private, but we want to provide public access to 
release binaries via Homebrew. By storing the binaries in this public tap repository,
users can install RHTLC via Homebrew without needing access to the private source repo.

## Directory Structure

releases/
  - 3.4.1/
    - rhtlc-macos-x86_64
    - rhtlc-macos-arm64
    - rhtlc-gui-macos-x86_64.zip
    - rhtlc-gui-macos-arm64.zip
  - [other versions]/

## Installation

Add the tap:
brew tap RedHatTraining/rhtlc

Install CLI:
brew install rhtlc

Install GUI:
brew install --cask rhtlc-gui

## Checksums

SHA256 checksums are embedded in the Homebrew formulas.

## Source Repository

Source code: https://github.com/RedHatTraining/dle-wstunnel-ole (private)
