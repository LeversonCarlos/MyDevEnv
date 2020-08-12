function Invoke-GitStatus { & git status -sb $args }
New-Alias -Name st -Value Invoke-GitStatus -Force -Option AllScope

function Invoke-GitLog { & git log --graph --oneline --max-count=20 $args }
New-Alias -Name log -Value Invoke-GitLog -Force -Option AllScope

function Invoke-GitDiff { & git diff --word-diff $args }
New-Alias -Name dif -Value Invoke-GitDiff -Force -Option AllScope

function Invoke-GitBranch { & git branch $args }
New-Alias -Name branch -Value Invoke-GitBranch -Force -Option AllScope

function Invoke-GitCheckout { & git checkout $args }
New-Alias -Name co -Value Invoke-GitCheckout -Force -Option AllScope

function Invoke-GitAdd { & git add --interactive $args }
New-Alias -Name add -Value Invoke-GitAdd -Force -Option AllScope

function Invoke-GitCommit { & git commit -m "$args" }
New-Alias -Name ci -Value Invoke-GitCommit -Force -Option AllScope

function Invoke-GitPull { & git pull $args }
New-Alias -Name pull -Value Invoke-GitPull -Force -Option AllScope

function Invoke-GitFeature { 
   $currentBranch = $(git rev-parse --abbrev-ref HEAD)
   $newBranch = "$currentBranch.$args"
   git checkout -b $newBranch $currentBranch
}
New-Alias -Name feature -Value Invoke-GitFeature -Force -Option AllScope

function Invoke-GitPush { 
   $currentBranch = $(git rev-parse --abbrev-ref HEAD)
   git push origin $currentBranch
}
New-Alias -Name push -Value Invoke-GitPush -Force -Option AllScope

# Add-Alias rs 'git reset'
# Add-Alias rb 'git rebase'
# Add-Alias fixup 'git fixup'
# Add-Alias tag 'git tag'
# Add-Alias up 'git up'
# Add-Alias sync 'git sync'