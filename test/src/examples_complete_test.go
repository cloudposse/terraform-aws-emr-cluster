package test

import (
	"encoding/base64"
	"testing"
	"math/rand"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func randStr(len int) string {
	rand.Seed(time.Now().UnixNano())
	buff := make([]byte, len)
	rand.Read(buff)
	str := base64.StdEncoding.EncodeToString(buff)
	// Base 64 can be longer than len
	return str[:len]
}

// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/complete",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.us-east-2.tfvars"},
		Vars: map[string]interface{} {
			"name": "emr-test-"+randStr(10),
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	vpcCidr := terraform.Output(t, terraformOptions, "vpc_cidr")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "172.16.0.0/16", vpcCidr)

	// Run `terraform output` to get the value of an output variable
	privateSubnetCidrs := terraform.OutputList(t, terraformOptions, "private_subnet_cidrs")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, []string{"172.16.0.0/19"}, privateSubnetCidrs)

	// Run `terraform output` to get the value of an output variable
	publicSubnetCidrs := terraform.OutputList(t, terraformOptions, "public_subnet_cidrs")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, []string{"172.16.96.0/19"}, publicSubnetCidrs)

	// Run `terraform output` to get the value of an output variable
	s3LogStorageBucketId := terraform.Output(t, terraformOptions, "s3_log_storage_bucket_id")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "eg-test-emr-test-logs", s3LogStorageBucketId)

	// Run `terraform output` to get the value of an output variable
	awsKeyPairKeyName := terraform.Output(t, terraformOptions, "aws_key_pair_key_name")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "eg-test-emr-test-ssh-key", awsKeyPairKeyName)

	// Run `terraform output` to get the value of an output variable
	clusterName := terraform.Output(t, terraformOptions, "cluster_name")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "eg-test-emr-test", clusterName)
}
