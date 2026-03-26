# Use Amazon Linux (since your script uses yum)
FROM amazonlinux:2

# Install required packages
RUN yum update -y && \
    yum install -y httpd wget unzip && \
    yum clean all

# Download and extract your app
WORKDIR /tmp
RUN wget https://skproject1234.s3.ap-south-1.amazonaws.com/My2048.zip && \
    unzip My2048.zip && \
    cp -r My2048-master/* /var/www/html/

# Expose port 80
EXPOSE 80

# Start Apache in foreground (IMPORTANT for Docker)
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
