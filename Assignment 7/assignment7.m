%Jenisha Thevarajah
%400473218

% Define toroid parameters
I_t = 5.0;
N_t = 200;
r_i = 1.5;
r_o = 2.5;


% number of points in each dimenstion to plot
nx = 25;
ny = 25;
XMinimum = -4;
XMaximum = 4;
YMinimum = -4;
YMaximum = 4;
dx = (XMaximum-XMinimum)/(nx-1);
dy = (YMaximum-YMinimum)/(ny-1);
[X, Y] = meshgrid(XMinimum:dx:XMaximum, YMinimum:dy:YMaximum);
Z = zeros(size(X));

% magnetic field at each point in observation plane
Bx = zeros(size(X));
By = zeros(size(X));
Bz = zeros(size(X));

% all of the points
for i = 1:numel(X)
   x = X(i);
   y = Y(i);
   r = sqrt(x^2 + y^2);


   
   if r >= r_i && r <= r_o
       B_Phi = (I_t*N_t)/(2*pi*r);
       Bx(i) = -B_Phi * sin(atan2(y, x));
       By(i) = B_Phi * cos(atan2(y, x));
   end
end


quiver(X, Y, Bx, By);
xlabel('x (cm)'); % Label x-axis
ylabel('y (cm)'); % Label y-axis

title('Set 16')