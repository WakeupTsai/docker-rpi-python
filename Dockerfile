FROM jsurf/rpi-raspbian:latest
RUN ["cross-build-start"]

# Install dependencies
RUN apt-get update && apt-get install -y \
    python \
    python-dev \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

mkdir -p /data
COPY data /data

# Define working directory
WORKDIR /data

# install pip
RUN python get-pip.py

# Define default command
CMD ["bash"]
