function x = oscillator(freq, fs, dur, A, D, S, R)
  % x = 0;
  t = (0 : 1 / fs : dur);
  t = t';
   
  sine_wave = sin(2 * pi * freq * t);
   
  num_samples = length(t);
  attack_samples = floor(A * fs);
  decay_samples = floor(D * fs);
  sustain_samples = num_samples - attack_samples - decay_samples - floor(R * fs);
  release_samples = num_samples - attack_samples - decay_samples - sustain_samples;
    
  attack_envelope = linspace(0, 1, attack_samples)';
   
  decay_envelope = linspace(1, S, decay_samples)';
    
  sustain_envelope = S * ones(sustain_samples, 1);
    
  release_envelope = linspace(S, 0, release_samples)';
    
  envelope_signal = [attack_envelope; decay_envelope; sustain_envelope; release_envelope];
    
  x = sine_wave .* envelope_signal;
endfunction

