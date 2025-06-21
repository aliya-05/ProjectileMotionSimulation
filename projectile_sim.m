% Coordinates of launching area (A)

x = input('Enter x-coordinate of launching area (A): ');
while isempty(x) || ~isnumeric(x) || x < 0
    disp('Invalid input. Please enter a positive number.');
    x = input('Enter x-coordinate of launching area (A): ');
end

y = input('Enter y-coordinate of launching area (A): ');
while isempty(y) || ~isnumeric(y) || y < 0
    disp('Invalid input. Please enter a positive number.');
    y = input('Enter y-coordinate of launching area (A): ');
end

z = input('Enter z-coordinate of launching area (A): ');
while isempty(z) || ~isnumeric(z) || z < 0
    disp('Invalid input. Please enter a positive number.');
    z = input('Enter z-coordinate of launching area (A): ');
end

H = input('Enter height of the building (H): ');
while isempty(H) || ~isnumeric(H) || H < 0
    disp('Invalid input. Please enter a positive number.');
    H = input('Enter height of the building (H): ');
end

% Fixed coordinates of landing point (B)
x_B = -10;
y_B = -5;
z_B = 0;

% Constant acceleration due to gravity (m/s^2)
g = 9.81;

% Horizontal distance from A to B
R = sqrt((x - x_B)^2 + (y - y_B)^2);

% Horizontal distance from A to building at (0,0)
S = sqrt(x^2 + y^2);

% Check if A and B have a location overlap 
if R == 0
    disp('Error: Launch and landing points are the same.');
    return;
end

% Check if A and building coordinates have a location overlap 
if S == 0
    disp('Error: Launch and building coordinates are the same.');
    return;
end

% Variables to store best angles and velocities 
alpha_min = 1000;
alpha_max = 0;
v_min = 0;
v_max = 0;

% Loop over angles from 1 to 89 degrees 
for alpha = 1:0.1:89
    alpha_rad = deg2rad(alpha);

    % Corrected velocity formula
    denominator = 2 * (cos(alpha_rad))^2 * (R * tan(alpha_rad) + z);
    if denominator <= 0
        continue;
    end
    v = sqrt((g * R^2) / denominator);

    % Time to reach the building horizontally
    t2 = S / (v * cos(alpha_rad));

    % Height of object when it passes over the building
    zmax = z + v * sin(alpha_rad) * t2 - 0.5 * g * t2^2;

    % Update min and max angles
    if zmax > H
        if alpha < alpha_min
            alpha_min = alpha;
            v_min = v;
        end
        if alpha > alpha_max
            alpha_max = alpha;
            v_max = v;
        end
    end
end

% Display results
if alpha_min == 1000
    disp('No feasible angle found to clear the building.');
    return;
else
    fprintf('Minimum angle: %.2f degrees\n', alpha_min);
    fprintf('Corresponding velocity: %.2f m/s\n', v_min);
    fprintf('Maximum angle: %.2f degrees\n', alpha_max);
    fprintf('Corresponding velocity: %.2f m/s\n', v_max);
end

% Prompt user to choose an angle within the valid range
fprintf('\nValid angle range: %.2f° to %.2f°\n', alpha_min, alpha_max);
user_angle = input('Enter a launch angle within this range: ');

while isempty(user_angle) || ~isnumeric(user_angle) || user_angle < (alpha_min - 0.01) || user_angle > (alpha_max + 0.01)
    disp('Invalid angle. Please choose a value within the valid range.');
    user_angle = input('Enter a launch angle within this range: ');
end

% Convert angle to radians
user_angle_rad = deg2rad(user_angle);

% Calculate velocity for chosen angle
denominator_user = 2 * (cos(user_angle_rad))^2 * (R * tan(user_angle_rad) + z);
if denominator_user <= 0
    disp('Chosen angle does not result in a valid velocity.');
    return;
end
V_user = sqrt((g * R^2) / denominator_user);

% Check if the projectile clears the building
t_building = S / (V_user * cos(user_angle_rad));
z_building = z + V_user * sin(user_angle_rad) * t_building - 0.5 * g * t_building^2;

if z_building <= H
    disp('Calculated velocity does not clear the building.');
    return;
end

% Display chosen values
fprintf('\nChosen angle: %.2f degrees\n', user_angle);
fprintf('Calculated velocity: %.2f m/s\n', V_user);

% Plot trajectory
t_total = R / (V_user * cos(user_angle_rad));
t = linspace(0, t_total, 100);
z_t = z + V_user * sin(user_angle_rad) * t - 0.5 * g * t.^2;

figure;
plot(t, z_t, 'b', 'LineWidth', 2);
xlim([0 max(t)]);
ylim([0 max(z_t) + 5]);
xlabel('Time (s)');
ylabel('Height (m)');
title(sprintf('Projectile Height vs Time (Angle: %.2f°)', user_angle));
grid on;
hold on;

% Building marker 
% Building location on graph
line([t_building t_building], [0 H], 'Color', 'g', 'LineStyle', '-', 'LineWidth', 5);
text(t_building + 0.05, H, 'Building');
