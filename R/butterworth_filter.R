butter_filter = function(x, order = 4, tp = 'low', fs = 100, cut.freq = 8 ){
      # order = order of butterworth filter
      # tp = low pass filter
      # fs = sample frequency
      # nfs = nyquist frequence
      nfs = fs/2 # nyquist frequence, sampling rate divided by 2
      W.b = cut.freq / nfs # cut.off frequency divided by
      # nyqust frequencey, must be between 0-1

      # filter
      bf = signal::butter(n = order, W = W.b, type = tp)
      out = signal::filtfilt(bf, x)
      out
}
