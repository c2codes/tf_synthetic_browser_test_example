# synthetics_create_browser_check_v2.online_boutique:
resource "synthetics_create_browser_check_v2" "online_boutique" {

    test {
        active              = true
        device_id           = 34
        frequency           = 5
        location_ids        = [
            "aws-ca-central-1",
        ]
        name                = "Online Boutique Browser Test"
        scheduling_strategy = "round_robin"

        advanced_settings {
            collect_interactive_metrics = true
            verify_certificates         = true
        }

        transactions {
            name = "Online Boutique - Main Page"

            steps {

                name                 = "Go to Online Boutique"
                type                 = "go_to_url"
                url                  = "https://online-boutique-eu.splunko11y.com/"
            }
        }
        transactions {
            name = "Online Boutique - Select first product"

            steps {
                name                 = "Select first product"
                selector             = "//a[contains(@href, 'product')][1]"
                selector_type        = "xpath"
                type                 = "click_element"
            }
            steps {
                name                 = "New step"
                selector             = "//h2[contains(text(),'Vintage Typewriter')]"
                selector_type        = "xpath"
                type                 = "assert_element_visible"
            }
        }
        transactions {
            name = "W3schools - Main Page"

            steps {
                name                 = "Go to W3Schools"
                type                 = "run_javascript"
                value                = "window.open(\"https://www.w3schools.com\",\"_self\");"
            }
        }
    }
}