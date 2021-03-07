initial_V = 139;
height = 5454;
g = -9.81;
b = 0.05;
u = 69.5;
dt = 2;
i = [0];
angleX = [randi([-359 360], 1, 1)];
angleY = [randi([-359 360], 1, 1)];
angleZ = [randi([0, 180], 1, 1)];
width = 50;
r = linspace(0, height) ;
th = linspace(-width,width) ;
[R,T] = meshgrid(r,th) ;
X = R.*cos(T) ;
Y = R.*sin(T) ;
Z = -R ;
surf(X,Y,Z)

while 1 > 0
    r = randi([0 3], 1, 1);
    if r == 1
        i(end+1) = 0;
        angleX(end+1) = randi([0 360], 1, 1);
        angleY(end+1) = randi([0 360], 1, 1);
        angleZ(end+1) = randi([0 180], 1, 1);
    end
    for p = 1:length(i)
        if height + initial_V * sin(deg2rad(angleZ(p))) * i(p) + 0.5 * g * i(p) ^ 2 >= 0
            hold on
            plot3(initial_V*cos(deg2rad(angleX(p)))*i(p), initial_V*cos(deg2rad(angleY(p)))*i(p), initial_V * sin(deg2rad(angleZ(p))) * i(p) + 0.5 * g * i(p) ^ 2, 'r.')
            i(p) = i(p) + dt;
            axis([-height-500 height+500 -height-500 height+500 -height 1000])
            hold off
        end
        pause(0.1)
    end
end
