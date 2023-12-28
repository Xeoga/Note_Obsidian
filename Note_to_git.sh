#!/bin/bash
#!/bin/bash

# Numele fișierului pentru logare
LOG_FILE="logfile.log"

# Directorul care conține fișierele proiectului
PROJECT_DIR="/home/h1p/Note"

# Repository-ul Git remote
REMOTE_REPO="git@github.com:Xeoga/Note_Obsidian.git"

# Cheia SSH privată
SSH_KEY="/home/h1p/.ssh/second_private_key_git"

# Setarea permisiunilor corecte pentru cheia SSH
chmod 600 "$SSH_KEY"

# Adăugarea cheii SSH la agentul SSH
eval "$(ssh-agent -s)"
ssh-add "$SSH_KEY"

# Schimbarea directorului curent în directorul proiectului
cd "$PROJECT_DIR"

# Adăugarea tuturor fișierelor modificate sau noi
git add .

# Crearea unui commit cu mesajul curent de timp și dată
commit_message="Backup la data $(date +'%Y-%m-%d %H:%M:%S')"
git commit -m "$commit_message"

# Redirecționarea oricărui output într-un fișier de log
{
    # Împingerea modificărilor în repository-ul remote
    git push "$REMOTE_REPO"
} >> "$LOG_FILE" 2>&1

