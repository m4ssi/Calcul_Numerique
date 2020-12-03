// Calcul de Ax = b
// Calcul de b a partir d'un vecteur x exact (xex)
// Calcul d'un vecteur x à partir de b et de A
// Calcul des erreurs avant et arières lié au x calculé et au b calculé
// \param n		taille de la matrice
// \param f		format d'afichage des nombres (1 ou 0)
function test_gausskij3b ()

    rand ( "seed", 42);
    x = 100;
    frelres = zeros ( 1, x-3);
    brelres = zeros ( 1, x-3);
    step = [3:x];
    for n = step
        i = n-2;
        A = rand ( n, n);
        xex = rand ( n, 1);
        b = A*xex;
        x = gausskij3b ( A, b);
        frelres ( i) = norm ( x-xex)./ norm(x);
        brelres ( i) = norm ( b-A*x)./ norm(b);
    end
    
    xtitle ( "Erreur avant et arrière - Methode de Gauss", "n", "error");
    plot ( step, frelres, "r-");
    plot ( step, brelres, "b-");
    legend ( 'Forward error', 'Beward error');
    xs2png(0, "img/gauss_error.png");
endfunction
