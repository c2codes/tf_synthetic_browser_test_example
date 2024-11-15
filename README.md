# tf_synthetic_browser_test_example

You can find the Splunk Synthetics terraform provider documentation here: https://registry.terraform.io/providers/splunk/synthetics/latest/docs

Follow these steps to run this script and create an example browser test via Terraform:

1. Create your "terraform.tfvars" file from the template file: terraform.tfvars.template

        cp terraform.tfvars.template terraform.tfvars

2. Set your auth token and org id in the terraform.tfvars file

    > Replace "\<API_KEY>" with your API token from Splunk Observability Cloud. Replace "\<REALM>" (you can obtain this from the URL or by selecting My Profile -> Organizations -> Realm in the UI. Example: "us1")

        api_key = <API_KEY>
        realm = <REALM>

3. Run 
        terraform init

4. Run 
        terraform plan

5. Run 
        terraform apply

-------

Import documentation here: [Terraform docs](https://developer.hashicorp.com/terraform/cli/import/usage)

To import existing script from Splunk Observability Cloud

1. define empty resource in a .tf file

        resource "synthetics_create_browser_check_v2" "example_name" {}

2. obtain sytnthetic test ID from the URL in Splunk Observability Cloud

    > https://app.us1.signalfx.com/#/synthetics/tests/view/browser/<synthetic_test_id>/availability

3. import existing script by running the following command from the command line:

        terraform import synthetics_create_browser_check_v2.example_name "<synthetic_test_id>"

4. (Optional) List objects in current state

        terraform state list

5. Show the imported synthetic test object:

        terraform state show synthetics_create_browser_check_v2.example_name

6. Overwrite the empty resource definition that you created in step 1 with the output from the command above

7. Clean up - Remove "id" fields and other unnecessary fields

    > If you don't remove fields like "id", you will get an error similar to this:

    > Error: Invalid or unknown key (id)