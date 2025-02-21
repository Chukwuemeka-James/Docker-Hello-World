# Use a lightweight Python image
FROM python:3.10-slim  

# Set working directory inside the container  
WORKDIR /usr/src/app  

# Copy application files  
COPY . .  

# Install dependencies  
RUN pip install --no-cache-dir -r requirements.txt  

# Expose port 5000  
EXPOSE 5000  

# Run the application  
CMD ["python", "hello_world.py"]
