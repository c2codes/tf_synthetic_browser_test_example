# tf_synthetic_browser_test_example

1. Create your "terraform.tfvars" file from the template file: terraform.tfvars.template

cp terraform.tfvars.template terraform.tfvars

2. Set your auth token and org id in the terraform.tfvars file

Replace "<API_KEY>" with your API token from Splunk Observability Cloud.

api_key = <API_KEY>

3. Run terraform init

4. terraform plan

5. terraform apply

-------

To import existing script from Splunk Observability Cloud

1. define empty resource in a .tf file

ex:
resource "synthetics_create_browser_check_v2" "test" {}

2. obtain sytnthetic test ID from the URL in Splunk Observability Cloud

Example:
https://app.us1.signalfx.com/#/synthetics/tests/view/browser/<synthetic_test_id>/availability

3. import existing script by running the following command from the command line:

terraform import synthetics_create_browser_check_v2.test "<synthetic_test_id>"

4. (Optional) List objects in current state

terraform state list

5. Show the imported synthetic test object:

terraform state show synthetics_create_browser_check_v2.test

6. Overwrite the empty resource definition that you created in step 1 with the output from the command above

7. Clean up - Remove "id" fields and other unnecessary fields

If you don't remove fields like "id", you will get an error similar to this:

Error: Invalid or unknown key (id)