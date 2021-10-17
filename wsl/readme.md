# Linux no Windows

- [Ativação](#ativação)
- [WSL2](#wsl2)
- [Instalar Kernel](#instalar-kernel)
- [Zsh](#zsh)
- [Oh-My-Zsh](#oh-my-zsh)
- [Diretório Inicial](#diretório-inicial)
- [Mensagem de apresentação](#mensagem-de-apresentação)
- [DotNet](#dotnet)
- [Node](#node)
- [Git](#git)

## Ativação
Para ativar o subsistema linux para windows, basta seguir o [tutorial oficial](https://docs.microsoft.com/pt-br/windows/wsl/install-win10), mas basicamente iremos:
- Usando o menu iniciar, pesquisar por `ativar ou desativar recursos do windows`
- Marcar as opções `plataforma de máquina virtual` e `subsistema do windows para linux`

## WSL2
- Atualizar o _wsl1_ para _wsl2_ com [esse pacote](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi), ou consultar o [tutorial](https://docs.microsoft.com/pt-br/windows/wsl/install-win10#step-4---download-the-linux-kernel-update-package) para outras opções.
- Definir a versão padrão do wsl para o wsl2 com o seguinte comando: 
  ```ps1
  wsl --set-default-version 2
  ```
- Será possível conferir a versão corrente com o seguinte comando:
  ```ps1
  Get-ItemPropertyValue `
     -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss `
     -Name DefaultVersion
  ``` 

## Instalar Kernel
- Instalar [uma das distribuição linux](https://aka.ms/wslstore) através da loja. 
- Utilizando o menu iniciar, executar uma primeira vez a distribuição instalada para concluir o processo
  - Será criado usuário com senha
  - Será criado perfil no windows terminal
_Os próximos passos levarão em conta o uso da distribuição ubuntu_

## Zsh
- Abrir sua sessão do ubuntu pelo windows terminal
- Atualizar lista de pacotes e instalar o shell zsh com os comandos:
  ```bash
  sudo apt update
  sudo apt install zsh
  ```
- Definir o zsh como o shell padrão com:
  ```bash
  chsh -s $(which zsh)
  ```  
- Fechar a sessão e reabrir, selecionando a opção `2` para popular os arquivos de configuração com valores padrão

## Oh My Zsh
- Instalar o plugin com o comando:
  ```bash
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```
- Defir o [tema desejado](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes) editando o arquivo de configurações do zsh com:
  ```bash
  nano ~/.zshrc
  ```  
- Substituir `ZSH_THEME="robbyrussell"` por (por exemplo) `ZSH_THEME="agnoster"`
- Para não apresentar o segmento usuario@hostName no prompt, defina o usuário corrente como _usuário padrão_ acrescentando a seguinte linha ao final do arquivo:
  ```bash
  DEFAULT_USER=$USER
  ```
- Sair gravando as mudanças com `ctrl`+`x`

## Diretório Inicial
- Mover para a pasta raiz com:
  ```bash
  cd /
  ```
- Criar diretório `sources` (ou o que preferir) com:
  ```bash
  sudo mkdir sources
  ```  
- Modificar o proprietário do diretório `sources` para seu usuário (_lcjohnny_ no meu caso) com:
  ```bash
  sudo chown lcjohnny /sources
  ```  
- Editar o arquivo de configurações do zsh com:
  ```bash
  nano ~/.zshrc
  ```  
- Mover até o final do arquivo e acrescentar a linha:  
  ```bash
  cd /sources
  ```  
- Sair gravando as mudanças com `ctrl`+`x`

## Mensagem de apresentação
- Editar o arquivo de configurações do zsh com:
  ```bash
  nano ~/.zshrc
  ```  
- Mover até o final do arquivo e acrescentar as seguintes linhas (ou algo mais pertinente):  
  ```bash
  cat /etc/os-release | grep PRETTY_NAME | cut -d "=" -f2
  echo 'Profile:'
  echo ' => nano ~/.zshrc'
  echo ''
  ```  
- Sair gravando as mudanças com `ctrl`+`x`

## DotNet
O [dotnet](https://dotnet.microsoft.com) é multi-plataforma. A forma mais fácil de instalá-lo e manter atualizado no ubuntu é através de seu repositório conforme descrito no [tutorial oficial](https://docs.microsoft.com/pt-br/dotnet/core/install/linux-ubuntu).
- Fazer o download e instalar o repositório do Ububtu 20.04 com os seguintes comandos:
  ```bash
  wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
  sudo dpkg -i packages-microsoft-prod.deb
  rm packages-microsoft-prod.deb
  ```
- E então instalar os pacotes necessários via apt-get normalmente:
  ```bash
  sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-5.0
  ```

## Node
Vamos usar o [NVM](https://github.com/nvm-sh/nvm) (_Node Version Manager_) para instalar o node e o manter atualizado. Segundo [documentação oficial](https://github.com/nvm-sh/nvm#installing-and-updating), basta:
- Instalar o nvm com o comando:
  ```bash
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh
  ```
- E solicitar instalação da versão lts do node com:
  ```bash
  nvm install --lts
  ```

## Git
O git já vem instalado na distribuição ubuntu, será preciso apenas:
- [Registrar o usuário](../git/readme.md#registro-de-usuário) 
- Direcionar o provedor de credenciais para que use o provedor instalado no windows, conforme descrito [aqui](../git/readme.md#wsl)
### GitBranch sem Paginação
O comando `git branch` passou a exibir o resultado numa instancia do vi permitindo paginação.  
Para não ter esse comportamento e apresentar o resultado numa listagem como o `ls` faz, executar o comando:
```bash
git config --global pager.branch false
```