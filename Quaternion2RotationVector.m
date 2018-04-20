function res = Quaternion2RotationVector(q) %size(q):1x4
if q(2:4) == [0;0;0]
    res = 2*q(2:4);
else
    res = ( 2*acos(q(1))/sqrt(1-q(1)^2) )*q(2:4);
end
end