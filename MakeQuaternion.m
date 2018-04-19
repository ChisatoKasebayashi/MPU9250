function res = MakeQuaternion(u) %size(u):3x1
u_norm = norm(u);
res = [cos(u_norm/2); (u(1)/u_norm)*sin(u_norm/2); (u(2)/u_norm)*sin(u_norm/2); (u(3)/u_norm)*sin(u_norm/2) ];
end