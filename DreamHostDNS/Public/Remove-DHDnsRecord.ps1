function Remove-DHDnsRecord {
    [CmdletBinding(SupportsShouldProcess=$true,ConfirmImpact='High')]
    param(
        [string]$Key,
        [string]$Uri = 'https://api.dreamhost.com',
        [string]$Record,
        [string]$Type,
        [string]$Value
    )

    PROCESS {
        $FullUri = "$Uri/?key=$Key&cmd=dns-remove_record&record=$Record&type=$Type&value=$Value"

        if ($PSCmdlet.ShouldProcess($Record,"Removing DNS $Type record $Record with value $Value")) {
            Invoke-RestMethod -Uri "$FullUri"
        }
    }
}