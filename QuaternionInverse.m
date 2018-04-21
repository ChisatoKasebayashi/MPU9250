function ret = QuaternionInverse( q )
    norm = sqrt(sum(q.^2));
    q_bar = -q;
    q_bar(1) = q(1);
    ret = q_bar / norm;
end