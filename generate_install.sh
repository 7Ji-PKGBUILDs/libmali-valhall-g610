wrappers=(
    'dummy:d'
    'gbm:g'
    'wayland-gbm:w'
    'x11-gbm:x'
    'x11-wayland-gbm:-x11-wayland-gbm'
)
for wrapper in "${wrappers[@]}"; do
    echo -n 'post_install() {
    echo "Note: This mali library is not installed as global library as the GLES-only libamli would break your DE running on OpenGL"
    echo "Note: To use the library for a specific program, run it like '"'libmali${wrapper#*:} [program]'"'"
}' > install_"${wrapper%%:*}"
done