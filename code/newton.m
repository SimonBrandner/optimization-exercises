function approximation = newton(f, f_derivative, approximation, delta_max)
	delta = Inf;
	while delta > delta_max
		h  = f_derivative(approximation) \ f(approximation);
		new_approximation = approximation - h;
		delta = norm(approximation - new_approximation);
		approximation = new_approximation
	end
end
