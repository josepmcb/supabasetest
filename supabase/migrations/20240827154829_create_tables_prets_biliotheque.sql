-- Création de la table Auteurs
CREATE TABLE Auteurs (
                         id_auteur SERIAL PRIMARY KEY,
                         nom VARCHAR(255) NOT NULL,
                         prenom VARCHAR(255) NOT NULL,
                         date_naissance DATE,
                         nationalite VARCHAR(100)
);

-- Création de la table Éditeurs
CREATE TABLE Editeurs (
                          id_editeur SERIAL PRIMARY KEY,
                          nom_editeur VARCHAR(255) NOT NULL,
                          pays VARCHAR(100),
                          ville VARCHAR(100)
);

-- Création de la table Œuvres
CREATE TABLE Oeuvres (
                         id_oeuvre SERIAL PRIMARY KEY,
                         titre VARCHAR(255) NOT NULL,
                         annee_publication INTEGER,  -- Utilitzant INTEGER en lloc de YEAR
                         id_auteur INT,
                         id_editeur INT,
                         FOREIGN KEY (id_auteur) REFERENCES Auteurs(id_auteur) ON DELETE SET NULL,
                         FOREIGN KEY (id_editeur) REFERENCES Editeurs(id_editeur) ON DELETE SET NULL
);

-- Création de la table Lecteurs
CREATE TABLE Lecteurs (
                          id_lecteur SERIAL PRIMARY KEY,
                          nom VARCHAR(255) NOT NULL,
                          prenom VARCHAR(255) NOT NULL,
                          email VARCHAR(255) UNIQUE
);

-- Création de la table Prêts
CREATE TABLE Prets (
                       id_pret SERIAL PRIMARY KEY,
                       id_oeuvre INT,
                       id_lecteur INT,
                       date_pret DATE NOT NULL,
                       date_retour DATE,
                       FOREIGN KEY (id_oeuvre) REFERENCES Oeuvres(id_oeuvre) ON DELETE CASCADE,
                       FOREIGN KEY (id_lecteur) REFERENCES Lecteurs(id_lecteur) ON DELETE CASCADE
);

-- Création de la table Opinions
CREATE TABLE Opinions (
                          id_opinion SERIAL PRIMARY KEY,
                          id_lecteur INT,
                          id_oeuvre INT,
                          note INT CHECK(note BETWEEN 1 AND 5),
                          commentaire TEXT,
                          date_opinion DATE NOT NULL,
                          FOREIGN KEY (id_lecteur) REFERENCES Lecteurs(id_lecteur) ON DELETE CASCADE,
                          FOREIGN KEY (id_oeuvre) REFERENCES Oeuvres(id_oeuvre) ON DELETE CASCADE
);
