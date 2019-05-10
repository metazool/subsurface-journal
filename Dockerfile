FROM jupyter/minimal-notebook


ADD requirements.txt .
RUN conda install --file requirements.txt

USER jovyan
COPY submissions/ submissions/
ADD scripts/execute_notebooks.sh .
RUN bash execute_notebooks.sh
