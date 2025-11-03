FROM rocker/binder
ARG NB_USER
ARG NB_UID
COPY --chown=${NB_USER} . ${HOME}

USER root
RUN if [ -f install.R ]; then R --quiet -f install.R; fi
RUN dpkg -i bmhe_0.1.0-1.0_all.deb && rm bmhe_0.1.0-1.0_all.deb

USER ${NB_USER}
