# Gitops with Flux

- Exploring Kubernetes environment with Gitops using Flux. [https://github.com/mvitor/lab-flux-k8s](https://github.com/mvitor/lab-flux-k8s)
    
    - AKS using Fargate deployment using Terraform as IaaC. 
    - Deployment of Kafka environment with Consumer/Producer using Strimzi CRD, Graphana and Prometheus Helm charts for Installation. Automation steps are executed with Ansible. 
    - CI CD created in Jenkins using Terraform plugin.
    
    ```

+------------+      +---------------+     +--------------+
| Jenkins    | +--> |  Terraform    +---> |   AWS AKS    |
|            |      |               |     |              |
+------------+      +-----+---------+     +--------------+
                                                 ^
                                                 |
                                           +-----+------+        +-----------+
                                           |    flux    | ---->+ | git repo  |
                                           |            |        |           |
                                           +------------+        +-----------+

```
