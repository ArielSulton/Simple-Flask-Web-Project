# syntax=docker/dockerfile:1

# FROM python:3.10-alpine
FROM python:3.10-slim
WORKDIR /flask
# RUN apk add --no-cache gcc musl-dev linux-headers
RUN apt-get update && apt-get install -y \
    curl \
    gcc \
    libc-dev \
    linux-headers-generic \
    && rm -rf /var/lib/apt/lists/*
COPY requirement.txt requirement.txt
RUN pip install -r requirement.txt
RUN pwd
RUN ls -a
EXPOSE 5000
COPY . .
RUN ls -a
# RUN python -m flask --app board init-db
CMD ["python", "-m", "flask", "--app", "board", "run", "--host=0.0.0.0", "--debug"]