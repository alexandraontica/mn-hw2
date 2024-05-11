function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

	n = length(x) - 1; % [x0, x1, ..., xn] - there are n + 1 elements
	A = zeros(4 * n, 4 * n);
	b = zeros(4 * n, 1);

	% TODO 1: si(xi) = yi, i = 0 : n - 1
	% the equations are equivalent with ai = yi, i = 1 : n
	for i = 1 : n
		A(i, 4 * (i - 1) + 1) = 1;
		b(i) = y(i);
	endfor

	% TODO 2: s_n-1(xn) = yn
	b(n + 1) = y(n + 1);
	A(n + 1, 4 * n - 3) = 1; % an's coefficient in the equation
	
	temp = x(n + 1) - x(n);
	A(n + 1, 4 * n - 2) = temp; % bn's coefficient in the equation
	A(n + 1, 4 * n - 1) = temp * temp; % cn's coefficient in the equation
	A(n + 1, 4 * n) = temp * temp * temp; % dn's coefficient in the equation

	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
	% the equations are equivalent with si(x_i+1) - a_i+1 = 0
	for i = 1 : n - 1
		temp = x(i + 1) - x(i);
		A(n + i + 1, 4 * i - 3) = 1; % ai's coefficient in the equation
		A(n + i + 1, 4 * i - 2) = temp; % bi's coefficient in the equation
		A(n + i + 1, 4 * i - 1) = temp * temp; % ci's coefficient in the equation
		A(n + i + 1, 4 * i) = temp * temp * temp; % di's coefficient in the equation
		A(n + i + 1, 4 * i + 1) = -1; % a_i+1's coefficient in the equation
	endfor

	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
	% the equations are equivalent with si'(x_i+1) - b_i+1 = 0
	for i = 1 : n - 1
		temp = x(i + 1) - x(i);
		A(2 * n + i, 4 * i - 2) = 1; % bi's coefficient in the equation
		A(2 * n + i, 4 * i - 1) = 2 * temp; % ci's coefficient in the equation
		A(2 * n + i, 4 * i) = 3 * temp * temp; % di's coefficient in the equation
		A(2 * n + i, 4 * i + 2) = -1; % b_i+1's coefficient in the equation
	endfor

	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
	% the equations are equivalent with si''(x_i+1) - 2 * c_i+1 = 0
	for i = 1 : n - 1
		temp = x(i + 1) - x(i);
		A(3 * n - 1+ i, 4 * i - 1) = 2; % ci's coefficient in the equation
		A(3 * n - 1+ i, 4 * i) = 6 * temp; % di's coefficient in the equation
		A(3 * n - 1+ i, 4 * i + 3) = -2; % c_i+1's coefficient in the equation
	endfor

	% TODO 6: s0''(x0) = 0
	A(4 * n - 1, 3) = 2; % c1's coefficient in the equation

	% TODO 7: s_n-1''(x_n) = 0
	A(4 * n, 4 * n - 1) = 2; % cn's coefficient in the equation
	A(4 * n, 4 * n) = 6 * (x(n + 1) - x(n)); % dn's coefficient in the equation

	% Solve the system of equations
	% A * coef = b
	coef = inv(A) * b;
end
