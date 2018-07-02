# Terraform - Provider AWS

É usado para provisionar o ambiente na AWS.

## Instalação
A versão do Terraforma usada nesse projeto foi a v0.11.5. Consulte a documentação do Terraform para mais informações sobre a instalação [https://www.terraform.io/intro/getting-started/install.html](https://www.terraform.io/intro/getting-started/install.html).

**Atenção: cuidado ao executar o terraform, ele pode tanto criar quanto destruir seus recursos na AWS!**


## Configuração das credenciais
O primeiro passo é configurar as credencias AWS na sua máquina. Instale o AWS CLI e faça a configuração informando as credenciais.

```
$ aws configure
```

## Geração da chave para SSH
Para fazermos login nas máquinas via ssh, precisamos usar uma chave assimétrica que você já pode ter ou se quiser, gerar uma com o comando abaixo:

```
ssh-keygen -t rsa -b 4096 -o -a 100 -f keys/id_rsa
```

## Inicialização do Terraform
Agora o próximo passo é iniciar o Terraform com o comando abaixo:

```
$ terraform init
```

## Plano de execução
Então podemos pedir para ver o plano de execução do Terraform, ou seja, tudo o que ele irá fazer na AWS.

```
$ terraform plan -out plano-execucao
```

## Aplicar plano de execução
Finalmente execute o plano de execução na AWS:

```
$ terraform apply plano-execucao
```