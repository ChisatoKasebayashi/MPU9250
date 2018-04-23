data = load('log/imu_exp03.log');
gyro = data(:, 4:6);
Hz = 80;
delta_t = 1/Hz;
u = [0,0,0];
deg = [];
f_skip = 10;
for i=1:length(data)
    %disp(MakeQuaternion(u));
    q = QuaternionMultiply(MakeQuaternion(u), MakeQuaternion(gyro(i,:) * delta_t));
    if rem(i,f_skip) == 0
        plotQuaternion(q);
    end
    u = Quaternion2RotationVector(q);
    deg = [deg; u];
end
figure
t = 0:1/Hz: (length(data)-1)*1/Hz;
plot(t,[gyro(:,1)';gyro(:,2)';gyro(:,3)'],'lineWidth',2)
legend('x','y','z')
title('Gyro','FontSize',16)