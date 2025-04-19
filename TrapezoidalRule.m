% Do not edit this part
% It reads the matrix from the excel file and creates your x and y arrays
% a = readmatrix('problem1.mat');
% x = a(:,1);
% y = a(:,2);
% Write your code for the trapezoidal rule for non-uniform data here
%---------------------------------------------------------------------------------------------
load('problem1.mat')

for i = 1:1250
    
   dI(i) =  (x(i+1)-x(i)).*((y(i+1)+y(i))./2);
    
end

Itotal = sum(dI);

%--------------------------------------------------------------------------------------------
%At the end of your code, you should write out the total value of the
%integral, then copy/paste this solution into your submission document.
disp(Itotal)
disp(char(java.lang.System.getProperty('user.name'))) % leave this line, proves your work
disp(char(java.net.InetAddress.getLocalHost.getHostName)) % leave this line, proves your work