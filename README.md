# DreamHostDNS
PowerShell module wrapping DreamHost DNS API commands using Invoke-RestMethod.

DreamHost API Overview: https://help.dreamhost.com/hc/en-us/articles/217560167-API_overview
DreamHost API DNS Commands: https://help.dreamhost.com/hc/en-us/articles/217555707-DNS-API-commands

## DreamHost DNS API Limitations
### DNS Zone Creation
It appears a DNS Zone is not created when you add DNS hosting for a domain. You have to add a record to the zone manually before you can use the DNS API's `dns-add_record` command.

### Rate Limits
As of 2021-03-10, `dns-add_record` command is rate limited to 10 successful calls every 5 minutes and 50 successful calls every hour. There is probably a similar limit for `dns-remove_record`. I did not hit any rate limits for `dns-list_records`.

### MX records
The DreamHost DNS API does not currently support creating MX records.