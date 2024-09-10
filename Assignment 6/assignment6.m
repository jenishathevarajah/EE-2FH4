%Jenisha Thevarajah 
%400473218

VOut=0;
V=100.0;


NumXPoints=50; 
NumYPoints=NumXPoints; 
NumUnknown=NumXPoints*NumYPoints; 

% matrix of coeffeicents
A=zeros(NumUnknown, NumUnknown);
b=zeros(NumUnknown,1);
i_line=(NumXPoints)/2;
j_line=(NumYPoints)/2;

% Equation count
EqCount=1;

% for all rows
for i=1:NumXPoints

    % for all columns
    for j=1:NumYPoints 
        if(i==i_line && j>=j_line)
            A(EqCount, EqCount)=1;
            b(EqCount,1)=V;  
        elseif(i<i_line) && (j==NumYPoints)
            A(EqCount, EqCount)=1;
            b(EqCount,1)=50; 
            
        elseif(i>i_line) && (j==NumYPoints)
            A(EqCount, EqCount)=1;
            b(EqCount,1)=50; 
            
        else
            A(EqCount, EqCount)=-4;
            if(j==1) 
                b(EqCount)=b(EqCount)-VOut; 
            else
                A(EqCount,EqCount-1)=1.0;
            end
            if(j==NumYPoints) 
                b(EqCount,1)= b(EqCount,1)-50;
            else 
                A(EqCount, EqCount+1)=1.0;
            end
            if(i==1) 
                b(EqCount,1)=b(EqCount,1)-VOut;
            else 
                A(EqCount, EqCount-NumXPoints)=1;
            end
            if(i==NumXPoints) 
                b(EqCount,1)=b(EqCount,1)-VOut;
            else
                A(EqCount, EqCount+NumXPoints)=1.0;
            end
        end
        EqCount=EqCount+1;
    end
end


V=A\b; %obtain the vector of voltages
VSquare = reshape(V, NumXPoints, NumYPoints);%convert values into a rectangular matrix
ax1 = nexttile;
surf(VSquare); 
colormap(ax1,spring);
figure;
[C,h] = contour(VSquare);
set(h,'ShowText','on','TextStep',get(h,'LevelStep')*2)
colormap winter;
figure;
contour(VSquare);
[px,py] = gradient(VSquare);
hold on, quiver(-px,-py), hold off %obtain the electric field map by using E=-Gradient(V)
