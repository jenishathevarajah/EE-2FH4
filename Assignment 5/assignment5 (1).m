%Jenisha Thevarajah
%400473218

e = 1e-9/(36*pi); 
Ps = 2e-6; 

r_upper = 3.0; 
theta_upper = pi; 
phi_upper = (2*pi); 

r_lower = 2.0; 
theta_lower = 0; 
phi_lower = 0; 

num_of_r_steps = 50; 
dr = (r_upper-r_lower)/num_of_r_steps; %r increment

num_of_phi_steps = 50; 
dphi = (phi_upper-phi_lower)/num_of_phi_steps; %phi increment

num_of_theta_steps = 50; 
dtheta = (theta_upper-theta_lower)/num_of_theta_steps; %theta increment

WE = 0; 

for k=1:num_of_phi_steps
    for j=1:num_of_theta_steps
        for i=1:num_of_r_steps
            r = r_lower+0.5*dr+(i-1)*dr; 
            theta = theta_lower+0.5*dtheta+(j-1)*dtheta;
            phi = phi_lower+0.5*dphi+(k-1)*dphi;

            eMag = (Ps)/(e*r^2);
            dV = r^2*sin(theta)*dr*dtheta*dphi;
            dWE = 0.5*e*eMag*eMag*dV;

            WE = WE+dWE; 
        end 
    end 
end 

disp("Electric Energy: ");
disp(WE);