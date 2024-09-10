
%intialize
V = 0; 

S1 = 0; 
S2 = 0; 
S3 = 0; 
S4 = 0;
S5 = 0; 

radius = 0; 
theta = pi/4; 
phi = pi/4; 

radius_discretization = 100; 
theta_discretization = 100; 
phi_discretization = 100; 

dradius = (2 - 0)/radius_discretization; %the radial increment
dtheta = (pi/2 - pi/4)/theta_discretization; %the theta increment
dphi = (pi/2 - pi/4)/phi_discretization; %the phi increment

% Calculates the volume of the enclosed surface
for k = 1:radius_discretization
   for j = 1:theta_discretization
       for i = 1:phi_discretization 
           dV = (radius^2) * sin(theta) * dradius * dtheta * dphi; % add contribution to the volume
           V = V + dV;
       end
       theta = theta + dtheta; % increment
   end
   radius = radius + dradius; % increment
   theta = pi/4; % reset theta
end


radius1 = 2; %radius of S1
for k = 1:theta_discretization
   for i = 1:phi_discretization
       S1 = S1 + (radius1^2) * sin(theta) * dphi * dtheta; 
   end
   theta = theta + dtheta;
end
%%the following routine calculates the area of S3 and S4
radius = 0; %reset radius to it's lower boundary
theta1 = pi/4;
theta2 = pi/2;


for j=1: radius_discretization
   for i=1: phi_discretization
       S4 = S4 + radius * sin(theta1) * dphi * dradius; %get contribution to the area of S4
       S3 = S3 + radius * sin(theta2) * dphi * dradius; %get contribution to the area of S3
   end
   radius = radius + dradius;
end

%%the following routing calculate the area of S2
radius = 0; %reset radial to it's lower boundary
for k=1:theta_discretization
   for j=1:radius_discretization
       S2 = S2 + radius * dtheta * dradius;%S2 area
   end
   radius = radius + dradius;
end

S5=S3;%area of S5 is equal to S3

%Total surface
S=S1+S2+S3+S4+S5;%the area of the closed surface and volume of closed surface
disp(['Volume of Surface: ' num2str(V)]);
disp(['Area of Closed Surface: ' num2str(S)]);

