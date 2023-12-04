FROM apache/airflow:2.7.3-python3.9

USER root
RUN apt-get update && apt-get install -y curl apt-transport-https
RUN curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg
RUN curl https://packages.microsoft.com/config/debian/12/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql18

USER airflow
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt