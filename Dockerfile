FROM microsoft/dotnet-framework:4.7.1-sdk

RUN mkdir C:\Agent
WORKDIR C:/Agent

ENV TFS_URL=unset
ENV TFS_POOL=unset
ENV TFS_AGENTNAME=unset
ENV TFS_USERNAME=unset
ENV TFS_PASSWORD=unset
ENV TFS_AUTH=unset
ENV AGENT_WORKSPACE=unset

COPY ./agent.zip ./

RUN Expand-Archive -Path .\agent.zip -DestinationPath . ; \ 
    Remove-Item -Path .\agent.zip
	
CMD	.\config.cmd --unattended --url $Env:TFS_URL --auth $Env:TFS_AUTH --pool $Env:TFS_POOL --agent $Env:TFS_AGENTNAME --username $Env:TFS_USERNAME --password $Env:TFS_PASSWORD --work $Env:AGENT_WORKSPACE ; .\run.cmd