# Devops_project_1
==============================


## Authors

- [@dev-hack95](https://www.github.com/dev-hack95)

## Project Status
- Progress

## Table of Contents

  - [Problem Statement](#Problem-Statement)
  - [Flowchart](#Flowchart)
  - [Tech Stack](#tech-stack)
  - [Results](#Results)

## Flowchart

```mermaid
flowchart LR;
    A(SOURCE) -- Commit --> B(Github);
    B -- Webhook --> C(Jenkins-server);
    C ---> D(Ansible-Server);
    D ---> E(Docker Hub);
    D ---> F(Kubernetes Cluster);
```
