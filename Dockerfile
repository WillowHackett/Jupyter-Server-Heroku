FROM kalilinux/kali-rolling
EXPOSE 8080

RUN apt update -y
RUN apt install curl -y
RUN apt install unrar -y
RUN apt install wget -y
RUN apt install jupyter -y
RUN apt install unzip -y
RUN apt install pip -y
RUN apt install unzip -y
RUN pip install jupyter_http_over_ws
RUN jupyter serverextension enable --py jupyter_http_over_ws
RUN jupyter notebook --NotebookApp.allow_origin='https://colab.research.google.com' --no-browser
# Add other pakages before deployment 
# RUN apt install <your-pakage> -y
RUN mkdir /JupyterNotebooks
COPY JupyterNotebooks /JupyterNotebooks
COPY jupyter.py /conf/jupyter.py
COPY jupyter_notebook_config.json /root/.jupyter/jupyter_notebook_config.json

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
