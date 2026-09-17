export CC=gcc
export CXX=g++
export FC=gfortran
export F77=gfortran
export FCFLAGS="-m64 -fallow-argument-mismatch"
export FFLAGS="-m64 -fallow-argument-mismatch"
export LDFLAGS="-L${dir}/lib -L${NETCDF}/lib -L${dir}/grib2/lib"
export CPPFLAGS="-I${dir}/include -I${NETCDF}/include -I${dir}/grib2/include -fcommon"


