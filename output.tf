output "follow" {
  value = "curl -s http://${aws_instance.gatling.private_ip}:19531/entries?follow"
}

output "report-server" {
  value = "http://gatling-reports.tmaws.io?simulation=${var.simulation_name}&env=${var.environment_tag}"
}

output "Additional_Help" {
  value = "https://contegixapp1.livenation.com/confluence/display/AWS/Gatling+in+AWS"
}
