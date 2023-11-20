FROM debian:12-slim

RUN apt update && apt upgrade -y
RUN apt install -y gcc git nodejs npm zip unzip curl python3 python3-venv
RUN npm --version
RUN python3 --version

RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y
ENV PATH="$PATH:/root/.cargo/bin"
RUN cargo install ripgrep
RUN cargo install bob-nvim
RUN bob use latest
ENV PATH="$PATH:/root/.local/share/bob/nvim-bin"

WORKDIR /root

RUN mkdir -p /root/.config/nvim/
COPY . /root/.config/nvim/

SHELL ["/bin/bash", "-c"]

RUN nvim --headless "+Lazy! sync" +qa

RUN nvim --headless "+MasonInstall clangd" +qa
RUN nvim --headless "+MasonInstall clang-format" +qa
RUN nvim --headless "+MasonInstall cmake-language-server" +qa
RUN nvim --headless "+MasonInstall stylua" +qa
RUN nvim --headless "+MasonInstall lua-language-server" +qa
RUN nvim --headless "+MasonInstall ruff-lsp" +qa
RUN nvim --headless "+MasonInstall ruff" +qa
RUN nvim --headless "+MasonInstall pyright" +qa

