FROM python:3.11-slim
# Set the working directory
WORKDIR /html
# Copy the current directory contents into the container at /html
COPY index.html .
#expose port 3000
EXPOSE 3000

CMD ["python3", "-m", "http.server", "3000"]