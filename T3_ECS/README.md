# Especificação TP3: Deploy de Aplicação no AWS ECS ou EKS

## Objetivo
O objetivo deste trabalho é aplicar conhecimentos sobre deploy de aplicações em ambientes de nuvem utilizando os serviços da AWS. O grupo poderá escolher entre duas opções para realizar o deploy: **Amazon ECS (Elastic Container Service)** ou **Amazon EKS (Elastic Kubernetes Service)**.

---

## Descrição do Trabalho

### 1. Escolha da Plataforma
- **Amazon ECS**: Deploy utilizando clusters gerenciados para execução de containers baseados no Docker.
- **Amazon EKS**: Deploy utilizando clusters gerenciados de Kubernetes.

### 2. Requisitos do Deploy
- **Criação de imagens Docker** da aplicação e armazenamento no **Amazon Elastic Container Registry (ECR)**.
- **Configuração de ambientes de execução**:
  - **Para ECS**:
    - Definir uma **Task Definition**.
    - Criar um **Cluster ECS**.
    - Configurar um serviço para executar a aplicação.
  - **Para EKS**:
    - Configurar o **cluster EKS**.
    - Criar os **manifests YAML** para a aplicação, incluindo:
      - Deployments.
      - Services.
      - ConfigMap/Secrets (se aplicável).
- *(Plus)* Configurar balanceador de carga para expor a aplicação:
  - **ECS**: Configurar o **Application Load Balancer (ALB)**.
  - **EKS**: Usar o **Ingress Controller** ou **LoadBalancer Service**.

### 3. Configuração de Redes e Segurança
- Configurar uma **VPC** para isolar o ambiente.
- Definir **subnets públicas e privadas**.
- Configurar **security groups** e **IAM roles** para acesso adequado.

---

## Entregáveis
1. **Código e Configuração**
   - Código da aplicação e **Dockerfile**.
   - Configurações de deploy:
     - **ECS**: Task Definition e JSON de serviço.
     - **EKS**: Manifests YAML.

*Se precisar de materiais de apoio, solicite ao professor ou consulte a [documentação oficial da AWS](https://aws.amazon.com/documentation/).*
