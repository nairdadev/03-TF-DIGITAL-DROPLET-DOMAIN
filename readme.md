 **Creación de droplet en Digital Ocean con terraform con deploy proyecto**

**Primer paso:** Descargar/instalar Terraform desde la  [Web de Terraform](https://www.terraform.io/)

**Segundo paso:** Genera Api key de Digital Ocean esto se encuentra en: account -> api, ahí presionar el botón que dice "Generate new Token" 

**Tercer paso:** Crear carpeta de Terraform en donde estarán los archivos.

**Cuarto paso:** Generar el archivo _provider.tf

**Quinto paso:** Generar el archivo main.tf 
__________________
**Comandos Terraform:**

**terraform init:** descarga el provider que configuramos. 

**terraform plan:** nos muestra que se va a crear

**terraform apply:** Ejecuta proceso de creación 

**terraform destroy:** Borra el droplet creado

____

**NOTAS:**
Copiar la clave publica de nuestra pc..que se encuentra en: ~/.ssh/id_rsa.pub y copiarlo a la carpeta files

el archivo user-data.sh indica lo que vamos a instalar en este caso lo necesario para NODEJS hay un proyecto de ejemplo en el mismo.
