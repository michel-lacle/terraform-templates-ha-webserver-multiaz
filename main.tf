module "ha-multi-instance" {
  source = "./ha_webserver"

  ami_id = ""
  availability_zones = ["us-east-1a", "us-east-1b"]
  project = "terraform-templates-ha-webserver-multiaz"
  user_data_1 = "webserver_install_1.sh"
  user_data_2 = "webserver_install_2.sh"
}