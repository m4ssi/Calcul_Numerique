
function test_jouet()

    rand ( "seed", 42);
    frelres = zeros ( 1, 1000);
    brelres = zeros ( 1, 1000);
    step = [1:1000];
    i = 1;
    for n = step   
        A = rand (n, n);					// Création d'une matrice
        xex = rand (n, 1);					// Création d'un vecteur 
        b = A*xex;							// calcul de b 
        x = A\b;							// Calcul de x a partir de A et b
        frelres(i) = norm (x-xex)/norm (xex);	// Calcul de l'erreur avant (erreur sur x)
        brelres(i) = norm (b-A*x)/norm (b);	// Calcul de l'erreur arrière (erreur sur b)
    	i = i+1;
    end
    xtitle ( "Erreur avant et arrière du programme jouet", "n", "error");
    plot ( step, log(frelres), "r-");
    plot ( step, log(brelres), "b-");
    legend ( 'Forward error', 'Beward error');
    xs2png(0, "img/jouet_error.png");
endfunction
