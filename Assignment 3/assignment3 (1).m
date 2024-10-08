

Q1=8e-9;%charges on Q1
Q2=8e-9;%charges on Q2

pL=4e-9;%charge density of the line
Epsilono=8.8419e-12;%Permitivity of free space

P=[0 0 0];%coordinates of observation point
A=[0 1 1];%coordinates of Q1
B=[0 -1 1];%coordinates of Q2
C=[3.5 3.5 0];%coordinates of the center of the line charge

Number_of_L_Steps=100000;%the steps of L
R1=P-A; %the vector pointing from Q1 to the observation point
R2=P-B; %the vector pointing from Q2 to the observation point
R1Mag=norm(R1);%the magnitude of R1
R2Mag=norm(R2);%the magnitude of R1

E1=Q1/(4*pi*Epsilono*R1Mag^3)*R1;%the electric field generated by Q1
E2=Q2/(4*pi*Epsilono*R2Mag^3)*R2;%the electric field generated by Q2
%%the following routine calculates the electric field at the
%%observation point generated by the line charge
% the following routine calculates the electric field at the
% observation point generated by the line charge

D = norm(P-C); % the distance from the observation point to the center of the line
L = sqrt(98)*D; % the length of the line

length = sqrt(98);
dir_vec = [-7/sqrt(98) 7/sqrt(98) 0];

dL = length/Number_of_L_Steps;
dL_Vector = dL*dir_vec;

EL = [0 0 0]; % initialize the electric field generated by EL


C_segment = C - (Number_of_L_Steps/2 * dL_Vector - dL_Vector/2);% the center of the first segment


for i = 1:Number_of_L_Steps
   R = P - C_segment;
   RMag = norm(R); % the magnitude of the vector R
   EL = EL + dL * pL / (4 * pi * Epsilono * (RMag)^3) * R; % get contribution from each segment
   C_segment = C_segment + dL_Vector; % the center of the i-th segment
end

E = E1 + E2 + EL; % the electric field at P
disp('ETotal: ');
disp(E);
