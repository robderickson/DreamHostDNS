function Add-DHDnsRecord {
    [CmdletBinding(SupportsShouldProcess=$true,ConfirmImpact='High')]
    param(
        [string]$Key,
        [string]$Uri = 'https://api.dreamhost.com',
        [string]$Record,
        [string]$Type,
        [string]$Value,
        [string]$Comment
    )

    PROCESS {
        $FullUri = "$Uri/?key=$Key&cmd=dns-add_record&record=$Record&type=$Type&value=$Value"
        if ($Comment) {
            $FullUri = "$FullUri&comment=$Comment"
        }


        if ($PSCmdlet.ShouldProcess($Record,"Adding DNS $Type record $Record with value $Value")) {
            Invoke-RestMethod -Uri "$FullUri"
        }
    }
}