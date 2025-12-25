package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestInfratodoapp(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../Environments/dev",
	})

	// ✅ Always destroy, even if panic occurs
	defer func() {
		if r := recover(); r != nil {
			terraform.Destroy(t, terraformOptions)
			panic(r) // rethrow so test is marked failed
		}
		terraform.Destroy(t, terraformOptions)
	}()

	terraform.InitAndApply(t, terraformOptions)

	acrName := terraform.Output(t, terraformOptions, "acr_name")
	assert.Contains(t, acrName, "acrtodoappdev01")

	aksName := terraform.Output(t, terraformOptions, "aks_name")
	assert.NotEmpty(t, aksName)

	rgList := terraform.OutputList(t, terraformOptions, "rg_name")
	assert.Contains(t, rgList, "rg-todoapp-dev")
}
