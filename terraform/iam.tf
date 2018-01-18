resource "aws_iam_role_policy" "prometheus_config_reader_policy" {
  name = "prometheus_config_reader_policy"
  role = "${aws_iam_role.prometheus_config_reader.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "prometheus_config_reader" {
  name = "prometheus_config_reader"

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

resource "aws_iam_instance_profile" "prometheus_config_reader_profile" {
  name  = "prometheus_config_reader_profile"
  role = "${aws_iam_role.prometheus_config_reader.name}"
}