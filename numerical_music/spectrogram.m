function [S f t] = spectrogram(signal, fs, window_size)
  % see comments on the result in the README.md file
	% S = 0;
  % f = 0;
  % t = 0;

  % DE ADAUGAT COMENTARII
  num_win = floor(length(signal) / window_size);

  S = zeros(window_size, num_win);

  f = (0 : window_size - 1) * fs / (2 * window_size);
  f = f';

  interval = window_size / fs;
  t = (0 : num_win - 1) * interval;
  t = t';

  for i = 1 : num_win
    win_start = (i - 1) * window_size + 1;
    win_end = win_start + window_size - 1;

    if win_end > length(signal)
      break;
    endif

    window = signal(win_start : win_end);
    window = window .* hanning(window_size);
    win_fft = fft(window, 2 * window_size);
    win_fft = win_fft(1 : window_size);
    S(:, i) = abs(win_fft);
  endfor
endfunction
