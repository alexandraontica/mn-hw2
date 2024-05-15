function x = oscillator(freq, fs, dur, A, D, S, R)
  % x = 0;

  % DE PUS COMENTARII
  % format long g;

  t = (0 : 1 / fs : dur);
  t = t';
   
  sine_wave = sin(2 * pi * freq * t);
   
  num_samp = length(t);
  a_samp = floor(A * fs);
  d_samp = floor(D * fs);
  r_samp = floor(R * fs);
  s_samp = num_samp - a_samp - d_samp - r_samp;

  a_env = linspace(0, 1, a_samp);
  a_env = a_env';
   
  d_env = linspace(1, S, d_samp);
  d_env = d_env';
    
  s_env = S * ones(s_samp, 1);
    
  r_env = linspace(S, 0, r_samp);
  r_env = r_env';
    
  adsr_env = [a_env; d_env; s_env; r_env];
    
  x = sine_wave .* adsr_env;
  x = x(1 : length(x) - 1); % x had an extra 0 at the end
endfunction
