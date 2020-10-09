module "iam_module" {
  source = "./module/"
  
  IAM_group_name = "terraform_demo_test_group"
  IAM_users = ["terraform_demo_user_1", "terraform_demo_user_2", "terraform_demo_user_3"]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"

}
