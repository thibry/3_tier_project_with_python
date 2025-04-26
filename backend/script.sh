#!/bin/bash

# Variables'
APP_NAME="app.py"   # Remplacez par le nom de votre application Flask
VENV_DIR="venv"     # Répertoire virtuel

# Verifier si python est installé
#if ! command -v python3 &> /dev/null; then
#    echo "Python n'est pas installé. Veuillez l'installer avant de continuer."
#    echo "Installation de Python3..."
#    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
#        sudo apt update && sudo apt install -y python3 python3-venv
#    elif [[ "$OSTYPE" == "darwin"* ]]; then
#        brew install python3
#    elif [[ "$OSTYPE" == "cygwin" ]]; then
#        echo "veuillez installer Python manuellement."
#    else
#        echo "Système d'exploitation non pris en charge."
#    fi
#    exit 1
#fi


#!/bin/bash

# Check if python3 is installed
if command -v python3 &>/dev/null
then
    echo "Python3 is installed."
    python3 --version
else
    echo "Python3 is NOT installed."
    echo "Installing Python3..."
    sudo apt update
    sudo apt install -y python3
    echo "Python3 has been installed."
    python3 --version
fi






# Créer un environnement virtuel
if [ ! -d "$VENV_DIR" ]; then
    echo "Création de l'environnement virtuel..."
    python3 -m venv $VENV_DIR
fi

# Activer l'environnement virtuel
echo "Activation de l'environnement virtuel..."
source $VENV_DIR/bin/activate

# Installer les dépendances
if [ -f "requirements.txt" ]; then
    echo "Installation des dépendances..."
    pip install -r requirements.txt
else
    echo "Aucun fichier requirements.txt trouvé. Veuillez le créer ou installer"
fi

# Lancer l'application Flask
if [ -f "$APP_NAME" ]; then
    echo "Lancement de l'application Flask..."
    export FLASK_APP=$APP_NAME
    export FLASK_ENV=development
    flask run --host=0.0.0 --port=5000
else
    echo "Aucun fichier $APP_NAME trouvé. Veuillez le créer ou spécifier le bon nom."
    deactivate
    exit 1
fi

# Désactiver l'environnement virtuel
deactivate
echo "Environnement virtuel désactivé."
echo "Script terminé."
# Fin du script