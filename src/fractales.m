clear all; close all; clc

%% Fractales usando solamente la recta de los números reales.
f = @(x) x.^3-x;
df = @(x) 3*x.^2-1;
lims = [-2 2];
res = 100000;
fractalReal(f, df, lims, res);

%% Fractales usando números complejos.
lims = [-1 1 -1 1];
res = 1000;

%Pol 3
f = @(z) z.^3-1; 
df = @(z) 3*z.^2;
fractalNewton(f, df, lims, res);

% % Pol 4
% f = @(z) z.^4 - 1;
% df = @(z) 4*z.^3;
% fractalNewton(f, df, lims, res);
% 
% % Pol 5
% f = @(z) z.^5 - 1;
% df = @(z) 5*z.^4;
% fractalNewton(f, df, lims, res);
% 
% % Pol 6
% f = @(z) z.^6 - 1;
% df = @(z) 6*z.^5;
% fractalNewton(f, df, lims, res);
% 
% % Pol 7
% f = @(z) z.^7 - 1;
% df = @(z) 7*z.^6;
% fractalNewton(f, df, lims, res);
% 
% % Pol 8
% f = @(z) z.^8 - 1;
% df = @(z) 8*z.^7;
% fractalNewton(f, df, lims, res);
% 
% % Pol 9
% f = @(z) z.^9 - 1;
% df = @(z) 9*z.^8;
% fractalNewton(f, df, lims, res);
