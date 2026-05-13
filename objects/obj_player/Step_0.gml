/*

Primo codiciazzo per il giochino, la logica gestisce:
- Assegnazione tasti
- Movimento
- Gestione sprite
- Corretta mostra del player

*/


// Assegno i tasti WASD al movimento
right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));

x_speed = (right_key - left_key) * mov_speed		// Faccio il calcolo tra 2 booleani
y_speed = (down_key - up_key) * mov_speed			// Moltiplico poi per aggiungere la velocità del payer


mask_index = sprite[DOWN];	//Posizione iniziale dello sprite

if y_speed == 0{			// Guardo se sta camminando in orizzontale e cambio lo sprite tra dx e sx
if x_speed > 0 {face = RIGHT}
if x_speed < 0 {face = LEFT}
}

if x_speed > 0 && face == LEFT {face = RIGHT}		// Fixo eventuali bug di sprite
if x_speed < 0 && face == RIGHT {face = LEFT}

if x_speed == 0{			// Guardo se sta camminando in verticale e cambio lo sprite tra su e giù
if y_speed > 0 {face = DOWN}
if y_speed < 0 {face = UP}
}

if y_speed > 0 && face == UP {face = DOWN}			// Fixo eventuali bug di sprite
if y_speed < 0 && face == DOWN {face = UP}

sprite_index = sprite[face];						// Setto dove guarda lo sprite

if place_meeting(x + x_speed, y, obj_wall) == true {x_speed = 0}	// Guardo collisioni
if place_meeting(x, y + y_speed, obj_wall) == true {y_speed = 0}

if x_speed == 0 && y_speed == 0 {image_index = 0}	// Dico che se non si muove lo sprite deve fermarsi

x += x_speed	// Muovo il player
y += y_speed

depth = - bbox_bottom;		// Metto in primo piano il player

