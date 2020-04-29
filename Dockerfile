from ubuntu:20.04
RUN ln -fs /usr/share/zoneinfo/America/Chicago /etc/localtime
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get install -y clang cmake build-essential llvm-6.0-dev opam pkg-config libgmp-dev zlib1g-dev
RUN opam init --auto-setup --comp=4.07.0 --yes --disable-sandboxing
RUN eval $(opam env)
RUN opam install depext --yes
RUN opam install bap --yes
RUN eval $(opam env)
