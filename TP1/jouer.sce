

// Calcul de Ax = b
// Calcul de b a partir d'un vecteur x exact (xex)
// Calcul d'un vecteur x à partir de b et de A
// Calcul des erreurs avant et arières lié au x calculé et au b calculé
// \param n		taille de la matrice
// \param f		format d'afichage des nombres (1 ou 0)
function jouet_variable (n, f)
    A = rand (n, n);					// Création d'une matrice
    xex = rand (n, 1);					// Création d'un vecteur 
    b = A*xex;							// calcul de b 
    x = A\b;							// Calcul de x a partir de A et b
    frelres = norm (x-xex)/norm (xex);	// Calcul de l'erreur avant (erreur sur x)
    brelres = norm (b-A*x)/norm (b);	// Calcul de l'erreur arrière (erreur sur b)
    disp("frelres = ", frelres);
    disp("brelres = ", brelres);
    capa = cond(A);						// Calcul du conditionnement (dépendance de la solution aux données)
endfunction
