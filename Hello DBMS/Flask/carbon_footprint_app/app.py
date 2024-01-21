from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
import os

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///C:/Users/change/Desktop/BUREAU/LA PLATE FORME/COURS/Hello DBMS +/Flask/carbon_footprint_app/CarbonFootprint.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False  # Désactivez le suivi des modifications pour éviter les avertissements
db = SQLAlchemy(app)


class Results(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    # Ajoutez d'autres colonnes selon votre schéma de base de données


@app.route('/')
def home():
    # Obtenir le chemin absolu du répertoire actuel du script
    current_dir = os.path.dirname(os.path.abspath(__file__))

    # Chemin relatif du fichier SQL par rapport au répertoire du script
    sql_file_path = os.path.join(current_dir, 'templates', 'BigJob 2 & 3.sql')

    # Ouvrir le fichier SQL
    with open(sql_file_path, 'r') as sql_file:
        sql_content = sql_file.read()

    context = {'sql_content': sql_content}  # Ajoutez ici le contexte que vous souhaitez passer à votre modèle
    return render_template('home.html', context=context)

if __name__ == '__main__':
    app.run(debug=True)
