#' Derivatives velocity and acceleration from distance

#' @param y = f(t)
#'
#' @param t = time parameter
#'
#' @return data.frame
#' @export
#'
#' @examples
#' time = 1:5
#' distance = (1:5)^2
#' derivatives(y = distance, t = time)
derivatives = function(t, y){

      t = as.numeric(t)
      y = as.numeric(y)


      # dt
      dt = t[-1] - t[-length(t)]
      dt = c(NA, dt)

      # calc dy/dt
      dy = y[-c(1,2)] - y[!(y %in% utils::tail(y,2))]
      v = dy/(2*dt[-c(1, length(dt))])
      v = c(NA, v, NA)

      # calc dy/dt.dt
      dy = y[-c(1,2)] - 2*y[-c(1, length(y))] + y[!(y %in% utils::tail(y,2))]
      a = dy/dt[-c(1,length(dt))]^2
      a = c(NA, a, NA)

      # constract data.frame
      out = data.frame(
            t = t,
            y = y,
            y. = as.numeric(v),
            y.. = as.numeric(a)
      )

      return(out)
}
