function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients
	m = length(x_interp);
	n = length(x) - 1;

	for i = 1 : m
		% x is sorted in order to form intervals [x_i, x_i+1] (x_i < x_i+1)
		% binary search:
		left = 1;
		right = n + 1;
		while (left <= right)
			mid = floor((left + right) / 2);
			if (x_interp(i) < x(mid))
				right = mid - 1;
			elseif (x_interp(i) > x(mid))
				left = mid + 1;
			else
				left = mid + 1;
				break;
			endif
		endwhile

		% if x_interp(i) isn't one of x's elements, left has the position of the
		% first element in x that is greater than x_interp(i)
	
		% calculate the position of the last element that is <= x_interp(i)
		% in order to find the interval x belogs to:
		j = left - 1;
		if (j == n + 1)
			j--;
		endif

		temp = x_interp(i) - x(j);

		% find the coefficients in the coef vector:
		aj = coef(4 * j - 3);
		bj = coef(4 * j - 2);
		cj = coef(4 * j - 1);
		dj = coef(4 * j);

		% compute the formula for sj:
		y_interp(i) = aj + bj * temp + cj * temp^2 + dj * temp^3;
	endfor
end
