%Excercise 1
R1 = [1 2 3];
R2 = [3 2 1];

%A) Dot Product
dotr1r2 = dot(R1,R2);
disp('Dot Product between R1 and R2: ');
disp(dotr1r2);

% B) Projection of R1 on R2
%Unit vector in direction of R2
ar2 = (R2)/(norm(R2));
%Inner product of unit vector R2 and R1
R1r2 = dot(R1,ar2)*ar2;
disp('Projection of R1 on R2 is: ');
disp(R1r2);

% C) Angle between R1 and R2
angler1r2 = acos((dotr1r2)/((norm(R1)*norm(R2))));
%Converting to degrees
angler1r2 = (angler1r2*180)/pi;
disp('Angle between R1 and R2 is: ');
disp(angler1r2);
