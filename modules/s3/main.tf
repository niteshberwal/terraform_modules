module "iam_role_s3" {
source = "./module/"

bucket_name = "mybucket-c29df1test"
bucket_acl = "private"
bucket_tag_name = "mybucket-c29df1test_tag"

}

