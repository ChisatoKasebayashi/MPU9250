function F = plotQuaternion( q )
    figure(9);
    clf;
    hold on;
    origin = [0, 0, 0, 0];
    qX = QuaternionMultiply(QuaternionMultiply(q, [0;1;0;0]), QuaternionInverse(q) );
    qY = QuaternionMultiply(QuaternionMultiply(q, [0;0;1;0]), QuaternionInverse(q) );
    qZ = QuaternionMultiply(QuaternionMultiply(q, [0;0;0;1]), QuaternionInverse(q) );
    x = [origin; qX']';
    y = [origin; qY']';
    z = [origin; qZ']';
%    disp(x(2,:));
%    disp(y(3,:));
%    disp(z(4,:));
    plot3(x(2,:),x(3,:),x(4,:),'LineWidth',5)
    plot3(y(2,:),y(3,:),y(4,:),'LineWidth',5)
    plot3(z(2,:),z(3,:),z(4,:),'LineWidth',5)
    legend('x','y','z')
    grid on;
    view([2,1,1])
    xlabel('x');
    ylabel('y');
    zlabel('z');
    xlim([-1,1])
    ylim([-1,1])
    zlim([-1,1])
    pause(0.001);
    hold off;
end