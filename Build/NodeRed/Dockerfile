FROM nodered/node-red

# Copy package.json to the WORKDIR so npm builds all
# of your added nodes modules for Node-RED
#COPY package.json .
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

RUN npm i node-red-node-base64

# Copy _your_ Node-RED project files into place
# NOTE: This will only work if you DO NOT later mount /data as an external volume.
#       If you need to use an external volume for persistence then
#       copy your settings and flows files to that volume instead.

ENV FLOWS=flows_iefdemo.json

COPY settings.js /data/settings.js
COPY flows_iefdemo.json /data/flows_iefdemo.json
COPY flows_iefdemo_cred.json /data/flows_iefdemo_cred.json

#COPY settings.js .
#COPY flows_lo2fe.json .
#COPY flows_lo2fe_cred.json .

#COPY copyflow scrip to container
COPY Scripts/iefedge_dockerentrypoint.sh /usr/src/node-red/iefedge_dockerentrypoint.sh

USER root
RUN ["chmod", "+x", "/usr/src/node-red/iefedge_dockerentrypoint.sh"]

# You should add extra nodes via your package.json file but you can also add them here:
#WORKDIR /usr/src/node-red
#RUN npm install node-red-node-smooth
USER node-red
ENTRYPOINT [ "/usr/src/node-red/iefedge_dockerentrypoint.sh" ]
CMD ["npm", "start", "--cache", "/data/.npm", "--", "--userDir", "/data"]
