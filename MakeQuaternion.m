function res = MakeQuaternion(u) %size(u):3x1
u_norm = norm(u);
if u_norm == 0
    res = [1;0;0;0];
else
    res = [cos(u_norm/2); (u(1)/u_norm)*sin(u_norm/2); (u(2)/u_norm)*sin(u_norm/2); (u(3)/u_norm)*sin(u_norm/2) ];
end
end
