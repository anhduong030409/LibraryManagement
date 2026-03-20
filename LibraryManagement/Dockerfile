# Sử dụng Tomcat 9 với JDK mới (Java 25 của bạn sẽ chạy ổn trên nền này)
FROM tomcat:9.0-jdk17-openjdk-slim

# Xóa ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file war của bạn vào và đổi tên thành ROOT.war 
# để khi truy cập không cần gõ tên project (ví dụ: abc.render.com thay vì abc.render.com/LibraryManagement)
COPY LibraryManagement.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
