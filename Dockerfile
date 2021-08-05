FROM centos:7

WORKDIR /root

RUN yum install -y openssh-server \
                   openssh-clients \
                   && yum clean all && rm -rf /var/cache/yum

RUN ssh-keygen -q -t rsa -f ~/.ssh/id_rsa -P '' \
    && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
    && ssh-keygen -q -t rsa -P '' -f /etc/ssh/ssh_host_rsa_key \
    && ssh-keygen -q -t rsa -P '' -f /etc/ssh/ssh_host_ecdsa_key \
    && ssh-keygen -q -t rsa -P '' -f /etc/ssh/ssh_host_ed25519_key

COPY ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config

CMD ["/usr/sbin/sshd", "-D"]
