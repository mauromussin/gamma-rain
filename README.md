# Rain probability distribution
This project uses a NetCDF file in which daily precipitation data are stored on a gridded dataset (see data for example) and computes gamma generalized parameters fitting those data. `xarray` is used to manipulate dataset

# Gamma distribution fitting
Following [@Villalobos] precipitation intensities tend to follow gamma distributions: in order to compare two different periods (ie: actual and future) one can easily fit $$\Gamma$$ parameters and make some inference expecially on extremes probability.
The PDF of rain follows:

$$
f(x; k, \theta) = \frac{1}{\theta^k \cdot \Gamma(a)} \cdot x ^{k - 1} \cdot e^\left(-\frac{x}{\theta}\right)
$$
where:

- x is the daily precipitation (x>0)
- k is the shape parameter
- $\theta$ is the scale parameter
- $\Gamma$(\cdot ) is the Gamma function

or
$$
p (P) = A \cdot P ^  {-\tau _P} \cdot e ^ {- \frac{P}{P _L}}
$$

where:

$\tau{_P}$ (<1) is a power law exponent governing the rate of decay of the PDF  
P_L = $\theta$ can be regarded as a dailiy precipitation cutoff scale, where the pdf drops sharply

In order to improve data fitting it is possible to use a generalized gamma funcion for PDF:

$$
f(x; a, c, \theta, d) = \frac{c}{\theta^a \cdot \Gamma(a/c)} \cdot \left( {{x-d}} \right)^{a-1} \cdot \exp \left( - \left( \frac{x-d}{\theta} \right)^c \right)
$$
where:

a: is the main shape parameter. It controls the PDF shape expecially on the tail.  
c: is the additional shape parameter. It offers more flexibility and fits more distributions.  
$\theta$ : is the scale parameter. It drives the span of the PDF: the higher $\theta$ the narrover the PDF.  
d: is the shift factor: follows the minimum of the precipitaton values. If all daily precipitation data are > 1mm could be set  =1
## pseudocode
1. Opens the NetCDF file using xarray.
2. Extracts precipitation data and converts the dates to pandas format.
3. Filters the precipitation data for the period from 1986 to 2015.
4. Filters positive precipitation data (greater than zero) to fit Gamma and Weibull distributions.
5. Calculates the parameters of the Gamma distributions using scipy.stats.
6. Calculates the log-likelihood 
7. Calculates AIC and BIC 
8. Prints the parameters and goodness-of-fit values.
9. Plots a histogram of the filtered daily precipitation data with the Gamma distribution curve and data overlaid.
10. Displays the resulting plot with the y-axis set to a logarithmic scale.
## generalized Gamma distribution
The probability density function (PDF) of the generalized Gamma distribution is given by:

$$
f(x; a, c, d, p) = \frac{p}{c \cdot \Gamma\left(\frac{a}{p}\right)} \left(\frac{x - d}{c}\right)^{\frac{a}{p} - 1} \exp\left[-\left(\frac{x - d}{c}\right)^p\right]
$$

where:

- \( x \geq d \)
- \( a > 0 \) is the shape parameter
- \( c > 0 \) is the scale parameter
- \( d \) is the location (shift) of the data
- \( p > 0 \) is the additional shape parameter
- \( \Gamma(\cdot) \) is the Gamma function


# References
@Villalobos: https://doi.org/10.1175/JAS-D-18-0343.1
