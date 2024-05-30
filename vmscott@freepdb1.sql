-- Création des tables

-- Table des artistes
CREATE TABLE Artists (
    artist_id NUMBER PRIMARY KEY,  -- Identifiant unique de l'artiste
    name VARCHAR2(255) NOT NULL,   -- Nom de l'artiste
    bio CLOB NOT NULL,             -- Biographie de l'artiste
    profile_image_url VARCHAR2(255) NOT NULL  -- URL de l'image de profil de l'artiste
);

-- Table des œuvres d'art
CREATE TABLE Artworks (
    artwork_id NUMBER PRIMARY KEY,  -- Identifiant unique de l'œuvre d'art
    title VARCHAR2(255) NOT NULL,   -- Titre de l'œuvre d'art
    description CLOB NOT NULL,      -- Description de l'œuvre d'art
    image_url VARCHAR2(255) NOT NULL,  -- URL de l'image de l'œuvre d'art
    artist_id NUMBER,               -- Identifiant de l'artiste
    CONSTRAINT fk_artist
        FOREIGN KEY (artist_id)
        REFERENCES Artists (artist_id)  -- Référence à la table des artistes
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
        REFERENCES Users (user_id)  -- Référence à la table des utilisateurs
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
    (1, 'Ombre Mélancolique', 'Cette peinture, intitulée "Ombre Mélancolique", représente une figure humaine portant un chapeau sombre, dont le visage est marqué par des éclaboussures de couleurs vives. Les traits du visage semblent fondre et se mélanger, créant une impression de tristesse et de confusion. Les couleurs dégoulinantes ajoutent une dimension de dégradation et dépuisement, évoquant une lutte intérieure intense. Le chapeau, sombre et large, cache partiellement le visage, symbolisant peut-être une tentative de se protéger ou de se dissimuler aux yeux du monde. Larrière-plan pâle et neutre met en évidence le personnage central, accentuant le contraste entre la figure tourmentée et son environnement. Cette œuvre évoque des thèmes de solitude, de souffrance intérieure et de la complexité des émotions humaines.', 'assets/images/1.jpg'),
    (2, 'La Nuit de la Faucheuse', 'Cette œuvre, intitulée "La Nuit de la Faucheuse", capture une scène nocturne mystérieuse et inquiétante en noir et blanc. Elle dépeint un paysage enneigé sous un ciel étoilé, dominé par une lune dégoulinante. Une église solitaire se dresse sur une colline, ajoutant une ambiance sombre et spirituelle à la scène. Au premier plan, la figure menaçante de la Faucheuse, avec sa faux et son crâne visible sous sa capuche, symbolise la mort. Le chemin sinueux dans la neige, menant vers des tombes dispersées, suggère une présence silencieuse et constante de la mort. Les montagnes imposantes et les arbres enneigés à l arrière-plan créent une sensation d isolement et de calme sinistre, accentuant l atmosphère lugubre et invitant à réfléchir sur les thèmes de la vie, de la mort, et de la spiritualité.', 'assets/images/2.jpg'),
    (3, 'Lueur dans la Nuit', 'L œuvre intitulée "Lueur dans la Nuit" dépeint une scène urbaine nocturne où un individu se tient seul sur une rue sombre, baignée par une lumière bleue éclatante émanant d un lampadaire. Les voitures garées et les maisons environnantes sont enveloppées dans l obscurité, créant un contraste saisissant entre la lumière et l ombre. À droite, une partie de la toile est dominée par une lumière violette mystérieuse, éclairant un coin isolé avec une chaise en bois solitaire, suggérant un sentiment de solitude et d introspection. Les teintes bleues et violettes renforcent l atmosphère énigmatique et introspective de la scène, invitant à la réflexion sur l isolement et la recherche de lumière dans l obscurité de la nuit.', 'assets/images/3.jpg'),
    (4, 'Espoir', 'Cette peinture dépeint une scène mystique et envoûtante sous un ciel nocturne étoilé, dominé par un croissant de lune. Au milieu des montagnes sombres et imposantes, un personnage vêtu de rouge se tient dans une lueur dorée, illuminant son entourage immédiat. Autour de lui, des silhouettes fantomatiques, semblables à des pierres tombales, sont éparpillées dans le paysage sombre, chacune portant une lueur douce et mystérieuse. La combinaison de la lumière chaleureuse autour du personnage et le froid du paysage montagneux crée une atmosphère de contraste puissant entre espoir et mystère, entre la chaleur de la vie et le silence de la nuit.', 'assets/images/4.jpg'),
    (5, 'Étreinte Abstraite', 'Cette œuvre abstraite est une exploration dynamique de formes et de couleurs chaudes, principalement des tons de rouge, orange et jaune. Les lignes noires ondulantes et les courbes gracieuses créent une sensation de mouvement et dénergie, tandis que les formes organiques suggèrent une danse ou une étreinte passionnée. Lutilisation de nuances contrastées et de zones dombre ajoute de la profondeur et de la texture, invitant le spectateur à découvrir des formes et des significations cachées. Cette composition évoque des émotions de chaleur et dintensité, rappelant la force des connexions humaines et des sentiments intérieurs.', 'assets/images/5.jpg'),
    (6, 'Montagne Assombrie', 'Cette œuvre monochrome, intitulée "Montagne Assombrie", dépeint un paysage nocturne saisissant et mystérieux. Les montagnes, couvertes de neige et se dressant de manière imposante, sont rendues avec des nuances de noir, de gris et de blanc, créant un effet dramatique et austère. Au-dessus de ces pics enneigés, un croissant de lune pâle et légèrement dégoulinant illumine la scène, ajoutant une touche surréaliste à lensemble. Le ciel est parsemé détoiles discrètes, accentuant limmensité et la solitude de la nuit. Latmosphère générale de la peinture évoque une sensation de calme et de réflexion, invitant le spectateur à contempler la beauté et le mystère du paysage nocturne.', 'assets/images/6.jpg');
    
    INSERT INTO Artists (artist_id, name, bio, profile_image_url) VALUES
    (1, 'Virgile Bonnefoy', 'Virgile Bonnefoy est un artiste québécois d''origine française né à Pontoise en avril 2005. Il créer ses premiers oeuvres vers l''âge de 14 ans en utilisant comme médiums principalement des bombes aérosol et des crayons à peinture.

«J''ai commence par la calligraphie dans un style graffiti. Ma grand mère m''avait offert un livre (Street Fonts je crois) dans lequel chaque page présentais l''alphabet illustré dans le style d''un artiste de Street art. J''ai alors commencer a recopier leurs calligraphie et, pour mes amis qui le voulais, j''écrivais leur nom dans un style graffiti assez complexe et colorer sur une simple feuille en papier.»

C''est durant cette période qu''il a commencé à se diriger vers des plus grands formats et à peindre à la bombe de peinture. Il as réalisé une série de toiles sur lesquels étaient marqués des paroles des chansons célèbres dans un style visuel évoquant la chanson en question.

« C''est mon père qui m''avait fait ma première commande. Si je me souviens bien le premier tableau était sur la chanson Starlight de Muse et il y était marqué «Never Fade Away». J''ai ensuite fait Nothing Else Matters (Metallica), Come As You Are (Nirvana), Patience (G n'' R) et quelques autres. »

C''est peu de temps avant son arrivée au cégep, vers ses 17 ans qu''il a réellement commencé a peindre dans le style qu''on lui connais aujourd''hui.
Ayant découvert des artistes tel que Friedrich, Gustave Doré ou bien Maxime Taccardi, il se forge une esthétique qui lui est propre.

«Je travail peu avec la couleur. En général, quand je peu l''éviter, je ne m''en prive pas. Les quelques toiles que j''ai peintes en couleur était pour des travaux ou des commandes. Étant un grand amateur de black metal (un genre de métal extrême né dans les pays scandinaves vers la fin des années 80), je tire mes inspirations des pochettes d''albums qui me sont donné de voir.»', 'assets/images/artiste.jpg');

