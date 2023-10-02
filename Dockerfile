FROM python:3.9-alpine3.13
LABEL maintainer="ydnek"

ENV PYTHONUNBUFFERED 1

COPY ./req.txt /tmp/red.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/req.txt && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH="py/bin:$PATH"

USER django-user
