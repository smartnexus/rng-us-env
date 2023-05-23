FROM python:3.8-bullseye

ENV OSM_HOSTNAME=capital.us.es:64510
ENV OSM_USER=UVUS
ENV OSM_PROJECT=UVUS
ENV OSM_PASSWORD=PASSWORD

RUN apt-get update && apt-get install -y libmagic-dev
# Upgrade pip to the latest version (with sudo, to install it globally for all users)
RUN yes | python -m pip install -U pip \
    && export OSM_CLIENT_VERSION=v12.0

# Clone IM repo and checkut the desired version
RUN git clone https://osm.etsi.org/gerrit/osm/IM \
    && git -C IM checkout ${OSM_CLIENT_VERSION}

# Install OSM IM using pip
RUN yes | python -m pip install -r IM/requirements.txt \
    && yes | python -m pip install ./IM

# Clone osmclient repo and checkut the desired version
RUN git clone https://osm.etsi.org/gerrit/osm/osmclient \ 
    && git -C osmclient checkout ${OSM_CLIENT_VERSION}

# Install osmclient using pip
RUN yes | python -m pip install -r osmclient/requirements.txt \
    && RUN yes | python -m pip install python-magic==0.4.15 \
    && yes | python -m pip install ./osmclient

RUN alias osm='python -m osmclient.scripts.osm' \
    && rm -rf IM osmclient

WORKDIR /home/rng/
VOLUME [ "/home/rng/" ]

CMD tail -f /dev/null