function test_matmat ()
    t3b = zeros(1, 100);
    t2b = zeros(1, 100);
    t1b = zeros(1, 100);
    step = [1:100];
    for i = step
        A = rand (i, i);
        B = rand (i, i);
        
        tic();
        matmat3b ( A, B);
        t3b(i) = toc(); 
        
        tic();
        matmat2b ( A, B);
        t2b(i) = toc(); 
        
        tic();
        matmat1b ( A, B);
        t1b(i) = toc();
    end

    xtitle ( "Temps d execution du produit de matrice", "n", "temps");
    plot ( step, t3b, "r-");
    plot ( step, t2b, "b-");
    plot ( step, t1b, "g-");
    legend ( 'matmat3b', 'matmat2b', 'matmat1b');
    xs2png(0, "img/matmat_time.png");
endfunction
