# Oh-My-Posh

- [Apresentação](#apresentação)
- [Instalação](#instalação)
- [Temas](#temas)
- [Temas Customizados](#temas-customizados)

## Apresentação
O [Oh-My-Posh](https://ohmyposh.dev) é um engine de temas para o prompt, criado sob inspiração do [Oh-My-Zsh](https://ohmyz.sh).  

## Instalação 
- Instalaremos o módulo com o comando:
  ```ps1
  Install-Module oh-my-posh -Scope CurrentUser
  ``` 
- E vamos ativá-lo, editando o perfil com: `code $PROFILE` e adicionando a seguinte linha:
  ```ps1
  Import-Module oh-my-posh -DisableNameChecking
  ```

## Temas 
Uma série de [temas](https://github.com/JanDeDobbeleer/oh-my-posh/tree/main/themes) serão disponibilizados e podem ser consultados com o comando:  
```ps1
Get-PoshThemes
```
Para ativar o tema desejado (_agnoster_, no exemplo), edite o perfil com: `code $PROFILE` e adicione a seguinte linha:
```ps1
Set-PoshPrompt -Theme agnoster
```

## Temas customizados
Adicionalmente, poderíamos seguir a [documentação](https://ohmyposh.dev/docs/configure) e escrever um tema personalizado. Eu tomei o tema paradox como exemplo, fiz pequenos ajustes e disponibilizei [aqui](./themes/custom-paradox.omp.json).  
Para ativá-lo devemos mencionar o caminho completo, por exemplo:
```ps1
Set-PoshPrompt -Theme Set-PoshPrompt -Theme c:\MyWindowsTerminal\themes\custom-paradox.omp.json
```
