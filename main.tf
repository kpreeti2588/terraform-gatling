#
# Passing Terraform variables onto the cloud-config.yaml file
#
data "template_file" "userdata" {
  template = "${file("${path.module}/${var.config}")}"

  vars {
    class              = "${var.inventory_code_tag}"
    environment_tag    = "${var.environment_tag}"
    inventory_code_tag = "${var.inventory_code_tag}"
    region             = "${var.aws_region}"
    cadvisor_url       = "${var.cadvisor_url}"
    cadvisor_port      = "${var.cadvisor_port}"
    gatling_scenario_repo = "${var.gatling_scenario_repo}"
    gatling_scenario_location = "${var.gatling_scenario_location}"
    gatling_scenario_branch = "${var.gatling_scenario_branch}"
    gatling_scenario_git_commit = "${var.git_commit}"
    simulation_name    = "${var.simulation_name}"
    report_bucket      = "${var.s3_report_bucket}"
    max_runtime        = "${var.max_runtime}"
    gatling_version    = "${var.gatling_version}"
    run_description    = "Instance Type - ${var.instance_type}: Simulation Name - ${var.simulation_name}: Gatling Version ${var.gatling_version} - ${var.run_description}"
    awscli_version     = "${var.awscli_version}"
    gatling_java_opts  = "${var.gatling_java_opts}"
    network           = "${var.network}"
    report_date        = "${timestamp()}"
    client_name        = "${var.client_name}"
  }
}

resource "aws_instance" "gatling" {
    ami = "${module.ami.ami_id}"
    instance_type = "${var.instance_type}"
    iam_instance_profile = "${aws_iam_instance_profile.default.name}"
    security_groups = ["${module.networks.security_groups[format("%s.%s.%s", var.aws_region, var.vpc, var.tier)]}", "${module.networks.security_groups[format("%s.%s.%s", var.aws_region, var.vpc, "onprem")]}"]
    subnet_id  = "${element(split(",", module.networks.subnet_azs[format("%s.%s.%s", var.availability_zone, var.vpc, var.tier)]), count.index)}"
    key_name = "${var.ssh_key}"
    user_data = "${data.template_file.userdata.rendered}"
    tags {
        Name = "${module.naming.value}"
        ProductCode = "${var.product_code_tag}"
        Environment = "${var.environment_tag}"
        InventoryCode = "${var.inventory_code_tag}"
    }
    count = "${var.gatling_instances}"
}
