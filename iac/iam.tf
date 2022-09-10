resource "aws_iam_role" "lambda" {
    name = "IGTILambdaRole"

    assume_role_policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "sts:AssumeRole",
                "Principal":{
                    "Service" : "lambda.amazonaws.com"
                },
                "Effect": "Allow",
                "Sid": "AssumeRole"
            }
        ]
    }
    EOF

    tags = {
        EDC : "BOOTCAMP"
    }
}

resource "aws_iam_policy" "lambda"{
    name        = "IGTIAWSLambdaBasicExecutionRolePolicy"
    path        = "/"
    description = "Provides write permissions to CloudWatch logs, S3 buckets and EMR steps"

    policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [{
			"Principal": { "AWS": "arn:aws:iam::179819489780:user/penalvaadm" },
			"Effect": "Allow",
			"Action": [
				"logs:CreateLogGroup",
				"logs:CreateLogStream",
				"logs:PutLogEvents"
			],
			"Resource": "*"
		},
		{
			"Principal": { "AWS": "arn:aws:iam::179819489780:user/penalvaadm" },
			"Effect": "Allow",
			"Action": [
				"s3:*"
			],
			"Resource": "*"
		},
		{
			"Principal": { "AWS": "arn:aws:iam::179819489780:user/penalvaadm" },
			"Effect": "Allow",
			"Action": [
				"elasticmapreduce:*"
			],
			"Resource": "*"
		},
		{
			"Principal": { "AWS": "arn:aws:iam::179819489780:user/penalvaadm" },
			"Effect": "Allow",
			"Action": ["iam:PassRole"],
			"Resource": [
				"arn:aws:iam::179819489780:role/EMR_DefaultRole",
				"arn:aws:iam::179819489780:role/EMR_EC2_DefaultRole"
			]
		}
	]
}
EOF    
}

resource "aws_iam_role_policy_attachment" "lambda_attach"{
    role = aws_iam_role.lambda.name
    policy_arn = aws_iam_policy.lambda.arn
}