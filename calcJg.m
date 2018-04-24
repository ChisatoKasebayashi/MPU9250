function Jg = calcJg( q )
    Jg = [
        -2*q(3)  2*q(4) -2*q(1)  2*q(2);
         2*q(2)  2*q(1)  2*q(4)  2*q(3);
              0 -4*q(2) -4*q(3)       0
    ];
end

