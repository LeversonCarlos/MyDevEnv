# Introdução
Apenas um local para eu me lembrar como reconfigurar meu windows terminal do jeito que gosto e preciso. 

- [Powershell](./powershell/readme.md)
- [Git](./git/readme.md)
- [Temas](./themes/readme.md)
- [Windows Terminal](./windows-terminal/readme.md)

# Linux no Windows

## Ativar o Linux
Para ativar o subsistema linux para windows, basta seguir o [tutorial oficial](https://docs.microsoft.com/pt-br/windows/wsl/install-win10), mas basicamente iremos:
- Usando o menu iniciar, pesquisar por `ativar ou desativar recursos do windows`
- Marcar as opções `plataforma de máquina virtual` e `subsistema do windows para linux`
- Após instalação desses recursos, atualizar o wsl1 para wsl2 com [esse pacote de atualização](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi), ou [consultar a 4a etapa](https://docs.microsoft.com/pt-br/windows/wsl/install-win10#step-4---download-the-linux-kernel-update-package) do tutorial para outras opções.
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
- Instalar [uma das distribuição linux](https://aka.ms/wslstore) através da loja. Os próximos passos levarão em conta o Ubuntu
- Utilizando o menu iniciar, executar a primeira vez a distribuição instalada para concluir o processo
  - Será criado usuário com senha
  - Será criado perfil no windows terminal

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

## Oh-My-Zsh
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
- Modificar o proprietário do diretório `sources` para seu usuário (lcjohnny no meu caso) com:
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
  echo 'Profile:'
  echo ' => nano ~/.zshrc'
  echo ''
  ```  
- Sair gravando as mudanças com `ctrl`+`x`
