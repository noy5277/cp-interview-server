module "eks_node_group" {
  source             = "./eks-node-group"
  for_each           = var.node_groups
  cluster_name       = var.cluster_name
  eks_version        = var.eks_version
  label              = each.value.label
  subnets_ids        = each.value.subnets_ids
  instance_types     = each.value.instance_types
  capacity_type      = each.value.capacity_type
  min_nodes          = each.value.min_nodes
  max_nodes          = each.value.max_nodes
  desired_nodes      = each.value.desired_nodes
  node_role_arn      = aws_iam_role.node_group.arn
  tags               = var.tags
  depends_on = [ 
    aws_eks_cluster.eks-cluster,
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}