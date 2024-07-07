### README

# Coleta Manual

Este script é utilizado para coletar arquivos de um equipamento com CronosX+Linux através do CMD.

## Uso

Para executar o script, simplesmente rode o arquivo `coleta_manual.cmd` no prompt de comando do Windows:

```
coleta_manual.cmd
```

## Funcionalidades

- Obtém a data e hora local do sistema.
- Solicita o nome do equipamento e o IP do equipamento remoto.
- Cria um diretório local para armazenar os arquivos coletados.
- Usa SCP para copiar arquivos do equipamento remoto para o diretório local.
- Compacta os arquivos coletados em um arquivo ZIP usando 7-Zip.
- Abre o diretório do equipamento no Explorer após a conclusão da coleta e compactação.

## Requisitos

- Windows com suporte a CMD.
- Ferramenta SCP (como parte do OpenSSH ou PuTTY).
- 7-Zip instalado e acessível no PATH do sistema.
- Conexão de rede com o equipamento remoto.

## Variáveis e Parâmetros

- `BASE_COLETA`: Diretório base onde as coletas serão armazenadas (por padrão, `C:\Coletas\`).
- `IP_REMOTO`: IP do equipamento remoto (pode ser configurado durante a execução, padrão `192.168.10.50`).
- `REMOTE_PATH`: Caminho remoto dos arquivos a serem coletados.

## Licença

Este projeto é licenciado sob a [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html).
