# Automação de Configuração de Usuários e Permissões

## Descrição
Este projeto contém um script Bash para automatizar a criação de usuários, grupos, diretórios e configuração de permissões em um ambiente Linux.

## Funcionalidades
- Criação automática de grupos (`GRP_ADM`, `GRP_VEN`, `GRP_SEC`).
- Criação e adição de usuários aos seus respectivos grupos.
- Criação de diretórios e configuração de permissões.
- Permissões ajustadas para garantir segurança e organização.

## Pré-requisitos
- Sistema operacional Linux.
- Acesso root ou permissões de sudo.

## Como Usar
1. Clone este repositório:
   ```sh
   git clone https://github.com/seu-usuario/seu-repositorio.git
   ```
2. Acesse o diretório do projeto:
   ```sh
   cd seu-repositorio
   ```
3. Torne o script executável:
   ```sh
   chmod +x setup_users.sh
   ```
4. Execute o script:
   ```sh
   sudo ./setup_users.sh
   ```
