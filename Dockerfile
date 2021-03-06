FROM microsoft/dotnet:latest
COPY src/Mvc /app
COPY src/Mvc/deploy /app
WORKDIR /app
RUN ["dotnet", "restore"]
RUN ["dotnet", "build"]
EXPOSE 11001/tcp
ENV ASPNETCORE_URLS https://*:11001
ENTRYPOINT ["dotnet", "run", "--server.urls", "http://*:11001"]