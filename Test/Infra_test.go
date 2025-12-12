package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestInfratodoapp(t *testing.T) {
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../Environments/dev",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
	
	acrName := terraform.Output(t, terraformOptions, "acr_name")
	assert.Contains(t, acrName, "acr")

	aksName := terraform.Output(t, terraformOptions, "aks_name")
	assert.NotEmpty(t, aksName)

	rg := terraform.Output(t, terraformOptions, "rg_name")
	assert.Equal(t, "rg-todoapp-dev", rg)
}	