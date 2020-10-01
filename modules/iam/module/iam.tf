# group definition
resource "aws_iam_group" "terraform_demo_test" {
  name = var.IAM_group_name
}

resource "aws_iam_policy_attachment" "terraform_demo_1_policy_attach" {
  name       = "administrators-attach"
  groups     = [aws_iam_group.terraform_demo_test.name]
  policy_arn = var.policy_arn
}

# user
resource "aws_iam_user" "terraform_demo_user_test" {
  count = "${length(var.IAM_users)}"
  name = var.IAM_users[count.index]
  
  tags = {
  name = "terraform_demo_user_test${count.index}"
}
}


resource "aws_iam_group_membership" "terraform_demo_users_group" {
  count = "${length(var.IAM_users)}"

  name = "terraform_demo_users_group"
  users = ["${var.IAM_users[count.index]}"]
  group = aws_iam_group.terraform_demo_test.name
}

output "warning" {
  value = "WARNING: make sure you're not using the AdministratorAccess policy for other users/groups/roles. If this is the case, don't run terraform destroy, but manually unlink the created resources"
}

