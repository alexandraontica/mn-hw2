function signal = apply_reverb(signal, impulse_response)
  % DE MODIFICAT
  impulse_response_mono = stereo_to_mono(impulse_response);
  signal = fftconv(signal, impulse_response_mono);
  signal = signal / max(abs(signal));
endfunction
