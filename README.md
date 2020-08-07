# Meu Powershell


## Windows Terminal
Primeiro vamos falar do Windows Terminal, que é uma especie de IDE agregadora de terminais. Com ele é possível abrir múltiplas abas de terminais distintos como o *Command Prompt* e o próprio *Powershell*, além dos ambientes linux com o *WSL*. Instale o Windows Terminal através desse [link](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n0dx20hk701?activetab=pivot:overviewtab) da Windows Store.  

### Background
Abra as settings do windows terminal com `ctrl`+`,`. Adicione as seguintes tags ao perfil desejado:
```json 
   "backgroundImage": "ms-appdata:///roaming/Matrix1920.gif",
   "backgroundImageOpacity": 0.15,
   "backgroundImageStretchMode": "uniformToFill",
```
A imagem a ser usada para o background precisa ser disponibilizada dentro do sandbox em que o windows terminal tem acesso e é descrita por esse prefixo `ms-appdata:///roaming/`.  
Copie a imagem disponibiliza [nesse repositório](./images/Matrix1920.gif), ou a sua imagem de preferência, para a seguinte pasta: `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\RoamingState`.   


## Powershell Core
O Windows 10 já possui o Powershell 5.1 [instalado por padrão](https://docs.microsoft.com/pt-br/powershell/scripting/windows-powershell/install/installing-windows-powershell?view=powershell-7), e isso via de regra é suficiente. Porém o powershell foi re-escrito como uma ferramenta opensource e multiplataforma, chamado agora de [Powershell Core](https://github.com/PowerShell/PowerShell). Para instalá-lo, basta acessar a página de releases, baixar o msi para sua arquitetura e executar.  
Opcionalmente, vou deixar aqui um [script](https://www.thomasmaurer.ch/2019/07/how-to-install-and-update-powershell-7/) que tem por objetivo identificar a versão necessária e baixar o instalador:
``` powershell
iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"
```

## POSH-GIT
O [posh-git](https://github.com/dahlbyk/posh-git) é um módulo do PowerShell que integra o Git ao Powershell provendo informações de status e contexto do Git que pode ser exibido diretamente no prompt de comando. Além de disponibilizar autocomplete para os comandos Git, nomes de branch, e muito mais.  

### Instalação 
Para instalar o módulo execute o seguinte comando:
``` powershell
Install-Module posh-git -Scope CurrentUser
```
Pode ser necessário autorizar pacotes vindos da *Galeria do Powershell*. Responda sim para que a instalação prossiga.  
Se voce receber um erro de *Install-Module* sobre o NuGet precisando interagir com *Repositório NuGet*, execute os comandos a seguir para inicializar o provedor de Nuget:
``` powershell
Install-PackageProvider NuGet -Force
Import-PackageProvider NuGet -Force
```

### Atualizações
Depois de instalado, você poderá sempre atualizar o módulo através do comando: 
``` powershell
Update-Module posh-git
``` 

### PSReadline
Se você estiver utilizando o Powershell Core, será preciso instalar o módulo [PSReadline](https://docs.microsoft.com/en-us/powershell/module/psreadline/?view=powershell-6&WT.mc_id=-blog-scottha) para poder customizar o ambiente do prompt de commando no Powershell. Isso pode ser feito através do comando:
``` powershell
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
``` 