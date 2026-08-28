# Cache Observations

## Unoptimised build

After changing only a comment in `src/server.js`, the `npm ci --omit=dev` step ran again.

Relevant output:

```text
RUN npm ci --omit=dev && node -e "setTimeout(() => {}, 3000)"
DONE 8.0s
```

This happened because `COPY . .` came before `npm ci`. Changing `src/server.js` changed the `COPY` layer, so Docker had to rebuild the later dependency-install layer too.

## Cached build

After reorganising the Dockerfile and changing only a comment in `src/server.js`, the dependency-install step was reused from cache.

Relevant output:

```text
RUN npm ci --omit=dev && node -e "setTimeout(() => {}, 3000)"
CACHED
```

The source layer rebuilt, but the dependency-install layer did not.

## Runtime validation

The application returned:

```json
{"service":"cache-lab","status":"ok"}
```
