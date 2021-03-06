SCRIPTS PARA LA ESTANDARIZACION DE MENSAJE DE COMMITS


Clonar el repositorio baustro_hooks en ~/.baustro. Esto creará un directorio con la siguientes estructura:
	* .baustro/instalar.sh: script que ejecuta los procesos de instalación de los repositoriso de hooks y establece los parámetros necesarios para que GIT los reconozca.
	* .baustro/lista-negra.txt: archivo que almacena los nombres de los repositorios que deben cumplir el estándar.
	* .baustro/hooks: subdirectorio que almacena los hooks disponibles. Aquí se puede encontrar los siguientes scripts:
		* commit-msg: contiene el código que verifica que el mensaje del commit cumpla con el estándar antes de ejecutar el commit.
		* post-merge: contiene el código que verifica si el repositorio de hooks clonado en la máquina local necesita ser actualizado con el remoto debido a cambios realizados (por ejemplo, por una posible actualización de hooks).

Una vez clonado el repositorio, ejecutar "sh .baustro/instalar.sh".


** NOTAS **
- Debe existir un repositorio "baustro_hooks" en el sistema de versionamiento.
- verificar la URL del repositorio origen en el archivo "instalar.sh"
- Cargar en "lista-negra.txt" los repositorios que deben apegarse al estándar de mensajes del commit.


** TODO **
- El proceso de actualización de repositorio de hooks puede manejarse en un archivo separado (por ejemplo .baustro/hooks/actualizar.sh) el cual sea llamado por los hooks destinados a ejecutar la actualización. De esa manera, si se desea que la actualización se haga antes de un commit, en lugar de copiar el código de post-merge a pre-commit se podría simplemente en pre-commit llamar al script de actualización. Esto evitaría duplicidad de código.
- Pendiente el proceso de ejecución automática del script para que sea transparente al desarrollador.
