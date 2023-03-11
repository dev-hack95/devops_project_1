# Devops_project_1

```mermaid
flowchart LR;
    A(SOURCE) -- Commit --> B(Github);
    B -- Webhook --> C(Jenkins-server);
    C ---> D(Ansible-Server);
    D ---> E(Docker Hub);
    D ---> F(Kubernetes Cluster);
```
