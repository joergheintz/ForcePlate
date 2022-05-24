derive = function(y,t ){
      t = as.numeric(t)
      y = as.numeric(y)

      # dt
      dt = t[-1] - t[-length(t)]

      # calc dx, v
      dy = y[-1] - y[-length(y)]
      v = dy/dt

      # calc a
      dv = v[-1] - v[-length(v)]
      dv = as.numeric(c(0,dv))
      a = dv /dt

      # constract data.frame
      out = data.frame(
            t = t,
            y = y,
            v = as.numeric(c(0, v)),
            a = as.numeric(c(0, a))
      )

      return(out)
}
