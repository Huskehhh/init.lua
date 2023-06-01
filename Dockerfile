FROM archlinux:latest

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm rustup gcc python3 git curl neovim clang zip unzip nodejs npm
RUN rustup self upgrade-data
RUN rustup default nightly

WORKDIR /root

COPY . .

RUN ./dev.sh

RUN nvim --headless "+Lazy! sync" +qa

