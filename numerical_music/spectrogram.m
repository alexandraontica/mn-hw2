function [S f t] = spectrogram(signal, fs, window_size)
  % see comments on the result in the README.md file
	% S = 0;
  % f = 0;
  % t = 0;

  % DE MODIFICAT
  num_windows = floor(length(signal) / window_size);

  S = zeros(window_size, num_windows);

  % Compute frequency vector
  f = (0 : window_size - 1) * fs / (2 * window_size);
  f = f';

  % Compute time vector
  time_between_windows = window_size / fs;
  t = (0 : num_windows - 1) * time_between_windows;
  t = t';

  for i = 1 : num_windows
    window_start = (i - 1) * window_size + 1;
    window_end = window_start + window_size - 1;

    % Check if window_end exceeds signal length
    if window_end > length(signal)
      break;
    endif

    window = signal(window_start:window_end);

    % Apply Hann window
    window = window .* hanning(window_size);

    % Compute Fourier Transform (FFT) of the window
    window_fft = fft(window, 2 * window_size);

    % Keep only the positive frequencies (first half)
    window_fft = window_fft(1 : window_size)
    abs(window_fft)

    % Store magnitude of the FFT in the spectrogram matrix
    S(:, i) = abs(window_fft); % Store magnitude (or use abs for complex)
  endfor
endfunction
