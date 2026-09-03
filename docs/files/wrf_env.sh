# --- Entorno para WRF/WPS (aislado, no afecta otro software) ---
export dir=$HOME/wrf_build
export NETCDF=${dir}/netcdf
export LD_LIBRARY_PATH=${NETCDF}/lib:${dir}/grib2/lib:${dir}/lib:${LD_LIBRARY_PATH}
export PATH=${NETCDF}/bin:${dir}/mpich/bin:${dir}/bin:${PATH}
export JASPERLIB=${dir}/grib2/lib
export JASPERINC=${dir}/grib2/include
