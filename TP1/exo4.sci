
function test_usolve ()

rand ( "seed", 42);
x = 100;
u_frelres = zeros ( 1, x-3);
u_brelres = zeros ( 1, x-3);
step = [3:x];
for n = step
    i = n-2;
    M = rand ( n, n);
    U = triu (M);
    u_xex = rand ( n, 1);
    u_b = U*u_xex;
    u_x = usolve ( U, u_b);
    u_frelres ( i) = norm ( u_x-u_xex)./ norm(u_x);
    u_brelres ( i) = norm ( u_b-U*u_x)./ norm(u_b);
end

xtitle ( "Erreur avant et arrière - USolve", "n", "error");
plot ( step, log(u_frelres), "r-");
plot ( step, log(u_brelres), "b-");
legend ( 'U Forward error', 'U Beward error');
xs2png(0, "img/usolve_error.png");
endfunction

function test_lsolve ()

rand ( "seed", 42);
x = 100;
l_frelres = zeros ( 1, x-3);
l_brelres = zeros ( 1, x-3);
step = [3:x];
for n = step
    i = n-2;
    M = rand ( n, n);
    L = tril (M);

    l_xex = rand ( n, 1);
    l_b = L*l_xex;
    l_x = lsolve ( L, l_b);
    l_frelres ( i) = norm ( l_x-l_xex)./ norm(l_x);
    l_brelres ( i) = norm ( l_b-L*l_x)./ norm(l_b);
end

xtitle ( "Erreur avant et arrière - LSolve", "n", "error");
plot ( step, log(l_frelres), "r--");
plot ( step, log(l_brelres), "b--");
legend ( 'L Forward error', 'L Beward error');
xs2png(0, "img/lsolve_error.png");
endfunction

