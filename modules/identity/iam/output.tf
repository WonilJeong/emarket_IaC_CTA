output "policy_arn_map" {
    description = "User defined policy arn map"
    value = { for k, v in aws_iam_policy.main : k => v.arn }
}

output "policy_name_map" {
    description = "Policy Real name map"
    value = { for k, v in  aws_iam_policy.main: k => v.name }
}

output "role_arn_map" {
    description = "IAM role arn map (role-name: ARN)"
    value = { for k, v in aws_iam_role.main : k => v.arn }
}

output "inst_profile_id_map" {
    description = "EC2 instance role profile"
    value = { for k, v in aws_iam_instance_profile.main: k => v.id }
}

output "user_pwd_map" {
    description = "return encrypted user password (auto generated by AWS)"
    value = { for k, v in aws_iam_user_login_profile.iam_login_users : k => v.encrypted_password }
}

output "user_secret_map" {
    description = "access key & encrypted secret for programmatic users"
    # [id = accesskey secretkey] format
    value = { for k, v in aws_iam_access_key.iam_programmatic_users : k => [v.id, v.encrypted_secret] }
}