% Do not edit this part
% It reads the matrix from the excel file and creates your x and y arrays

% a = readmatrix('problem2.csv');
% x = a(:,1);
% y = a(:,2);
%--------------------------------------------------------------------------
% Calculate the tabled values (and their sum) that we will use in the
% matrix 
load('problem2.mat')
xSquared = x.^2;
xCubed = x.^3;
x4thOrder = x.^4;
ySum = sum(y);
yxSum = sum(x.*y);
yx2Sum = sum(xSquared.*y);
N = length(x); % determine number of points used 

% Matrix setup for MLS:
A = [N,sum(x),sum(xSquared); sum(x) sum(xSquared), sum(xCubed);
     sum(xSquared), sum(xCubed), sum(x4thOrder)]; % Matrix of X-values (based on formula in class)
B = [ySum; yxSum; yx2Sum]; % Matrix of Y-values 
augmentedA = [A,B]; % Augmented matrix needed for performing Gauss-Jordan 

[m, n] = size(augmentedA); % obtain dimensions needed in the loop

% Gauss-Jordan Elimination loop 
for i = 1:min(m, n-1)  % Only go up to the second-to-last column
   
    % Find the pivot in the current column
    [~, pivot_row] = max( abs(augmentedA(i:m, i)) );
    pivot_row = pivot_row + i - 1;

    % Row/Pivot swapping
    if pivot_row ~= i
        temp = augmentedA(i, :);
        augmentedA(i, :) = augmentedA(pivot_row, :);
        augmentedA(pivot_row, :) = temp;
    end

    % Dives pivot rows
    augmentedA(i, :) = augmentedA(i, :) / augmentedA(i, i);

    % Eliminate the other rows
    for j = 1:m
        
        if j ~= i
            
            augmentedA(j, :) = augmentedA(j, :) - augmentedA(j, i) * augmentedA(i, :);
        
        end
        
    end
    
end

% places solved coefficients of the polynomial into an array
c = [augmentedA(1,4), augmentedA(2,4), augmentedA(3,4)] % [c0, c1, c2]

plot(x,y,'o') % plots the original data, do not edit
hold
plot(x,c(1)+c(2).*x+c(3)*x.^2,'LineWidth',2) % edit if needed
legend('Given data','Fit polynomial') % leave this line
text(.1,70,char(java.lang.System.getProperty('user.name'))) % leave this line, proves your work
text(.1,65,char(java.net.InetAddress.getLocalHost.getHostName)) % leave this line, proves your work