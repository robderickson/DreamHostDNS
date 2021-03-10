function Get-DHDnsRecord {
    [CmdletBinding()]
    param(
        [string]$Key,
        [string]$Uri = 'https://api.dreamhost.com',
        [string]$Record,
        [string]$Zone
    )

    PROCESS {
        $Content = Invoke-RestMethod -Uri "$URI/?key=$Key&cmd=dns-list_records&format=json" | Select-Object -ExpandProperty Data
        #$ConvertedContent = ($content -replace "success`n",'').split("`n") | ConvertFrom-Csv -Delimiter `t

        if ($Zone) {
            $Content = $Content | Where-Object {$_.zone -eq $Zone}
        }

        if ($Record) {
            $Content = $Content | Where-Object {$_.record -eq $Record}
        }

        $Content
    }
}