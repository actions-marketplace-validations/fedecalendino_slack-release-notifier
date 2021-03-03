FROM python:3-slim AS build-env
ADD . /app
WORKDIR /app

RUN pip install --target=/app requests

FROM gcr.io/distroless/python3-debian10
COPY --from=build-env /app /app
WORKDIR /app
ENV PYTHONPATH /app
CMD ["/app/main.py"]