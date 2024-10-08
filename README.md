# IAC con Terraform

Este repositorio contiene la infraestructura de AWS gestionada mediante Terraform. Los módulos incluidos permiten desplegar y configurar servicios como Amazon S3, CloudFront, API Gateway, Lambda, Cognito, RDS, ElastiCache, entre otros.

## Estructura del Proyecto

- **modules/**: Contiene módulos reutilizables para la infraestructura.
  - **s3_bucket/**: Configuración de buckets S3.
  - **cloudfront/**: Configuración de distribuciones de CloudFront.
  - **api_gateway_lambda/**: Configuración de API Gateway y funciones Lambda.
  - **cognito/**: Configuración de Cognito para la autenticación de usuarios.
  - **aurora/**: Configuración de RDS Aurora y RDS Proxy.
  - **elasticache/**: Configuración de ElastiCache para cacheo en memoria.
  - **eks/**: Configuración de Amazon EKS para orquestación de contenedores.
  - **nlb/**: Configuración de Network Load Balancer (NLB) para la distribución de tráfico.
  - **iam/**: Configuración de roles IAM.
  - **vpc/**: Configuración de la red VPC.
  - **security_group/**: Configuración de grupos de seguridad.
  - **secrets_manager/**: Configuración de AWS Secrets Manager para la gestión de secretos.

## Requisitos

- **Terraform** v1.0+
- **AWS CLI** configurado con credenciales válidas
- **ZIP** (para empaquetar el código de Lambda)

## Uso

1. Clonar el repositorio:

   ```sh
   git clone https://github.com/Afelipe1599/IAC.git
   cd IAC
   ```   
2. Inicializar Terraform:

    ```sh
   terraform init
   ```
    ```sh
   terraform plan
   ```
    ```sh
   terraform apply
   ```

## Módulos

### S3 Bucket
Configura y gestiona buckets S3 con versionado, cifrado, y políticas de acceso.

### CloudFront
Despliega distribuciones de CloudFront que distribuyen contenido desde S3.

### API Gateway y Lambda
Configura un API Gateway que invoca funciones Lambda para el backend de la aplicación.

### Cognito
Gestión de autenticación de usuarios mediante Amazon Cognito.

### Aurora
Despliega bases de datos Aurora junto con RDS Proxy para mejorar la seguridad y el rendimiento.

### ElastiCache
Configura clusters de ElastiCache para cacheo en memoria.

### EKS
Configura un clúster de Amazon EKS para la orquestación de contenedores con integración a Fargate.

### NLB
Configura un Network Load Balancer para distribuir el tráfico hacia el backend.

### IAM
Gestión de roles y políticas IAM necesarias para los diferentes servicios.

### VPC
Configuración de la Virtual Private Cloud (VPC), incluyendo subnets, tablas de rutas y gateways.

### Security Group
Configura los grupos de seguridad para controlar el tráfico de red.

### Secrets Manager
Configura AWS Secrets Manager para gestionar y proteger secretos como contraseñas y claves API.

Esta arquitectura corresponde al siguiente diagrama:

![](https://github.com/Afelipe1599/IAC/blob/main/PruebaPragma.drawio.png)
