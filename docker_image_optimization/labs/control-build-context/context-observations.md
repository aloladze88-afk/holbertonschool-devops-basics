# Build Context Observations

- Unfiltered context size: `2.10MB`

- Filtered context size: `175B`

- Runtime result before `.dockerignore`: `context-contains-local-only-data`

- Runtime result after `.dockerignore`: `context-clean`

## Explanation

`.dockerignore` reduces the data transferred to the Docker builder by excluding files and directories from the build context. It also affects which files are available to later `COPY` or `ADD` instructions. Files excluded by `.dockerignore` are not part of the build context, so they cannot be copied into the image. In this lab, excluding `local-only/` prevents that local-only data from being included by `COPY . .`, which is why the optimized image prints `context-clean`.