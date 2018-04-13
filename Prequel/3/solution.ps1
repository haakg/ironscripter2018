irm https://powershell.org/feed | % {
    $post = [PSCustomObject]@{
        Title = $_.title
        "Publication Date" = $_.pubDate
        Link = $_.link
        Author = ($_.creator.'#cdata-section') 
    }

    Add-Member -MemberType ScriptMethod -InputObject $post -Name "openInBrowser" -Value { start $this.link }
    Add-Member -MemberType ScriptMethod -InputObject $post -Name "openInConsole" -Value { wget $this.link }

    $post
}