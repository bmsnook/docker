These are a few customizations of a class example Dockerfile for Alpine Linux.

## Goal:
* zsh  
* sshd installed cleanly  
* network utilities to play around with as I learn Docker networking  

Note that the authorized_keys file is just an empty stub file (even though they're public keys, I declined to post them at the moment and will update as I build).

Note that the account username and/or password should be updated as needed.

## Building:
`docker build -t alpine-ssh .`  
`docker run -d --name alpine-ssh -p 2522:22 alpine-ssh`  
