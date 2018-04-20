data = load('log/imu_exp03.log');
gyro = data(:, 4:6);
Hz = 80;
delta_t = 1/Hz;
u = [0,0,0];

for i=1:length(data)
    q = QuaternionMultiply(MakeQuaternion(u), MakeQuaternion(gyro(i,:) * delta_t));
    u = Quaternion2RotaionVector(q);
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