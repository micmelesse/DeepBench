From micmelesse/miopen
RUN apt update && apt install -y miopen-hip rccl
ENV HCC_HOME=/opt/rocm
