terraform {
	required_providers {
        	aws = {
			source = "hashicorp/aws"
			version = "~> 3.0"
		 }
	 }
}
provider "aws" {
	access_key = "AKIAZJLI7HSFABQOIKZA"
	secret_key = "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"
	region = "ap-south-1"
}
