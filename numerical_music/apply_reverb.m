function signal = apply_reverb(signal, impulse_response)
  % DE ADAUGAT COMENTARII
  impulse_mono = stereo_to_mono(impulse_response);
  signal = fftconv(signal, impulse_mono);
  signal = signal / max(abs(signal));
endfunction
