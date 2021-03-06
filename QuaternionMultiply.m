function res = QuaternionMultiply(q, p) % size(q):1x4 size(p):1x4
C = [0, -q(4), q(3); q(4), 0, -q(2); -q(3), q(2), 0];
%disp('*************');
%disp([p(1) -transpose(p(2:4,1))]);
%disp(horzcat(p(2:4,1), p(1)*eye(3)+C));
%disp(vertcat([p(1) -transpose(p(2:4,1))], horzcat(p(2:4,1), p(1)*eye(3)+C)));
%disp('*************');
%disp([q(1); q(2:4,1)]);
res = vertcat([p(1) -transpose(p(2:4,1))], horzcat(p(2:4,1), p(1)*eye(3)+C)) * [q(1); q(2:4,1)];
end