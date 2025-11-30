# docker buildx create --use --name docker_single_cell_pipeline_builder
# docker buildx inspect --bootstrap
# docker buildx use docker_single_cell_pipeline_builder
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    -t tronghieunguyen/monocle212_r36 \
    --push . 

# since the docker with r 3.6 is quite old, we just build as default platform.
# docker build -t tronghieunguyen/monocle212_r36 .