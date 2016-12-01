FROM python:2.7

RUN apt-get update
RUN apt-get install -y git

ENV WORK_DIR /opt/offlineimap
ENV APP_PORT 1234

# install offlineimap project
RUN git clone -b docker https://github.com/styk-tv/offlineimap.git ${WORK_DIR}
RUN cd ${WORK_DIR} && python setup.py install

EXPOSE ${APP_PORT}
#WORKDIR ${WORK_DIR}
# this is needed for the kub service
CMD ["python", "-m" , "SimpleHTTPServer", "1234"]
