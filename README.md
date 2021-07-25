# Powershell Settings
Apenas um local para eu me lembrar como reconfigurar meu powershell do jeito que gosto sempre que preciso. 


## Powershell Core
O Windows 10 já possui o Powershell 5.1 instalado por padrão e isso, via de regra, seria suficiente. Porém o powershell foi re-escrito como uma ferramenta opensource e multiplataforma, chamado agora de [Powershell Core](https://github.com/PowerShell/PowerShell). A forma mais fácil de instalá-lo é através da [Microsoft Store](https://www.microsoft.com/store/productId/9MZ1SNWT0N5D), com isso as atualizações serão aplicadas automaticamente. 


## Profile
Sempre que uma instância do powershell é iniciada o script do perfil é executado. Então ali é o local para se colocar as definições que queremos sempre ativas.  
O caminho completo para esse script pode ser obtido através da variável `$PROFILE`. Então, ao longo dos próximos passos vamos adicionar algum conteúdo a esse script.  
Vamos começar com a definição do encoding. Quando começar a executar commits e visualizar logs, possivelmente encontrará comentários utilizando acentuações. Para que o terminal os exiba corretamente, abra o script para edição com o comando `code $PROFILE` e adicione as seguintes linhas:
```ps1
$env:LC_ALL='C.UTF-8'
```


## Git
Fazer o download e executar o pacote de instalação através do [site oficial](https://git-scm.com). Logo após, registrar o usuário e email que será associado aos commits com os seguintes comandos:
```ps1 
git config --global user.name "Seu Nome"
git config --global user.email "seuEmail@seuProvedor.com"
```
### Git Credential Manager
A instalação do [visual studio](https://visualstudio.microsoft.com/pt-br) já fará a instalação do [Git Credential Manager](https://github.com/Microsoft/Git-Credential-Manager-for-Windows) que será responsável pela autenticação nos repositórios.  
O processo deverá acontecer automaticamente ao fazer o primeiro `git push`, solicitando autenticação através do navegador.


## Git Aliases
Esse módulo vai prover aliases para comandos Git baseados no pluging [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git).  
Rode o seguinte comando para instalar o módulo no powershell: 
```ps1
Install-Module -Name git-aliases
```
Para ativar o módulo, editar seu perfil com: `code $PROFILE` e adicionar a seguinte linha:
```ps1
Import-Module git-aliases -DisableNameChecking
```
Posteriormente, para atualizar o módulo quando houver atualizações, rode o comando:
```ps1
Update-Module git-aliases
```
### Aliases
Abaixo, alguns dos aliases que serão disponibilizados. A lista completa pode ser consultada no [repositório do plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git).
| Alias                | Command                                                                                                                          |
|:---------------------|:---------------------------------------------------------------------------------------------------------------------------------|
| g                    | git                                                                                                                              |
| ga                   | git add                                                                                                                          |
| gb                   | git branch                                                                                                                       |
| gbl                  | git blame -b -w                                                                                                                  |
| gc                   | git commit -v                                                                                                                    |
| gcmsg                | git commit -m                                                                                                                    |
| gco                  | git checkout                                                                                                                     |
| gcm                  | git checkout $(git_main_branch)                                                                                                                |
| gcd                  | git checkout develop                                                                                                             |
| gd                   | git diff                                                                                                                         |
| gdw                  | git diff --word-diff                                                                                                             |
| gf                   | git fetch                                                                                                                        |
| gfa                  | git fetch --all --prune                                                                                                          |
| gfo                  | git fetch origin                                                                                                                 |
| gl                   | git pull                                                                                                                         |
| ggl                  | git pull origin $(current_branch)                                                                                                |
| gp                   | git push                                                                                                                         |
| ggp                  | git push origin $(current_branch)                                                                                                |
| gpsup                | git push --set-upstream origin $(git_current_branch)                                                                             |
| glg                  | git log --stat                                                                                                                   |
| glo                  | git log --oneline --decorate                                                                                                     |
| glog                 | git log --oneline --decorate --graph                                                                                             |
| gloga                | git log --oneline --decorate --graph --all                                                                                       |
| gm                   | git merge                                                                                                                        |
| grb                  | git rebase                                                                                                                       |
| gss                  | git status -s                                                                                                                    |
| gst                  | git status                                                                                                                       |
| gts                  | git tag -s                                                                                                                       |


## Windows Terminal

<img src="./images/windows-terminal.gif" title="Windows Terminal" width="280" align="right" /> 

Primeiro vamos falar do Windows Terminal, que é uma especie de IDE agregadora de terminais. Com ele é possível abrir múltiplas abas de terminais distintos como o *Command Prompt* e o próprio *Powershell*, além dos ambientes linux com o *WSL*. Instale o Windows Terminal através desse [link](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n0dx20hk701?activetab=pivot:overviewtab) da Windows Store.  

### Background
Pra definir uma imagem, com transparência, como fundo da tela, abra as configurações do windows terminal com `ctrl`+`,` e adicione as seguintes tags ao perfil desejado: 
```json 
   "backgroundImage": "ms-appdata:///roaming/Matrix1920.gif",
   "backgroundImageOpacity": 0.15,
   "backgroundImageStretchMode": "uniformToFill",
```

A imagem a ser usada para o fundo precisa ser disponibilizada dentro do *sandbox* em que o windows terminal tem acesso e é descrita por esse prefixo `ms-appdata:///roaming/`.  
Copie a imagem disponibilizada [aqui](./backgrounds/Matrix1920.gif) (ou a sua imagem de preferência), para a seguinte pasta: `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\RoamingState`.   


## Nerd Fonts
Vamos precisar de uma fonte que tenha suporte a *glyphos* e *ligaduras*. O portal [NerdFonts](https://www.nerdfonts.com) possui uma boa biblioteca de fontes com diversas opções. Eu costumo alternar entre essas: 
- [FiraCode NF](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip)
- [MesloLGSDZ NF](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip)  
- [Cascadia Code PL](https://github.com/microsoft/cascadia-code)


Basta fazer o download, abrir o pacote, clicar com o botão direito e selecionar *instalar*.  

### Ativação

Abra as configurações do windows terminal com `ctrl`+`,` e adicione a seguinte tag ao perfil desejado (ou na sessão `defaults` para refletir a todos os perfis):
``` json
   "fontFace":  "Cascadia Code PL"
```

## Oh-My-Posh
Até aqui já seria possível usufruir das funcionalidades que o posh-git traz e até mesmo escrever o seu prório *tema* para o prompt de comando seguindo a documentação. Mas para facilitar um pouco mais, vamos instalar o módulo [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh) que, basicamente, disponibiliza deversos desses temas, já prontos para uso. 

### Instalação
Instalaremos o módulo com o comando:
``` powershell
Install-Module oh-my-posh -Scope CurrentUser
``` 

### Definir mensagem
Por fim, para sempre começar com uma tela limpa vamos editar o perfil com: `code $PROFILE`, e acrescentar as seguintes linhas:
``` powershell
Clear-Host
Write-Host "Olá... foco no código"
``` 

## Temas disponibilizados
Os temas disponíveis podem ser consultados [aqui](https://github.com/JanDeDobbeleer/oh-my-posh#themes).

#### Agnoster
![Agnoster Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/agnoster.png)

#### Paradox
![Paradox Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/paradox.png)

#### Sorin
![Sorin Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/sorin.png)

#### Darkblood
![Darkblood Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/darkblood.png)

#### Avit
![Avit Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/avit.png)

#### Honukai
![Honukai Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/honukai.png)

#### Fish
![Fish Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/fish.png)

#### Robbyrussell
![Robbyrussell Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/robbyrussel.png)

#### Pararussel
![Pararussel Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/pararussel.png)

#### Material
![Material Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/material.png)
![Material Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/material2.png)

#### Star
![Star Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/star.png)

#### Zash
![Star Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/zash.png)

#### Lambda
![Lambda Theme](https://github.com/JanDeDobbeleer/oh-my-posh/raw/master/img/lambda.png)


## Tema Customizado
Os temas disponibilizados pelo módulo *oh-my-posh* nada mais são que um arquivo de script com instruções e comandos disponibilizados pelo módulo *posh-git*. Partindo como exemplo do tema [Honukai](https://github.com/JanDeDobbeleer/oh-my-posh/blob/master/Themes/Honukai.psm1) e seguindo a [documentação](https://github.com/dahlbyk/posh-git#git-status-summary-information), fiz algumas adequações para compor um tema que mais me agradasse e o estou disponibilizando [aqui](./themes/Elesse.psm1).  

### Ativação
Para ativar esse tema, editar o perfil com: `code $PROFILE` e mencionar o caminho completo onde o gravou, como:
``` powershell
Set-Theme C:\Sources\Personal\powershell-settings\themes\Elesse.psm1
```
Opcionalmente, seria possível disponibilizar esse tema na pasta de temas do *oh-my-posh* que normalmente se encontra em: `C:\Users\{seu nome de usuario}\Documents\PowerShell\Modules\oh-my-posh`


## Aliases para Comandos Git baseados nos aliases do plugin para zsh
No lugar de escrever e disponibilizar os aliases da forma descrita acima, uma alternativa seria utilizar os aliases já padronizados pelo pluging do [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh). 
Para isso vamos instalar o módulo [powershell-git-aliases](https://github.com/gluons/powershell-git-aliases) com o seguinte comando:
   ``` powershell
   Install-Module git-aliases -Scope CurrentUser -AllowClobber
   ```
E vamos ativá-lo editando o perfil com: `code $PROFILE` e adicionando a seguinte linha:
   ``` powershell
   Import-Module git-aliases -DisableNameChecking
   ```

## Conclusão
Seu terminal não precisa ser boring.
