FROM centos:7
COPY . /
RUN yum -y install epel-release && \
    yum -y update && \
    yum -y install unzip && \
    yum -y install python-pip && \
    yum -y install python-devel && \
    yum -y install git && \
    yum -y install gcc && \
    yum -y install openssl-devel && \
    pip install --upgrade pip && \
    git clone https://github.com/jonathanmyers/tf.git && \
    cd tf && \
    git checkout master && \
    git pull && \
    pip install -r requirements.txt && \
    cd .. && \
    unzip terraform_0.8.7_linux_amd64.zip && \
    mv terraform /usr/bin/ && \
    rm terraform_0.8.7_linux_amd64.zip && \
    yum clean all
