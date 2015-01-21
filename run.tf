module "ap-northeast-1" {
  source = "./modules"
  region = "ap-northeast-1"
  aws_keypair = "oreorekey-ap-northeast-1"
  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
}

module "us-east-1" {
  source = "./modules"
  region = "us-east-1"
  aws_keypair = "oreorekey-us-east-1"
  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
}

