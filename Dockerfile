# Utiliser une image Python officielle comme base
FROM python:3.11-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier Python dans le conteneur
COPY todo.py .

# Créer un utilisateur non-root pour la sécurité
RUN groupadd -r todouser && useradd -r -g todouser todouser

# Changer la propriété du répertoire de travail
RUN chown -R todouser:todouser /app

# Passer à l'utilisateur non-root
USER todouser

# Définir la commande par défaut pour exécuter l'application
CMD ["python", "todo.py"]

# Optionnel: Ajouter des métadonnées
LABEL maintainer="votre-email@example.com"
LABEL version="1.0"
LABEL description="Simple Todo List Application"