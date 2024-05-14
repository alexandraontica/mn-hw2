function mono = stereo_to_mono(stereo)
  % implement the given formula: 
  % compute the mean for each row in the matrix
  mono = mean(stereo, 2);

  % Normalize
  mono = mono / max(abs(mono));
endfunction
