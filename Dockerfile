FROM esysescript/esys-escript:latest as intermediate

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install curl
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs >> rustup-script.sh && chmod 777 rustup-script.sh
RUN ./rustup-script.sh -y
RUN ~/.cargo/bin/rustup default nightly
RUN ~/.cargo/bin/cargo install viu

FROM esysescript/esys-escript:latest

MAINTAINER Sebastian Langer, 2022

COPY --from=intermediate /root/.cargo/bin/viu /bin

RUN apt-get update && apt install -y libgl1-mesa-glx xvfb && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip3 install pyvista
