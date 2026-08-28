# Multistage Build Observations

## Runtime output

Single-stage image:

`{"service":"greeter","status":"ok"}`

Optimized multistage image:

`{"service":"greeter","status":"ok"}`

## Image sizes

- Single-stage: `79056672` bytes
- Optimized: `1355388` bytes
- Difference: `77701284` bytes

## Runtime user

`65532:65532`

## Shell test

Running:

`docker run --rm --entrypoint /bin/sh multistage-lab:optimized`

failed with:

`exec: "/bin/sh": stat /bin/sh: no such file or directory`

This is expected because the final stage uses `scratch`, which contains only the copied application binary and no shell.

The failed shell command confirms that `/bin/sh` is not present, but it does not replace functional testing. The application binary must still be run directly to verify that it works correctly.