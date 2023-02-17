# Aws deployment

**Exercice TP**

[TP1.pdf](Aws%20deployment%20d9aae1d5424241fc83a7130b35a3c89d/TP1.pdf)

<aside>
💡 Aws architecture VPC

</aside>

![aws architecture (2).jpg](Aws%20deployment%20d9aae1d5424241fc83a7130b35a3c89d/aws_architecture_(2).jpg)

---

## Installation for macOs:

**install aws cli**: `$ brew install awscli`

**install jenkins**: `$ brew install jenkins`

**install tfenv for install terraform**: `$ brew instal tfenv`

**config tfenv**: `$ TFENV_ARCH=amd64 tfenv install 0.15.5`

**install terraform**: `$ tfenv use 0.15.5`

---

## Aws:

**config for aws**: `$ aws configure`

### Clé aws:

```
Access key ID,Secret access key
AKIAX2AXCHDJBSPYZTIHTL2XUD,gCHZUv7vfrDCJSNDCpETBz7m+zeQxFom5+I4Dws/suz2RR3
```

**Config aws**:
`$ AKIAX2AXCHDJBSPYZTIHTL2XUD`

`$ gCHZUv7vfrDCJSNDCpETBz7m+zeQxFom5+I4Dws/suz2RR3`

`$ eu-west-1`

`$ json`

**Un ficher caché aws va être initié**:
`$ cd .aws`

Voir le contenu de config: `$ cat config`
Voir le contenu de credentials: `$ cat credentials`

Lister les s3: `$ aws s3 ls`

---

## Terraform:

Aller dans le projet git

`$ git checkout main`

`$ git pull`

`$ git fecth`

`$ git checkout "branch-of-work"`

`$ mkdir terraform`

`$ cd terraform`

`$ touch backend.tf`

`$ vim backend.tf`

**copy code:**

```json
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = "eu-west-1"
}
```

## VPC:

`$ touch vpc.tf`

`$ vim vpc.tf`

**copy code:**

```json
resource "aws_vpc" "cdap2-vpc" {
    cidr_block  = "172.198.0.0/24"
    tags = {
        Name    = "cdap2-vpc"
        Project = "infrastructure"
        Teams   = "bakary-elisee"
        Manage  = "terraform"
    }
}
```

`$ touch .gitignore`

**copy code:**

```json
.terraform
*.tfstate
*.tfstate.backup
terraform/.terraform.lock.hcl
```

`$ cd terraform`

`$ terraform init`

**Charger le fichier** `terraform.tfstate` **sur le s3 du bucket: nom-bucket**

init backend s3 on backend.ft**:**

```json
terraform {
	backend "s3" {
    bucket = "cdap-elisee-bakary"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = "eu-west-1"
}
```

`$ cd terraform`

`$ terraform init`

`$ terraform plan`

`$ terraform apply`

- `$ yes`

## Subnet

`$ cd terraform`

`$ touch subnet.tf`

**Création subnet privée et public:**

```json
# Subnet public
resource "aws_subnet" "subnet-cdap-public" {
  vpc_id     = aws_vpc.cdap2-vpc.id
  cidr_block = "172.198.0.16/28"

  tags = {
    Name    = "subnet-cdap-public"
    Project = "infrastructure"
    Teams   = "bakary-elisee"
    Manage  = "terraform"
  }
}

# Subnet private
resource "aws_subnet" "subnet-cdap-private" {
  vpc_id     = aws_vpc.cdap2-vpc.id
  cidr_block = "172.198.0.0/28"

  tags = {
    Name    = "subnet-cdap-private"
    Project = "infrastructure"
    Teams   = "bakary-elisee"
    Manage  = "terraform"
  }
}
```

`$ cd terraform`

`$ terraform init`

`$ terraform plan`

`$ terraform apply`

- `$ yes`