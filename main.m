data = load('log/imu_exp03.log');
gyro = data(:, 4:6);
accel = data(:, 1:3);
Hz = 80;
delta_t = 1/Hz;
u = [0,0,0];
u_vecs = [];
b = [0 0 0 0];
q_mad = [0;0;0;0];
beta = sqrt(3/4)*pi*(5.0/180.0);

f_skip = 20;
for i=1:length(data)
    %disp(MakeQuaternion(u));
    qu = MakeQuaternion(u);
    qwt = MakeQuaternion( gyro(i,:)*delta_t );
    q = QuaternionMultiply(qu, qwt);
    q_dot = ;
    %%% Madgwick %%%
    a_norm = accel(i,:) / norm(accel(i,:));
    Jg = calcJg(q);
    fg = calcFg(q,a_norm);
    %Jb = zeros(3,4);
    %fb = zeros(3,1);
    %Jgb = [Jg ;Jb];
    %fgb = [fg' ;fb'];
    deltaF = Jg' * fg;
    q_mad = q_mad - (beta*deltaF/norm(deltaF));
    %%%%%%%%%%%%%%%%
    if rem(i,f_skip) == 0
        plotQuaternion(q);
    end
    u = Quaternion2RotationVector(q_mad);
    u_vecs = [u_vecs; u];
end
figure
t = 0:1/Hz: (length(data)-1)*1/Hz;
plot(t,[gyro(:,1)';gyro(:,2)';gyro(:,3)'],'lineWidth',2)
legend('x','y','z')
title('Gyro','FontSize',16)