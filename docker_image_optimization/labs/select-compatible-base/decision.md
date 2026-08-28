# Base Image Decision

## Candidate sizes

* Ubuntu: `29756420` bytes
* Debian slim: `28235700` bytes
* Alpine: `3790780` bytes

## Base references

* Ubuntu: `ubuntu:24.04`
* Debian slim: `debian:12-slim`
* Alpine: `alpine:3.22`

## Selected base

`alpine:3.22`

Alpine is the smallest provided candidate and satisfies all requirements in `runtime-requirements.md`. The application requires Linux and a POSIX-compatible `/bin/sh`, has no `glibc`-specific dependency, and does not require package installation or an interactive debugging shell in production.

The selected image is configured to run as the non-root user and group `65532:65532`.

## When Debian slim would be safer

Debian slim would be safer if the application required `glibc`, a binary compiled for `glibc`, or a vendor-supported Debian package. Alpine uses `musl libc`, so some software designed for Debian or `glibc` may not work correctly on Alpine.

## Versioned tags and digests

A versioned tag such as `alpine:3.22` gives more control than `latest` because it selects a specific release.

However, a tag is not immutable because the image associated with that tag can still be updated. A digest such as `@sha256:...` identifies one exact image, so a digest is required for a fully immutable base reference.

## Runtime user

`65532:65532`
