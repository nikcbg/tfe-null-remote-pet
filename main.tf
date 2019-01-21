variable "access_token" {}

data "terraform_remote_state" "pet" {
  backend = "atlas"

  config {
    name         = "filipd-test/tfe-random_pet"
    access_token = "${var.access_token}"
  }
}

resource "null_resource" "foo" {
  provisioner "local-exec" {
    command = "echo ${data.terraform_remote_state.pet.name}"
  }
}
