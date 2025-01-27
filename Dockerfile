FROM python:3.9-slim

COPY pythonfile.py /app/
COPY req.txt /app
WORKDIR /app
RUN pip install --no-cache-dir -r req.txt
CMD ["python", "pythonfile.py"]