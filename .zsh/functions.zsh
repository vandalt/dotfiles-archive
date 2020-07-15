# mkdir and cd at once
function mkcd() {
    mkdir -p "$1" && cd "$1";
}
