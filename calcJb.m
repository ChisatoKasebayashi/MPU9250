function Jb = calcJb( q, b )
    bx = b(2);
    bz = b(4);
    Jb = [
        -2*bz*q(3)              2*bz*q(4)           -4*bx*q(3)-2*bz*q(1)    -4*bx*q(4)+2*bz*q(2) ;
        -2*bx*q(4)+2*bz*q(2)    2*bx*q(3)+2*bz*q(1) 2*bx*q(2)+2*bz*q(4)     -2*bx*q(1)+2*bz*q(3) ;
        2*bx*q(3)               2*bx*q(4)-4*bz*q(2) 2*bx*q(1)-4*bz*q(3)     2*bx*q(2)
        ];
end

