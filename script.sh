#!/bin/bash

# Definição de grupos
GRUPOS=(GRP_ADM GRP_VEN GRP_SEC)

# Definição de usuários e seus respectivos grupos
declare -A USUARIOS
USUARIOS=(
    [carlos]=GRP_ADM
    [maria]=GRP_ADM
    [joao]=GRP_ADM
    [alice]=GRP_VEN
    [sebastiana]=GRP_VEN
    [roberto]=GRP_VEN
    [josefina]=GRP_SEC
    [amanda]=GRP_SEC
    [rogerio]=GRP_SEC
)

# Criar grupos
for GRUPO in "${GRUPOS[@]}"; do
    if ! grep -q "^$GRUPO:" /etc/group; then
        groupadd "$GRUPO"
        echo "Grupo $GRUPO criado."
    else
        echo "Grupo $GRUPO já existe."
    fi
done

# Criar usuários e adicionar aos grupos
for USUARIO in "${!USUARIOS[@]}"; do
    if ! id "$USUARIO" &>/dev/null; then
        useradd -m -s /bin/bash -G "${USUARIOS[$USUARIO]}" "$USUARIO"
        echo "$USUARIO criado e adicionado ao grupo ${USUARIOS[$USUARIO]}"
    else
        echo "Usuário $USUARIO já existe."
    fi
done

# Criar diretórios e definir permissões
mkdir -p /publico /adm /ven /sec
chmod 777 /publico
chmod 770 /adm /ven /sec
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo "Configuração concluída!"
