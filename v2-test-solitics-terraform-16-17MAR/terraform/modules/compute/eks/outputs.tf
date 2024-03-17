output "cluster_name" {
  value = aws_eks_cluster.cluster.name
  description = "The name of the EKS cluster."
}

output "node_group_name" {
  value = aws_eks_node_group.node_group.node_group_name
  description = "The name of the EKS node group."
}
