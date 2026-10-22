# Simple Attendance by Seat Id - Tomcat 9 on Java 11
FROM tomcat:9.0-jdk11-corretto

# Remove the default Tomcat web applications
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
           /usr/local/tomcat/webapps/docs \
           /usr/local/tomcat/webapps/examples \
           /usr/local/tomcat/webapps/host-manager \
           /usr/local/tomcat/webapps/manager

# The web application (context path /attendance)
COPY attendance.war /usr/local/tomcat/webapps/attendance.war

# Make the bare domain work too: it redirects to /attendance/
COPY root/index.html /usr/local/tomcat/webapps/ROOT/index.html

# Entry point that binds Tomcat to Render's PORT
COPY entrypoint.sh /usr/local/tomcat/bin/entrypoint.sh
RUN chmod +x /usr/local/tomcat/bin/entrypoint.sh

EXPOSE 8080
CMD ["/usr/local/tomcat/bin/entrypoint.sh"]
