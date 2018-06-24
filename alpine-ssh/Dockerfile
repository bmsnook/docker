FROM alpine:latest
# Update Alpine Package Keeper so we can actually install packages
RUN apk update
# Install openssh so we can actually connect
RUN apk add openssh
# Generate SSH host keys
RUN ssh-keygen -A

## Zsh (zsh) - Nicer tab completion than bash, otherwise compatible
RUN apk add zsh
# Install the shadow utility to get "chsh"
RUN apk add shadow

## BEGIN CONFIGURE USER(s)
## CONFIGURE USER 1
# Use -D argument to tell adduser not to set a password; do it later
RUN adduser -g "Student User" -D student
RUN mkdir /home/student/.ssh && chmod 700 /home/student/.ssh
ADD authorized_keys /home/student/.ssh/authorized_keys
ADD .bashrc /home/student/.bashrc
ADD .zshrc /home/student/.zshrc
RUN chown -R student.student /home/student/.ssh
RUN echo "student:CHANGEME"  | chpasswd
## 
RUN chsh -s /bin/zsh student
## END CONFIGURE USER(s)

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
