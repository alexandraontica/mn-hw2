function [S f t] = spectrogram(signal, fs, window_size)
  % compute the steps described in the assignment:
	% S = 0;
  % f = 0;
  % t = 0;

  num_win = floor(length(signal) / window_size);

  S = zeros(window_size, num_win);

  for i = 1 : num_win
    % get the current window:
    win_start = (i - 1) * window_size + 1;
    win_end = win_start + window_size - 1;

    if win_end > length(signal)
      break;
    endif

    window = signal(win_start : win_end);

    % apply the Hann function:
    window = window .* hanning(window_size);

    % Fourier transform:
    win_fft = fft(window, 2 * window_size);

    % discard the second part:
    win_fft = win_fft(1 : window_size);

    % store the result in S:
    S(:, i) = abs(win_fft);
  endfor

  % compute the frequency vector:
  f = (0 : window_size - 1) * fs / (2 * window_size);
  f = f';

  % compute the time vector:
  interval = window_size / fs;
  t = (0 : num_win - 1) * interval;
  t = t';
endfunction
