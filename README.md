# Rain probability distribution
This project uses a NetCDF file in which daily precipitation data are stored on a gridded dataset (see data for example) and computes gamma generalized parameters fitting those data. `xarray` is used to manipulate dataset

# Gamma distribution fitting
Following [@Villalobos] precipitation intensities tend to follow gamma distributions: in order to compare two different periods (ie: actual and future) one can easily fit $$\Gamma$$ parameters and make some inference expecially on extremes probability.

# References
@Villalobos: https://doi.org/10.1175/JAS-D-18-0343.1
