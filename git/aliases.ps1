function Invoke-GitReleaseNotes { 
   $sinceCommit = "";
   if ($args) {
      $sinceCommit = "$args^..HEAD"
   }
   git --no-pager log --merges $sinceCommit `
       --pretty=format:"%as (%h) - %s" -i -E `
       --grep="^(Integrar desenvolvimento de|Merging|Merge|Mergear |Fechamento de versão|Rebase )" `
       --invert-grep 
   Write-Host ""
   Write-Host ""
   Write-Host "Usage example:" -ForegroundColor Blue   
   Write-Host "> release-notes > fileName.txt" -ForegroundColor Blue
   Write-Host "> release-notes xxx > fileName.txt" -ForegroundColor Blue
   Write-Host "(where xxx could be a hash from the first commit to consider)" -ForegroundColor Blue
   Write-Host ""
}
New-Alias -Name "release-notes" -Value Invoke-GitReleaseNotes -Force -Option AllScope

