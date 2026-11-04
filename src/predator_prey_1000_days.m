% Predator-prey model with linear harvesting, 1000-day simulation and phase plane.
% Listing from the report's appendix.
% Define the parameters
alpha = 0.7;
K = 100;
mu = 0.75;
beta = 0.3;
gamma = 0.03;
epsilon = 0.4;

%Define the three different harvesting strategies
%hv_1 = b;
%hv_2 = epsilon*y(2); 
%hv_3 = epsilon*y(2)/(1+b*y(2));

% Define the system of differential equations
ode = @(t, y) [alpha*(1 - y(1)/K)*y(1) - mu*y(1)*y(2); beta*y(1)*y(2) - y(2)*gamma - epsilon*y(2)];

% Set the initial conditions
initial_conditions = [1; 2];

% Solve the system numerically using ode45
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-9);
[t, y] = ode45(ode, [0,1000], initial_conditions, options);

% Plot the results
figure;
plot(t, y(:, 1), 'LineWidth', 2, 'DisplayName', 'prey');
hold on;
plot(t, y(:, 2), 'LineWidth', 2, 'DisplayName', 'predator');
xlabel('Time [days]');
ylabel('Population [population/km^2]');
legend();

figure;
plot(y(:,1),y(:,2));
hold on
grid on 
y1 = linspace(-2,6,22);
y2 = linspace(-1,5,22);
[x,y] = meshgrid(y1,y2);
u = zeros(size(x));
v = zeros(size(x));
t=0;
for i = 1:numel(x)
    % Calculating gradient value for a and b
    Yprime = ode(t,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end
quiver(x,y,u,v,'AutoScale',10);
hold on
title('Phase Plane Plot');
xlabel('Prey Density [prey population/km^2]');
ylabel('Predator Density [predator population/km^2]');

