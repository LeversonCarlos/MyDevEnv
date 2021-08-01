# GIT

- [Instalação](#instalação)
- [Registro de Usuário](#registro-de-usuário)
- [Credential Manager](#credential-manager)
  - [Azure DevOps Artifacts](#azure-devops-artifacts)
- [Aliases](#aliases)
  - [Lista de Aliases](#lista-de-aliases)
  - [Aliases Auxiliares](#aliases-auxiliares)

## Instalação
Fazer o download e executar o pacote de instalação através do [site oficial](https://git-scm.com).  

## Registro de usuário
Registrar o usuário e email que será associado aos commits com os seguintes comandos:
```ps1 
git config --global user.name "Seu Nome"
git config --global user.email "seuEmail@seuProvedor.com"
```

## Credential Manager
A instalação do [visual studio](https://visualstudio.microsoft.com/pt-br) já fará a instalação do [Git Credential Manager](https://github.com/Microsoft/Git-Credential-Manager-for-Windows) que será responsável pela autenticação nos repositórios.  
A solicitação de autenticação através do navegador ocorrerá automaticamente ao fazer o primeiro `git push`.


### Azure DevOps Artifacts
Para projetos que utilizam referência de bibliotecas hospedadas no Azure DevOps, precisamos do [provider de credenciais do Azure Artifacts](https://github.com/Microsoft/artifacts-credprovider).
- Instale o provider com o comando:
  ```ps1
  iex "& { $(irm https://aka.ms/install-artifacts-credprovider.ps1) } -AddNetfx"
  ```
- Faça o primeiro _restore_ de forma interativa através do navegador com o comando:
  ```ps1
  dotnet restore --interactive 
  ```


## Aliases
O módulo de powershell [GitAliases](https://github.com/gluons/powershell-git-aliases) vai prover aliases para comandos git baseados no pluging [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git).  
- Instale o módulo com o comando: 
  ```ps1
  Install-Module -Name git-aliases
  ```
- Ative o módulo, editando seu perfil com: `code $PROFILE` e adicionando a seguinte linha:
  ```ps1
  Import-Module git-aliases -DisableNameChecking
  ```
- Posteriormente, para atualizar o módulo quando houver atualizações, rode o comando:
  ```ps1
  Update-Module git-aliases
  ```

### Lista de aliases
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

### Aliases auxiliares
Adicionalmente podemos escrever funções complexas e disponibilizar aliases para tal.  
No [arquivo auxiliar](./aliases.ps1) disponibilizo exemplo de um aliaes para compor um _release-notes_ baseado na descrição dos commits.  
Para ativar aliases em arquivos externos como esse, editar seu perfil com: `code $PROFILE` e adicionar linha como essa:
```ps1
."c:\Sources\Personal\MyWindowsTerminal\git\aliases.ps1"
```
Seguindo essa mesma premissa, podemos criar funções de aliases para qualquer tarefa comum, diretamente em seu arquivo de perfil (_$PROFILE_). Exemplo esse aliases para mudança de pasta:
```ps1
function Invoke-CdWarehouse {
   cd \sources\OransysWarehouse\suite
}
New-Alias -Name "cdw" -Value Invoke-CdWarehouse -Force -Option AllScope
```