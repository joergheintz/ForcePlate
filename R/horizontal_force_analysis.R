horizontal_force_analysis = function(data = "df", cutfreq = 8, lost.records = 5, filter = TRUE, centering = TRUE, statistic = F){
      var = c( "DP", "L.Fx", "L.Fy", "R.Fx", "R.Fy")
      hrz.frcs = data[, var]

      # Centering, subtracting mean
      if (centering == TRUE) hrz.frcs[, var[-1]] = apply(hrz.frcs[, var[-1]],2, function(x) x - mean(x))

      # Butterworth filter TRUE/FALSE
      if (filter == TRUE) { hrz.frcs[, var[-1]] = apply(hrz.frcs[, var[-1]],2, function(x) butterworth_filter(x = x, cut.freq = cutfreq))
      hrz.frcs[hrz.frcs$DP < lost.records+1 | hrz.frcs$DP > length(hrz.frcs$DP)-(lost.records), var[-1] ] = NA
      }

      # Building sum of horizontal forces y-direction = AP, x-direction = ML
      hrz.frcs$Sum.Fy = hrz.frcs$L.Fy + hrz.frcs$R.Fy # anterior posterior
      hrz.frcs$Sum.Fx = hrz.frcs$L.Fx + hrz.frcs$R.Fx # medial lateral

      # Introduce indicator when horizontal force = 0, Sum of forces of rigth & left foot  Fy, Fx and individual
      ## Anterior Posterior
            hrz.frcs$Sum.Fy.sgn.chnge = c(NA, abs(diff(sign(hrz.frcs$Sum.Fy))/2))
            hrz.frcs$L.Fy.sgn.chnge = c(NA, abs(diff(sign(hrz.frcs$L.Fy))/2))
            hrz.frcs$R.Fy.sgn.chnge = c(NA, abs(diff(sign(hrz.frcs$R.Fy))/2))

      ## Medial Lateral
            hrz.frcs$Sum.Fx.sgn.chnge = c(NA, abs(diff(sign(hrz.frcs$Sum.Fx))/2))
            hrz.frcs$L.Fx.sgn.chnge = c(NA, abs(diff(sign(hrz.frcs$L.Fx))/2))
            hrz.frcs$R.Fx.sgn.chnge = c(NA, abs(diff(sign(hrz.frcs$R.Fx))/2))

      # Statistic Horizontal Forces = 0
            stat = data.frame(as.list(apply(hrz.frcs[, grepl("sgn.chnge", colnames(hrz.frcs))], 2, sum, na.rm = TRUE)))
      # output
      if (statistic == F)
            return(hrz.frcs)
      else
            return(stat)
}
