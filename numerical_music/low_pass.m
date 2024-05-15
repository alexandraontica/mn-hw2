function signal = low_pass(signal, fs, cutoff_freq)
  % signal = 0;
  signal_fft = fft(signal);

  n = length(signal);

  % compute all possible frequencies:
  f = (0 : n - 1) * fs / n;
  f = f';

  % filter the signal:
  mask = f < cutoff_freq;
  signal_mask = signal_fft .* mask;
  signal = ifft(signal_mask);
  
  signal = signal / max(abs(signal));
endfunction
