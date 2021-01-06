FROM mcr.microsoft.com/powershell:lts-ubuntu-18.04

LABEL "com.github.actions.name"="Frontmatter to JSON Converter"
LABEL "com.github.actions.description"="Convert frontmatter in a markdown document to a JSON string for further processing"
LABEL "com.github.actions.icon"="arrow-right"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/aliencube/frontmatter-to-json-actions"
LABEL "homepage"="http://github.com/aliencube"
LABEL "maintainer"="Justin Yoo <no-reply@aliencube.com>"

ADD entrypoint.ps1 /entrypoint.ps1
RUN chmod +x /entrypoint.ps1

ENTRYPOINT ["pwsh", "-File", "/entrypoint.ps1"]
