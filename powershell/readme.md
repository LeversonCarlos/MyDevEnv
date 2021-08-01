# Powershell

- [Powershell Core](#powershell-core)
- [Profile](#profile)
- [Encoding](#encoding)
- [Mensagem de apresentação](#mensagem-de-apresentação)

## Powershell Core
O Windows 10 já possui o _Powershell 5.1_ instalado por padrão e isso (via de regra), seria suficiente.  Porém o powershell foi re-escrito como uma ferramenta opensource e multiplataforma, chamado agora de [Powershell Core](https://github.com/PowerShell/PowerShell).  
A forma mais fácil de instalá-lo é através da [Microsoft Store](https://www.microsoft.com/store/productId/9MZ1SNWT0N5D), com isso as atualizações serão aplicadas automaticamente. 


## Profile
Sempre que uma instância do powershell é iniciada o script do perfil é executado. Então ali é o local para se colocar as definições que queremos sempre ativas.  
O caminho completo para esse script pode ser obtido através da variável `$PROFILE`. Então, ao longo dos passos desse tutorial, vamos adicionar algum conteúdo a esse script.  

## Encoding
Vamos começar com a definição do encoding. Quando começar a executar commits e visualizar logs, possivelmente encontrará comentários utilizando acentuações. Para que o terminal os exiba corretamente, abra o script para edição com o comando `code $PROFILE` e adicione as seguintes linhas:
```ps1
$env:LC_ALL='C.UTF-8'
```

## Mensagem de apresentação
Novas instâncias do powershell são apresentadas com as boas vindas do powershell. Prefiro limpar a tela e apresentar algumas instruções que podem ser mais úteis como no exemplo abaixo. Para isso, editar o perfil com: `code $PROFILE`, e acrescentar as seguintes linhas:
```ps1
cd \Sources
Clear-Host
Write-Host 'PowerShell:'
Write-Host ' => '($PSVersionTable.PSVersion.Major,$PSVersionTable.PSVersion.Minor,$PSVersionTable.PSVersion.Patch -join ".")
Write-Host 'Profile:'
Write-Host ' => code $PROFILE'
Write-Host "Themes:"
Write-Host ' => Get-PoshThemes'
Write-Host ''
``` 
