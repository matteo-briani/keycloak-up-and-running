# keycloak up and running
Simple dockerized KeyCloak. 
To start experimenting, uncomment the temporary KeyCloak password in the docker-compsoe.yaml file and run
```
docker-compose up -d
```
Change admin password, comment it again in the docker-compose.yaml file and enable 2FA in the admin console.
Enjoy

## Custom theme

To change the look-n-feel, a custom-theme directory ```custom-theme``` is provided.
One needs to map the custom-theme directory and the standalone.xml file into the dockerize KeyCloak instance.
This is done uncommenting the appropriate lines in the ```docker-compose.yaml``` file.
The standalone.xml has been edited to disable the cache, so there is an immediate update of the custom-theme.
For reference, the standalone.xml has been modified on these lines:
```
<staticMaxAge>-1</staticMaxAge>
<cacheThemes>false</cacheThemes>
<cacheTemplates>false</cacheTemplates>
```
The custom-theme is based on chapter 13 of [this](https://github.com/PacktPublishing/Keycloak-Identity-and-Access-Management-for-Modern-Applications).
Another resource to look may be [this](https://github.com/austincunningham/raincatcher-keycloak-theme).
