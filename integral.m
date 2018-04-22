data = load('log/imu_exp01.log');
gyro = data(:, 4:6);
Hz = 80;
delta_t = 1/Hz;
u = [0,0,0];
deg = [];
qX = [];
qY = [];
qZ = [];

f_skip = 10;
for i=1:length(data)
    %disp(MakeQuaternion(u));
    q = QuaternionMultiply(MakeQuaternion(u), MakeQuaternion(gyro(i,:) * delta_t));
    %if rem(i,f_skip) == 0
        norm = sqrt(sum(q(2:4).^2));
        q_normal = q / norm;
        q_normal(1) = q(1);
        if i == 1
            qX = QuaternionMultiply(QuaternionMultiply(q_normal, [0;1;0;0]), QuaternionInverse(q_normal) );
            qY = QuaternionMultiply(QuaternionMultiply(q_normal, [0;0;1;0]), QuaternionInverse(q_normal) );
            qZ = QuaternionMultiply(QuaternionMultiply(q_normal, [0;0;0;1]), QuaternionInverse(q_normal) );
        else
            qX = QuaternionMultiply(QuaternionMultiply(q_normal, qX), QuaternionInverse(q_normal) );
            qY = QuaternionMultiply(QuaternionMultiply(q_normal, qY), QuaternionInverse(q_normal) );
            qZ = QuaternionMultiply(QuaternionMultiply(q_normal, qZ), QuaternionInverse(q_normal) );
        end
        plotQuaternion(qX,qY,qZ); 
    %end
    u = Quaternion2RotationVector(q);
    deg = [deg; u];
end

figure
t = 0:1/Hz: (length(data)-1)*1/Hz;
plot(t,[gyro(:,1)';gyro(:,2)';gyro(:,3)'],'lineWidth',2)
legend('x','y','z','FontSize',16)
title('Gyro','FontSize',16)
figure
t = 0:1/Hz: (length(data)-2)*1/Hz;
plot(t,[deg(:,1)';deg(:,2)';deg(:,3)'],'lineWidth',2)
legend('x','y','z','FontSize',16)
title('Pose(INTEGRAL)','FontSize',16)