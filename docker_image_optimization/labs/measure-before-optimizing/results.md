# Baseline Results

## Image size

380984616 bytes

## Largest non-base instruction

`COPY . .` — 8.44 MB

## Runtime user

No runtime user is explicitly configured (`""`), so the container runs as `root` by default.

## Unnecessary copied files

* `tests/`
* `reports/`

## Optimisation targets

1. Reduce unnecessary files copied into the image.
   Evidence: `COPY . .` creates an 8.44 MB layer and includes unnecessary paths such as `tests/` and `reports/`.
   Optimisation: add a `.dockerignore` and/or copy only the files required by the application.

2. Run the application as a non-root user.
   Evidence: `docker image inspect` returned `""` for `.Config.User`, so no runtime user is configured and the container runs as root by default.
   Optimisation: create and configure a non-root user with the `USER` instruction.

3. Reduce the size of the base image.
   Evidence: `docker image history` shows large base-image layers, including layers of 619 MB, 194 MB, and 73.1 MB.
   Optimisation: compare the current Python base image with a smaller compatible, versioned Python base image.
