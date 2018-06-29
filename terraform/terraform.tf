terraform {
  backend "s3" {
    bucket = "hibicode"
    key    = "beerstore-infra"
    region = "sa-east-1"
  }
}
