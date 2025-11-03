FROM rocker/binder

## Declare build arguments with defaults for your custom user
ARG NB_USER=jovyan
# Switch to root to do the main installation
USER root
# Copy your project files to /home/joyvan with ownership
COPY --chown=${NB_USER}:${NB_USER} . /home/${NB_USER}
ENV DEBIAN_FRONTEND=noninteractive
# Move to the /home/${NB_USER} folder where all the local files have been copied
WORKDIR /home/${NB_USER}
RUN if [ -f install.R ]; then R --quiet -f install.R; fi
RUN dpkg -i bmhe_0.1.0-1.0_all.deb && rm bmhe_0.1.0-1.0_all.deb
#RUN dpkg -i R2jags_0.8-7-1.0_all.deb && rm R2jags_0.8-7-1.0_all.deb
#RUN apt install -f -y ./bmhe_0.1.0-1.0_all.deb && rm ./bmhe_0.1.0-1.0_all.deb

USER ${NB_USER}
