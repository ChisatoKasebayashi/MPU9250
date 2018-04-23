function F = plotQuaternion( q )
    figure(9);
    clf;
    hold on;    
    origin = [0, 0, 0, 0];
    Px = [0 1 0 0];
    Py = [0 0 1 0];
    Pz = [0 0 0 1];
    Px = cross4(cross4(q,Px),QuaternionInverse(q));
    Py = cross4(cross4(q,Py),QuaternionInverse(q));
    Pz = cross4(cross4(q,Pz),QuaternionInverse(q));
    x = [origin ;Px']';
    y = [origin ;Py']';
    z = [origin ;Pz']';
    plot3(x(2,:),x(3,:),x(4,:),'LineWidth',5)
    plot3(y(2,:),y(3,:),y(4,:),'LineWidth',5)
    plot3(z(2,:),z(3,:),z(4,:),'LineWidth',5)
    legend('x','y','z')
    grid on;
    xlim([-1,1])
    ylim([-1,1])
    zlim([-1,1])
    view([2,1,1])
    pause(0.001);
    hold off;
end