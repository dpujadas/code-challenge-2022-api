FROM python:3.7-alpine

ARG PORT
ARG WORKERS

WORKDIR /cc_app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

ENV PORT ${PORT}
ENV WORKERS ${WORKERS}

EXPOSE ${PORT}

CMD gunicorn -w ${WORKERS} -b 0.0.0.0:${PORT} cc_app:app
