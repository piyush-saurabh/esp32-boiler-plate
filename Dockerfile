

# Define global arguments
ARG DEBIAN_FRONTEND="noninteractive"
ARG UID=1000
ARG USER=roguesecurity

# POSIX compatible (Linux/Unix) base image
FROM debian:stable-slim

# Import global arguments
ARG DEBIAN_FRONTEND
ARG UID
ARG USER

# Define local arguments

# Create Non-Root User
RUN ["dash", "-c", "\
    addgroup \
     --gid ${UID} \
     \"${USER}\" \
 && adduser \
     --disabled-password \
     --gecos \"\" \
     --ingroup \"${USER}\" \
     --uid ${UID} \
     \"${USER}\" \
 && usermod \
     --append \
     --groups \"dialout,plugdev\" \
     \"${USER}\" \
"]
ENV PATH="/home/${USER}/.local/bin:${PATH}"

# Step 1. Install Prerequisites
# https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html
RUN ["dash", "-c", "\
    apt-get update --quiet \
 && apt-get install --assume-yes --no-install-recommends --quiet \
     bison \
     ccache \
     cmake \
     dfu-util \
     flex \
     git \
     gperf \
     libffi-dev \
     libssl-dev \
     libusb-1.0-0 \
     nano \
     ninja-build \
     python3 \
     python3-pip \
     python3-venv \
     python3-setuptools \
     udev \
     wget \
 && apt-get clean \
 && apt-get purge \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
"]

# Install IDF as non-root user
WORKDIR /home/${USER}/
USER ${USER}

# Step 2. Get ESP-IDF (use the specific version instead of latest, e.g. v4.3.2)
# https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/index.html#step-2-get-esp-idf
RUN ["dash", "-c", "\
    mkdir esp \
 && cd esp/ \
 && git clone -b v4.3.2 --recursive https://github.com/espressif/esp-idf.git \
"]

# Step 3. Set up the tools
# https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/index.html#step-3-set-up-the-tools
RUN ["dash", "-c", "\
    cd ./esp/esp-idf \
 && ./install.sh esp32 \
"]

# Step 4. Update development environment
ENV LC_ALL=C