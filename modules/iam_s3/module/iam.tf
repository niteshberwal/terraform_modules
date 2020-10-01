resource "aws_iam_role" "s3-mybucket-role" {
  name               = var.IAM_role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_instance_profile" "s3-mybucket-role-instanceprofile" {
  name = var.IAM_instance_profile_name
  role = aws_iam_role.s3-mybucket-role.name
}

resource "aws_iam_role_policy" "s3-mybucket-role-policy" {
  name = var.IAM_role_policy_name
  role = aws_iam_role.s3-mybucket-role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "s3:*"
            ],
            "Resource": [
              "arn:aws:s3:::mybucket-c29df1",
              "arn:aws:s3:::mybucket-c29df1/*"
            ]
        }
    ]
}
EOF

}

