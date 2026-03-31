function approximation = iterate(f, approximation, delta_max)
	delta = Inf;
	while delta > delta_max
		new_approximation = f(approximation);
		delta = abs(approximation - new_approximation);
		approximation = new_approximation;
	end
end
