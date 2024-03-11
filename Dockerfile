FROM python:3.10 AS builder
COPY requirements.txt .
RUN pip install --user -r requirements.txt
FROM python:3.10-slim
WORKDIR /code
COPY --from=builder /root/.local /root/.local
COPY ./3Pr.py .
ENV PATH=/root/.local:$PATH
CMD [ "python", "-u", "./3Pr.py" ]
