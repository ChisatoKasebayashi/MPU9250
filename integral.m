data = load('log/imu_exp03.log');
gyro = data(:, 4:6);
Hz = 80;
rad = [0,0,0];
deg = [];

for i=2:length(data)
    rad = rad + ( 0.5 * (gyro(i-1,:) + gyro(i,:)) * 1/Hz ) ;
    deg = [deg ; rad2deg(rad)];
end

figure
t = 0:1/Hz: (length(data)-1)*1/Hz;
plot(t,[gyro(:,1)';gyro(:,2)';gyro(:,3)'],'lineWidth',2)
legend('x','y','z','FontSize',16)
title('Gyro','FontSize',16)
figure
t = 0:1/Hz: (length(data)-2)*1/Hz;
plot(t,[deg(:,1)';deg(:,2)';deg(:,3)'],'lineWidth',2)
legend('pitch','roll','yaw','FontSize',16)
title('Pose(INTEGRAL)','FontSize',16)