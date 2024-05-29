document.addEventListener('DOMContentLoaded', function() {
    const artworks = [
        { id: 1, title: 'Ombre Mélancolique', description: 'Cette peinture, intitulée "LOmbre Mélancolique", représente une figure humaine portant un chapeau sombre, dont le visage est marqué par des éclaboussures de couleurs vives. Les traits du visage semblent fondre et se mélanger, créant une impression de tristesse et de confusion. Les couleurs dégoulinantes ajoutent une dimension de dégradation et dépuisement, évoquant une lutte intérieure intense. Le chapeau, sombre et large, cache partiellement le visage, symbolisant peut-être une tentative de se protéger ou de se dissimuler aux yeux du monde. Larrière-plan pâle et neutre met en évidence le personnage central, accentuant le contraste entre la figure tourmentée et son environnement. Cette œuvre évoque des thèmes de solitude, de souffrance intérieure et de la complexité des émotions humaines.', image_url: 'assets/images/1.jpg' },
        { id: 2, title: 'La Nuit de la Faucheuse', description: 'Cette œuvre, intitulée "La Nuit de la Faucheuse", capture une scène nocturne mystérieuse et inquiétante en noir et blanc. Elle dépeint un paysage enneigé sous un ciel étoilé, dominé par une lune dégoulinante. Une église solitaire se dresse sur une colline, ajoutant une ambiance sombre et spirituelle à la scène. Au premier plan, la figure menaçante de la Faucheuse, avec sa faux et son crâne visible sous sa capuche, symbolise la mort. Le chemin sinueux dans la neige, menant vers des tombes dispersées, suggère une présence silencieuse et constante de la mort. Les montagnes imposantes et les arbres enneigés à l arrière-plan créent une sensation d isolement et de calme sinistre, accentuant l atmosphère lugubre et invitant à réfléchir sur les thèmes de la vie, de la mort, et de la spiritualité.', image_url: 'assets/images/2.jpg' },
        { id: 3, title: 'Lueur dans la Nuit', description: 'L œuvre intitulée "Lueur dans la Nuit" dépeint une scène urbaine nocturne où un individu se tient seul sur une rue sombre, baignée par une lumière bleue éclatante émanant d un lampadaire. Les voitures garées et les maisons environnantes sont enveloppées dans l obscurité, créant un contraste saisissant entre la lumière et l ombre. À droite, une partie de la toile est dominée par une lumière violette mystérieuse, éclairant un coin isolé avec une chaise en bois solitaire, suggérant un sentiment de solitude et d introspection. Les teintes bleues et violettes renforcent l atmosphère énigmatique et introspective de la scène, invitant à la réflexion sur l isolement et la recherche de lumière dans l obscurité de la nuit.', image_url: 'assets/images/3.jpg' },
        { id: 4, title: 'Espoir', description: ' Cette peinture dépeint une scène mystique et envoûtante sous un ciel nocturne étoilé, dominé par un croissant de lune. Au milieu des montagnes sombres et imposantes, un personnage vêtu de rouge se tient dans une lueur dorée, illuminant son entourage immédiat. Autour de lui, des silhouettes fantomatiques, semblables à des pierres tombales, sont éparpillées dans le paysage sombre, chacune portant une lueur douce et mystérieuse. La combinaison de la lumière chaleureuse autour du personnage et le froid du paysage montagneux crée une atmosphère de contraste puissant entre espoir et mystère, entre la chaleur de la vie et le silence de la nuit.', image_url: 'assets/images/4.jpg' },
        { id: 5, title: 'Étreinte Abstraite', description: 'Cette œuvre abstraite est une exploration dynamique de formes et de couleurs chaudes, principalement des tons de rouge, orange et jaune. Les lignes noires ondulantes et les courbes gracieuses créent une sensation de mouvement et dénergie, tandis que les formes organiques suggèrent une danse ou une étreinte passionnée. Lutilisation de nuances contrastées et de zones dombre ajoute de la profondeur et de la texture, invitant le spectateur à découvrir des formes et des significations cachées. Cette composition évoque des émotions de chaleur et dintensité, rappelant la force des connexions humaines et des sentiments intérieurs.', image_url: 'assets/images/5.jpg' },
        { id: 6, title: 'Montagne Assombrie', description: 'Cette œuvre monochrome, intitulée "Montagne Assombrie", dépeint un paysage nocturne saisissant et mystérieux. Les montagnes, couvertes de neige et se dressant de manière imposante, sont rendues avec des nuances de noir, de gris et de blanc, créant un effet dramatique et austère. Au-dessus de ces pics enneigés, un croissant de lune pâle et légèrement dégoulinant illumine la scène, ajoutant une touche surréaliste à lensemble. Le ciel est parsemé détoiles discrètes, accentuant limmensité et la solitude de la nuit. Latmosphère générale de la peinture évoque une sensation de calme et de réflexion, invitant le spectateur à contempler la beauté et le mystère du paysage nocturne.', image_url: 'assets/images/6.jpg' }
    ];

    const gallery = document.getElementById('gallery');

    artworks.forEach(artwork => {
        const img = document.createElement('img');
        img.src = artwork.image_url;
        img.alt = artwork.title;
        img.addEventListener('click', () => {
            window.location
            window.location.href = `details.html?id=${artwork.id}`;
        });
        gallery.appendChild(img);
    });
});

// Ajout de la logique pour le formulaire de contact
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('contact-form');
    
    if (form) {
        form.addEventListener('submit', function(event) {
            event.preventDefault();
            const name = document.getElementById('name').value;
            const email = document.getElementById('email').value;
            const message = document.getElementById('message').value;
            
            alert(`Merci, ${name}! Votre message a été envoyé.`);
            
            form.reset();
        });
    }
});


function changeId(increment) {
    try {
        // Vérifiez si l'URL actuelle a déjà un paramètre 'id'
        var currentUrl = window.location.href;
        var url = new URL(currentUrl);

        // Obtenez la valeur actuelle de 'id' et assurez-vous qu'elle est valide
        var currentId = parseInt(url.searchParams.get("id"), 10);
        if (isNaN(currentId)) {
            throw new Error('Invalid ID');
        }

        // Calculez le nouvel ID en considérant les cas de boucle
        var newId = currentId + increment;
        if (newId > 6) {
            newId = 1;  // Loop back to 1 if incremented beyond 6
        } else if (new:Id < 1) {
            newId = 6;  // Loop back to 6 if decremented below 1
        }

        // Définissez le nouvel ID et redirigez
        url.searchParams.set("id", newId);
        window.location.href = url.href;
    } catch (error) {
        // En cas d'erreur, redirigez vers l'URL de base avec 'id=1'
        window.location.href = 'file:///C:/TP/Web/2cw-tp3-tp3_nicolas_attigue-rioux/index.html?id=1';
    }
}

