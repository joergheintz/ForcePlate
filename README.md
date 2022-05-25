
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ForcePlate

<!-- badges: start -->
<!-- badges: end -->

The goal of ForcePlate is to …

## Installation

You can install the development version of ForcePlate from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("joergheintz/ForcePlate")
```

Formula

![
\\begin{aligned}
\\dot{x_t} &= \\frac{x\_{t+1} - x\_{t-1}}{2 \\Delta t} \\\\
\\ddot{x_t} &= \\frac{x\_{t+1} - 2 x_t + x\_{t-1}}{2 \\Delta t} \\\\
\\end{aligned}
](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%0A%5Cbegin%7Baligned%7D%0A%5Cdot%7Bx_t%7D%20%26%3D%20%5Cfrac%7Bx_%7Bt%2B1%7D%20-%20x_%7Bt-1%7D%7D%7B2%20%5CDelta%20t%7D%20%5C%5C%0A%5Cddot%7Bx_t%7D%20%26%3D%20%5Cfrac%7Bx_%7Bt%2B1%7D%20-%202%20x_t%20%2B%20x_%7Bt-1%7D%7D%7B2%20%5CDelta%20t%7D%20%5C%5C%0A%5Cend%7Baligned%7D%0A "
\begin{aligned}
\dot{x_t} &= \frac{x_{t+1} - x_{t-1}}{2 \Delta t} \\
\ddot{x_t} &= \frac{x_{t+1} - 2 x_t + x_{t-1}}{2 \Delta t} \\
\end{aligned}
")

Example:

``` r
library(ForcePlate)
library(ggplot2)
## basic example code
      time = seq(0,6.28, 0.01)
      distance = sin(time)
      df = derivatives(y = distance, t = time)

      df = df[complete.cases(df), ]
      
      head(df)
#>      t           y        y.         y..
#> 2 0.01 0.009999833 0.9999333 -0.00999975
#> 3 0.02 0.019998667 0.9997833 -0.01999850
#> 4 0.03 0.029995500 0.9995334 -0.02999525
#> 5 0.04 0.039989334 0.9991835 -0.03998900
#> 6 0.05 0.049979169 0.9987336 -0.04997875
#> 7 0.06 0.059964006 0.9981839 -0.05996351
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
ggplot(data = df) + 
      geom_point(aes(x = t, y = y ), color = 'brown', alpha = 0.5) + 
      geom_point(aes(x = t, y = y.), color = 'darkgrey', alpha = 0.5)  + 
      geom_point(aes(x = t, y = y.. ), color = 'darkgreen', alpha = 0.5) 
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />
