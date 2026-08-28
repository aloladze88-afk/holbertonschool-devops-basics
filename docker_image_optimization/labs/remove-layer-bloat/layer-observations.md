# Layer Observations

## Checksums

Unoptimized image:

`a0e8bdd8a312de8e45d2cea454dee228ede781730bfc321d96a6fced1b634090`

Optimized image:

`a0e8bdd8a312de8e45d2cea454dee228ede781730bfc321d96a6fced1b634090`

Both images produce the same runtime result.

## Image sizes

- Unoptimized: `10084890` bytes
- Optimized: `3790446` bytes
- Difference: `6294444` bytes

The optimized image is more than 5 MiB smaller.

## Unoptimized layer retaining the payload

The unoptimized image history shows this layer:

`RUN ... cp /mnt/build-payload.bin /tmp/build-payload.bin` — about `6.3MB`

That layer stores the payload bytes.

A later layer runs:

`rm -f /tmp/build-payload.bin`

This removes the file from the final merged filesystem, but Docker image layers are immutable. The earlier layer still contains those bytes, so the image remains larger.

## Optimized build

The optimized Dockerfile copies the payload, calculates the checksum, and deletes the temporary file in the same `RUN` instruction.

Because the temporary file is removed before that layer is committed, its bytes are not retained in the final image layer.