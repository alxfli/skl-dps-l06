# Java Tomcat Maven Example

A sample Java HTTP service

## Building Docker

    docker build -t my-java-app .

## Running Docker

    docker run -d -p 8080:8080 my-java-app

The service listens on 127.0.0.1:8080

## Building Docker compose

    docker compose up -d --build

## Running Docker compose

    docker compose up -d

## Building Ansible

    cp ansible/inventory.ini.example ansible/inventory.ini

## Running Ansible

    ansible-galaxy collection install ansible.utils --upgrade

    ansible-playbook -i ansible/inventory.ini ansible/deploy.yml

## Running Ansible Roles

    ansible-playbook -i ansible/inventory.ini ansible/roles.yml

## Verification

    curl -i http://localhost:8080/