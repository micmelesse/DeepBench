FROM micmelesse/miopen
RUN git config --global url."https://658d11a03b05366fd1e60f64c7872b9b21c8e044:@github.com/".insteadOf "https://github.com/"
RUN git clone https://github.com/AMDComputeLibraries/MLOpen.git
RUN cd MLOpen && \
git checkout disable_rocblas_rnn && \
mkdir build && \
cd build && \
CXX=/opt/rocm/hcc/bin/hcc cmake -DMIOPEN_BACKEND=HIP -DCMAKE_PREFIX_PATH="/opt/rocm/hcc;/opt/rocm/hip" .. && \
make package
RUN apt update
RUN apt install -y miopengemm rocm-utils
RUN cd /MLOpen/build && dpkg --force-all -i *.deb
# ENV HCC_HOME=/opt/rocm
