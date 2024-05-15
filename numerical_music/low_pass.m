function signal = low_pass(signal, fs, cutoff_freq)
  % signal = 0;
  x_fft = fft(signal);

  n = length(signal);
  f = (0 : n - 1) .* (fs ./ n);
  f = f';

  mask = f < cutoff_freq;
  x_filtered = x_fft .* mask;

  signal = ifft(x_filtered);
  signal = signal / max(abs(signal));
endfunction
