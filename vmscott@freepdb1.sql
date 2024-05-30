-- Cr�ation des tables

-- Table des artistes
CREATE TABLE Artists (
    artist_id NUMBER PRIMARY KEY,  -- Identifiant unique de l'artiste
    name VARCHAR2(255) NOT NULL,   -- Nom de l'artiste
    bio CLOB NOT NULL,             -- Biographie de l'artiste
    profile_image_url VARCHAR2(255) NOT NULL  -- URL de l'image de profil de l'artiste
);

-- Table des �uvres d'art
CREATE TABLE Artworks (
    artwork_id NUMBER PRIMARY KEY,  -- Identifiant unique de l'�uvre d'art
    title VARCHAR2(255) NOT NULL,   -- Titre de l'�uvre d'art
    description CLOB NOT NULL,      -- Description de l'�uvre d'art
    image_url VARCHAR2(255) NOT NULL,  -- URL de l'image de l'�uvre d'art
    artist_id NUMBER,               -- Identifiant de l'artiste
    CONSTRAINT fk_artist
        FOREIGN KEY (artist_id)
        REFERENCES Artists (artist_id)  -- R�f�rence � la table des artistes
);

-- Table des utilisateurs
CREATE TABLE Users (
    user_id NUMBER PRIMARY KEY,     -- Identifiant unique de l'utilisateur
    name VARCHAR2(255) NOT NULL,    -- Nom de l'utilisateur
    email VARCHAR2(255) NOT NULL,   -- Email de l'utilisateur
    password VARCHAR2(255) NOT NULL -- Mot de passe de l'utilisateur
);

-- Table des messages
CREATE TABLE Messages (
    message_id NUMBER PRIMARY KEY,  -- Identifiant unique du message
    user_id NUMBER,                 -- Identifiant de l'utilisateur
    subject VARCHAR2(255) NOT NULL, -- Sujet du message
    content CLOB NOT NULL,          -- Contenu du message
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Date et heure d'envoi du message
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES Users (user_id)  -- R�f�rence � la table des utilisateurs
);

-- Insertion de valeurs dans la table Users
INSERT INTO Users (user_id, name, email, password) VALUES
(1, 'John Doe', 'john.doe@example.com', 'password1'),
(2, 'Jane Smith', 'jane.smith@example.com', 'password2'),
(3, 'Alice Johnson', 'alice.johnson@example.com', 'password3');

-- Insertion de valeurs dans la table Messages
INSERT INTO Messages (message_id, user_id, subject, content, created_at) VALUES
(1, 1, 'Question about Artwork', 'I really love your artwork! Can you tell me more about it?', SYSTIMESTAMP),
(2, 2, 'Collaboration Request', 'I would like to collaborate with you on a new project.', SYSTIMESTAMP),
(3, 3, 'Purchase Inquiry', 'How can I purchase one of your artworks?', SYSTIMESTAMP);

INSERT INTO Artworks (artwork_id, title, description, image_url) VALUES
    (1, 'Ombre M�lancolique', 'Cette peinture, intitul�e "Ombre M�lancolique", repr�sente une figure humaine portant un chapeau sombre, dont le visage est marqu� par des �claboussures de couleurs vives. Les traits du visage semblent fondre et se m�langer, cr�ant une impression de tristesse et de confusion. Les couleurs d�goulinantes ajoutent une dimension de d�gradation et d�puisement, �voquant une lutte int�rieure intense. Le chapeau, sombre et large, cache partiellement le visage, symbolisant peut-�tre une tentative de se prot�ger ou de se dissimuler aux yeux du monde. Larri�re-plan p�le et neutre met en �vidence le personnage central, accentuant le contraste entre la figure tourment�e et son environnement. Cette �uvre �voque des th�mes de solitude, de souffrance int�rieure et de la complexit� des �motions humaines.', 'assets/images/1.jpg'),
    (2, 'La Nuit de la Faucheuse', 'Cette �uvre, intitul�e "La Nuit de la Faucheuse", capture une sc�ne nocturne myst�rieuse et inqui�tante en noir et blanc. Elle d�peint un paysage enneig� sous un ciel �toil�, domin� par une lune d�goulinante. Une �glise solitaire se dresse sur une colline, ajoutant une ambiance sombre et spirituelle � la sc�ne. Au premier plan, la figure mena�ante de la Faucheuse, avec sa faux et son cr�ne visible sous sa capuche, symbolise la mort. Le chemin sinueux dans la neige, menant vers des tombes dispers�es, sugg�re une pr�sence silencieuse et constante de la mort. Les montagnes imposantes et les arbres enneig�s � l arri�re-plan cr�ent une sensation d isolement et de calme sinistre, accentuant l atmosph�re lugubre et invitant � r�fl�chir sur les th�mes de la vie, de la mort, et de la spiritualit�.', 'assets/images/2.jpg'),
    (3, 'Lueur dans la Nuit', 'L �uvre intitul�e "Lueur dans la Nuit" d�peint une sc�ne urbaine nocturne o� un individu se tient seul sur une rue sombre, baign�e par une lumi�re bleue �clatante �manant d un lampadaire. Les voitures gar�es et les maisons environnantes sont envelopp�es dans l obscurit�, cr�ant un contraste saisissant entre la lumi�re et l ombre. � droite, une partie de la toile est domin�e par une lumi�re violette myst�rieuse, �clairant un coin isol� avec une chaise en bois solitaire, sugg�rant un sentiment de solitude et d introspection. Les teintes bleues et violettes renforcent l atmosph�re �nigmatique et introspective de la sc�ne, invitant � la r�flexion sur l isolement et la recherche de lumi�re dans l obscurit� de la nuit.', 'assets/images/3.jpg'),
    (4, 'Espoir', 'Cette peinture d�peint une sc�ne mystique et envo�tante sous un ciel nocturne �toil�, domin� par un croissant de lune. Au milieu des montagnes sombres et imposantes, un personnage v�tu de rouge se tient dans une lueur dor�e, illuminant son entourage imm�diat. Autour de lui, des silhouettes fantomatiques, semblables � des pierres tombales, sont �parpill�es dans le paysage sombre, chacune portant une lueur douce et myst�rieuse. La combinaison de la lumi�re chaleureuse autour du personnage et le froid du paysage montagneux cr�e une atmosph�re de contraste puissant entre espoir et myst�re, entre la chaleur de la vie et le silence de la nuit.', 'assets/images/4.jpg'),
    (5, '�treinte Abstraite', 'Cette �uvre abstraite est une exploration dynamique de formes et de couleurs chaudes, principalement des tons de rouge, orange et jaune. Les lignes noires ondulantes et les courbes gracieuses cr�ent une sensation de mouvement et d�nergie, tandis que les formes organiques sugg�rent une danse ou une �treinte passionn�e. Lutilisation de nuances contrast�es et de zones dombre ajoute de la profondeur et de la texture, invitant le spectateur � d�couvrir des formes et des significations cach�es. Cette composition �voque des �motions de chaleur et dintensit�, rappelant la force des connexions humaines et des sentiments int�rieurs.', 'assets/images/5.jpg'),
    (6, 'Montagne Assombrie', 'Cette �uvre monochrome, intitul�e "Montagne Assombrie", d�peint un paysage nocturne saisissant et myst�rieux. Les montagnes, couvertes de neige et se dressant de mani�re imposante, sont rendues avec des nuances de noir, de gris et de blanc, cr�ant un effet dramatique et aust�re. Au-dessus de ces pics enneig�s, un croissant de lune p�le et l�g�rement d�goulinant illumine la sc�ne, ajoutant une touche surr�aliste � lensemble. Le ciel est parsem� d�toiles discr�tes, accentuant limmensit� et la solitude de la nuit. Latmosph�re g�n�rale de la peinture �voque une sensation de calme et de r�flexion, invitant le spectateur � contempler la beaut� et le myst�re du paysage nocturne.', 'assets/images/6.jpg');
    
    INSERT INTO Artists (artist_id, name, bio, profile_image_url) VALUES
    (1, 'Virgile Bonnefoy', 'Virgile Bonnefoy est un artiste qu�b�cois d''origine fran�aise n� � Pontoise en avril 2005. Il cr�er ses premiers oeuvres vers l''�ge de 14 ans en utilisant comme m�diums principalement des bombes a�rosol et des crayons � peinture.

�J''ai commence par la calligraphie dans un style graffiti. Ma grand m�re m''avait offert un livre (Street Fonts je crois) dans lequel chaque page pr�sentais l''alphabet illustr� dans le style d''un artiste de Street art. J''ai alors commencer a recopier leurs calligraphie et, pour mes amis qui le voulais, j''�crivais leur nom dans un style graffiti assez complexe et colorer sur une simple feuille en papier.�

C''est durant cette p�riode qu''il a commenc� � se diriger vers des plus grands formats et � peindre � la bombe de peinture. Il as r�alis� une s�rie de toiles sur lesquels �taient marqu�s des paroles des chansons c�l�bres dans un style visuel �voquant la chanson en question.

� C''est mon p�re qui m''avait fait ma premi�re commande. Si je me souviens bien le premier tableau �tait sur la chanson Starlight de Muse et il y �tait marqu� �Never Fade Away�. J''ai ensuite fait Nothing Else Matters (Metallica), Come As You Are (Nirvana), Patience (G n'' R) et quelques autres. �

C''est peu de temps avant son arriv�e au c�gep, vers ses 17 ans qu''il a r�ellement commenc� a peindre dans le style qu''on lui connais aujourd''hui.
Ayant d�couvert des artistes tel que Friedrich, Gustave Dor� ou bien Maxime Taccardi, il se forge une esth�tique qui lui est propre.

�Je travail peu avec la couleur. En g�n�ral, quand je peu l''�viter, je ne m''en prive pas. Les quelques toiles que j''ai peintes en couleur �tait pour des travaux ou des commandes. �tant un grand amateur de black metal (un genre de m�tal extr�me n� dans les pays scandinaves vers la fin des ann�es 80), je tire mes inspirations des pochettes d''albums qui me sont donn� de voir.�', 'assets/images/artiste.jpg');

