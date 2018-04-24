function res = calcFg(q, a)
res = [ -2*(q(2)*q(4) - q(1)*q(3)) - a(1);
        -2*(q(1)*q(2) + q(3)*q(4)) - a(2);
        -2*(1/2 -q(2)^2 -q(3)^2) -a(3)];
end