


%initalize
Epsilono=8.854e-12;
D=2e-6; 
P=[0 0 1]; 
E=zeros(1,3); 


%initialize discretization
Number_of_rho_Steps=100;
Number_of_phi_Steps=100;


rho_lower=0; %the lower boundary of rho
rho_upper=1; %the upper boundary of rho
phi_lower=0; %the lower boundary of phi
phi_upper=2*pi; %the upper boundary of phi


drho=(rho_upper- rho_lower)/Number_of_rho_Steps; 
dphi=(phi_upper- phi_lower)/Number_of_phi_Steps; 

ds=drho*dphi;
dQ=D*ds; 


for j=1: Number_of_phi_Steps
for i=1: Number_of_rho_Steps
rho = rho_lower + drho/2 + (i-1) * drho; % Rho component of the center of a grid
phi = phi_lower + dphi/2 + (j-1) * dphi; % Phi component of the center of a grid
R = P - [rho * cos(phi), rho * sin(phi), 0]; % Vector from the center of the grid to the observation point
RMag = norm(R); % Magnitude of vector R
ds = drho * rho * dphi; % Area of a single grid
dQ = D * ds; % Charge on a single grid
E = E + (dQ / (4 * pi * Epsilono * RMag^3)) * R; % Contribution to the electric field
end
end

disp(E);