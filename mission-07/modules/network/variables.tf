variable "allowed_ports" {
  type = map(list(string))
  description = "Firewall ports to allow, keyed by protocol."
}

variable "name_prefix" {
  type = string
  description = "Prefix for all resource names."
}

variable "region" {
  type = string
  description = "Region for the subnets."
}

variable "subnets" {
  type = map(object({
    cidr = string
    region = string
  }))
  description = "Subnets to create, keyed by name."
}