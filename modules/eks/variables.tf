variable "vpc_id" {
  description = "ID of the VPC used for SG and Cluster, created externally to this module"
  type        = string
  nullable    = false
}

variable "account_name" {
  description = "The AWS account to deploy the resource in"
  type = string
}

variable "region" {
  description = "The AWS region to deploy the resources in"
  type        = string
}

variable "cluster_name" {
  description = "Full name of the cluster"
  type        = string
  nullable    = false
}

variable "cluster_subnets_ids" {
  description = "Private subnets for your worker nodes"
  type        = list(string)
  validation {
    condition     = length(var.cluster_subnets_ids) > 0
    error_message = "ERROR: You must specify at least one subnet."
  }
}

variable "kubernetes_resources_ip_cidr" {
  description = "The CIDR block to assign Kubernetes pod and service IP addresses from"
  type        = string
  default = "172.16.0.0/16"
}

variable "cluster_security_group_ids" {
  description = "A list of security group IDs to associate with the worker nodes"
  type        = list(string)
}

variable "node_groups" {
  description = "A list of maps, where each map represents a node group with its configuration. Each map should contain the following keys: name (string), instance_types (list of strings), capacity_type (string, either 'ON_DEMAND' or 'SPOT'), min_nodes (number), max_nodes (number), desired_nodes (number), and node_group_label (string)."
  type = map(object({
    instance_types     = list(string)
    security_group_ids = list(string)
    subnets_ids        = list(string)
    capacity_type      = string
    min_nodes          = number
    max_nodes          = number
    desired_nodes      = number
    label              = string
  }))
  default = {}
}

variable "fargate" {
  description = "A map of Fargate profiles, where each profile is represented by a map with its configuration. Each map should contain the following keys: eks_fargate_namespace (string) and subnets_ids (list of strings)."
  type = map(object({
    eks_fargate_namespace = string
    subnets_ids           = list(string)
    label                 = string
  }))
  default = {}
}

variable "eks_version" {
  description = "The version of the EKS cluster"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "A map of additional custom tags to use for the eks cluster resources"
}

variable "endpoint_private_access" {
  description = "Enable private access endpoint to cluster"
  type = string
}

variable "endpoint_public_access" {
  description = "Enable public access endpoint to cluster"
  type = string
}
