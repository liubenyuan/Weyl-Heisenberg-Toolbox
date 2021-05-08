%% Weyl-Heisenberg Toolbox
% Script "gb_plot.m"
%% Description:
% Implements the construction of Gabor basis, and also 
% plots graphs of the frequency response and the impulse response.
%
%% Notation:
% As a matrix of the Weyl-Heisenberg optimal basis can also be used one 
% of various other products methods of orthogonalization (eigenvalue 
% decomposition, Gram-Schmidt process, fast algorithm).
% 
% Rectangular complex matrices: "gabor", "weylhz", "weylhzf", "weylhzg".
% Square real matrices: "gaborr", "weylhzr".
% Square complex matrices: "gaborc", "weylhzc".
%
%% Input
M     = input('Number of frequency shifts M = ');
L     = input('Number of time shifts L = ');
sigma = input('Standard deviation = ');
a     = phaseparam(M, L);
index = input('Function index [1, N] = ');
N = M * L;

%% Bases construction
% Construction of the Gabor basis:
G = gabor(M, L, a, sigma); % Gabor matrix

%% Plotting
figure(1);
set(0,'DefaultTextFontSize',11,'DefaultTextFontName','Times New Roman'); 
set(0,'DefaultAxesFontSize',11,'DefaultAxesFontName','Times New Roman'); 

% Time domain
TP0 = abs(G);
subplot(2,1,1);
hold on;
plot(TP0(:,mod(index+M/2,N)),'k--','linewidth',2);
legend('Gabor basis');
grid on;
title('Time domain');
ylabel('Amplitude');
xlabel('Samples, n');
hold off;

% Frequency domain
SP0 = abs(fft(G));
subplot(2,1,2);
hold on;
plot(SP0(:,mod(index+M/2,N)),'k--','linewidth',2);
legend('Gabor basis');
grid on;
title('Frequency domain');
ylabel('Amplitude');
xlabel('Samples, n');
hold off;