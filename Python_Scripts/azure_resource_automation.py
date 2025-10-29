# from azure.identity import DefaultAzureCredential
# from azure.mgmt.resource import ResourceManagementClient
# import subprocess


# cmd = 

# credentials  = DefaultAzureCredential()
# client  =  ResourceManagementClient(credentials, 'e8adc8a2-d308-4d54-a68d-45a79457a55f')

# for rg in client.resource_groups.list():
#     print(f"Resource Group: {rg.name}, Location: {rg.location}")


import subprocess
import json
from azure.identity import AzureCliCredential
from azure.mgmt.resource import ResourceManagementClient

# ✅ Full path to Azure CLI (adjust if your install path differs)
az_path = r"C:\Program Files\Microsoft SDKs\Azure\CLI2\wbin\az.cmd"
SUBSCRIPTION_ID = "e8adc8a2-d308-4d54-a68d-45a79457a55f"

print("🔹 Checking Azure login status...")

try:
    # Check if user is already logged in
    result = subprocess.run(
        [az_path, "account", "show"],
        capture_output=True,
        text=True
    )

    if result.returncode == 0:
        account_info = json.loads(result.stdout)
        print(f"✅ Already logged in as: {account_info['user']['name']}\n")
    else:
        # If not logged in, use device code login
        print("⚠️ Not logged in. Starting device code login...\n")
        subprocess.run([az_path, "login", "--use-device-code"], check=True)
        print("✅ Azure login successful!\n")

except FileNotFoundError:
    print(f"❌ Azure CLI not found at: {az_path}")
    print("👉 Please verify your Azure CLI installation path.")
    exit(1)
except subprocess.CalledProcessError as e:
    print(f"❌ Login error: {e}")
    exit(1)

# ===============================
# 🔹 Use Azure SDK to List Resource Groups
# ===============================

print("📂 Listing all resource groups:\n")

try:
    credential = AzureCliCredential()

    client = ResourceManagementClient(credential, SUBSCRIPTION_ID)

    for rg in client.resource_groups.list():
        print(f"➡️ {rg.name}")

except Exception as e:
    print(f"❌ Error listing resource groups: {e}")
