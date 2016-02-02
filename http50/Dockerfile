FROM python:3
MAINTAINER Mark Ignacio <mignacio@hackucf.org>
EXPOSE 80

RUN mkdir -p /opt/challenges/http50
WORKDIR /opt/challenges/http50
COPY . .
RUN pip install -r requirements.txt
CMD python challenge.py
