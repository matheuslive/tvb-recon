FROM tvb-recon-software

#TVB-RECON
#RUN apt-get install -y python-pip
ADD https://api.github.com/repos/matheuslive/tvb-recon/git/refs/heads/master version.json
RUN cd /opt && git clone https://github.com/matheuslive/tvb-recon.git
RUN conda install -y python=2.7 setuptools numpy scipy matplotlib pytest h5py scikit-learn Cython graphviz
RUN pip install trimesh anytree gdist
RUN cd /opt/tvb-recon && python setup.py develop
RUN conda create -n tvb_recon_python3_env python=3.6 anaconda
COPY --chown=${SUBMIT_USER} pegasus /opt/tvb-recon/pegasus
RUN chown ${SUBMIT_USER} -R /opt/tvb-recon

WORKDIR /opt/tvb-recon
RUN [ "/bin/bash", "-c", "source /opt/conda/bin/activate tvb_recon_python3_env && python setup.py develop && pip install nibabel" ]

EXPOSE 5000
USER ${SUBMIT_USER}
COPY start_condor_and_run.sh /opt/
CMD ["sh", "/opt/start_condor_and_run.sh", "1"]
