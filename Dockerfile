FROM python:2.7.12

RUN apt-get update
RUN apt-get install -y git

ENV WORK_DIR /opt/offlineimap

# install offlineimap project
RUN git clone https://github.com/styk-tv/offlineimap.git ${WORK_DIR}
RUN cd ${WORK_DIR} && python setup.py install

EXPOSE 1234
