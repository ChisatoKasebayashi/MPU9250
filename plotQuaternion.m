function F = plotQuaternion( qX,qY,qZ )
    figure(9);
    clf;
    hold on;
    
    origin = [0, 0, 0, 0];
    %{
    norm = sqrt(sum(q(2:4).^2));
    q_normal = q / norm;
    q_normal(1) = q(1);
    %disp(sum(q_normal(2:4).^2))
    qX = QuaternionMultiply(QuaternionMultiply(q_normal, [0;1;0;0]), QuaternionInverse(q_normal) );
    qY = QuaternionMultiply(QuaternionMultiply(q_normal, [0;0;1;0]), QuaternionInverse(q_normal) );
    qZ = QuaternionMultiply(QuaternionMultiply(q_normal, [0;0;0;1]), QuaternionInverse(q_normal) );
    %}
    x = [origin; qX']';
    y = [origin; qY']';
    z = [origin; qZ']';
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