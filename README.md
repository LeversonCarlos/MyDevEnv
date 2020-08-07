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