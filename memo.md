# Mi Cheat Sheet de DevOps

Comandos y conceptos aprendidos. Se actualiza cada día.

---

## TERMINAL — Navegación

- `pwd` → muestra en qué carpeta estoy parado (Print Working Directory)
- `ls` → lista los archivos de la carpeta actual
- `ls -la` → lista todos los archivos incluyendo ocultos (-a) con detalles (-l)
- `cd carpeta` → entrar a una carpeta (Change Directory)
- `cd ..` → subir un nivel (carpeta padre)
- `cd ~` o `cd` → volver a mi carpeta home
- `~` → atajo que significa mi carpeta home (/Users/javier)

## TERMINAL — Manejo de archivos

- `mkdir nombre` → crear una carpeta (Make Directory)
- `mkdir -p ruta/larga` → crear carpeta y las padres si no existen
- `touch archivo.txt` → crear un archivo vacío
- `cat archivo.txt` → mostrar el contenido de un archivo en pantalla
- `echo "texto"` → imprimir texto en pantalla
- `echo "texto" > archivo.txt` → escribir en un archivo (SOBREESCRIBE)
- `echo "texto" >> archivo.txt` → AGREGAR al final del archivo (no borra)
- `cp origen destino` → copiar un archivo
- `cp -r carpeta1 carpeta2` → copiar una carpeta (-r = recursivo)
- `mv origen destino` → mover o renombrar (NO borra, recuperable)
- `rm archivo` → BORRAR permanentemente (¡no hay papelera, irrecuperable!)
- `rm -r carpeta` → borrar carpeta y su contenido
- `rm -rf carpeta` → borrar forzado sin preguntar (PELIGROSO, leer 2 veces antes)

## TERMINAL — Filtros y composición

- `grep "texto" archivo` → filtra líneas que contienen "texto"
- `head -10` → muestra las primeras 10 líneas
- `|` (pipe) → manda la salida de un comando como entrada del siguiente
    - Ejemplo: `ls | grep ".txt"` → lista archivos y filtra solo los .txt

## TERMINAL — Permisos (chmod)

Permisos: r=leer(4), w=escribir(2), x=ejecutar(1). Se suman.
Tres grupos: dueño / grupo / otros.

- `chmod 644 archivo` → dueño lee+escribe, otros solo leen (archivos normales)
- `chmod 755 script.sh` → dueño todo, otros leen+ejecutan (scripts y carpetas)
- `chmod 600 archivo` → solo el dueño lee+escribe (secretos, llaves SSH)
- `ls -la` → ver los permisos actuales (ej: -rwxr-xr-x)

## TERMINAL — Info del sistema

- `whoami` → muestra mi usuario actual
- `date` → muestra fecha y hora
- `df -h` → muestra espacio en disco (human readable)
- `uptime` → hace cuánto está prendido el equipo y su carga
- `$?` → muestra el exit code del último comando (0 = éxito)

---

## GIT — Flujo básico

Las 3 etapas: Working Directory → Staging Area → Repository → GitHub

- `git status` → ¿qué cambió? (mi mejor amigo, usarlo siempre)
- `git add archivo` → preparar UN archivo para el commit (lo manda a Staging)
- `git add .` → preparar TODOS los cambios de la carpeta actual
- `git commit -m "mensaje"` → guardar una "foto" local con un mensaje
- `git push` → subir mis commits locales a GitHub
- `git pull` → bajar cambios de GitHub a mi Mac
- `git fetch` → consultar si hay cambios en GitHub (sin descargarlos)
- `git clone URL` → bajar un repo completo por primera vez
- `git log` → ver el historial de commits (salir con la tecla q)
- `git rm --cached archivo` → sacar archivo del tracking sin borrarlo del disco

## GIT — Estados que muestra git status

- "Changes not staged for commit" → editado pero NO en staging (falta git add)
- "Changes to be committed" → en staging, listo para commit
- "nothing to commit, working tree clean" → no hay cambios pendientes
- "Your branch is ahead of origin by X commits" → tengo commits sin pushear

---

## BASH SCRIPTING — Estructura

- `#!/bin/bash` → shebang, primera línea SIEMPRE, dice que se ejecuta con bash
- `# comentario` → bash ignora todo después del #
- `chmod 755 script.sh` → darle permiso de ejecución
- `./script.sh` → ejecutar el script (el ./ = "en esta carpeta")

## BASH SCRIPTING — Variables

- `nombre="Javier"` → CREAR variable (SIN $ y SIN espacios alrededor del =)
- `echo "$nombre"` → USAR variable (CON $ y con comillas)
- `$1`, `$2`, `$3` → argumentos pasados al script
- `$#` → cantidad de argumentos
- `$HOME` → variable de entorno, igual que ~ (mi carpeta home)
- `$(comando)` → ejecuta el comando y reemplaza por su resultado
- `resultado=$((2 + 3))` → operación matemática

## BASH SCRIPTING — Condicionales

if [ condición ]; then
elif [ otra ]; then
else
fi

## BASH SCRIPTING — Comparaciones

Para archivos/carpetas:
- `-e ruta` → ¿existe?
- `-d ruta` → ¿es una carpeta?
- `-f ruta` → ¿es un archivo?
- `-r / -w / -x ruta` → ¿tengo permiso de leer/escribir/ejecutar?

Para texto (strings):
- `-z "$var"` → ¿está VACÍA? (z = zero length)
- `-n "$var"` → ¿NO está vacía?
- `"$a" = "$b"` → ¿son iguales?
- `"$a" != "$b"` → ¿son distintos?

Para números:
- `-eq` igual / `-ne` distinto
- `-lt` menor / `-gt` mayor
- `-le` menor o igual / `-ge` mayor o igual

## BASH SCRIPTING — Loops

for variable in lista; do
# hacer algo con cada elemento
done

Ejemplos de lista:
- `for f in manzana banana kiwi` → lista explícita
- `for f in ~/*.txt` → todos los .txt del home
- `for i in {1..5}` → números del 1 al 5

Dentro del loop:
- `continue` → saltar a la siguiente iteración

## BASH SCRIPTING — Exit codes

- `exit 0` → terminar con ÉXITO (todo bien)
- `exit 1` → terminar con ERROR (1 a 255 = algún error)
- `comando1 && comando2` → ejecuta comando2 SOLO si comando1 tuvo éxito
- `comando1 || comando2` → ejecuta comando2 SOLO si comando1 falló

## BASH SCRIPTING — Input interactivo

- `read variable` → pausa y espera que el usuario escriba algo
- `read -s variable` → igual pero oculta lo que se escribe (passwords)

---

## CONCEPTOS CLAVE

- **Git vs GitHub**: Git es el programa local en mi Mac que controla versiones.
  GitHub es el sitio web en la nube (de Microsoft) donde guardo copias.

- **SSH**: forma segura de conectar mi Mac a GitHub/servidores sin password.
    - Llave privada (id_ed25519): secreta, vive en mi Mac en ~/.ssh/
    - Llave pública (id_ed25519.pub): la pego en GitHub, no es secreta
    - Si pierdo el Mac, genero llaves nuevas (son desechables)

- **PATH**: lista de carpetas donde la terminal busca programas.
  Si un programa no está en el PATH → "command not found".

- **gestor de paquetes (Homebrew)**: instala herramientas con un comando.
  `brew install nombre`. En Linux sería apt o yum.

- **.gitignore**: archivo que le dice a Git qué ignorar (no trackear).
  Típico ignorar: .DS_Store, .idea/, .env, node_modules/

- **Argumentos vs input interactivo**: en DevOps se prefieren ARGUMENTOS
  (para automatizar). El input interactivo (read) es para humanos que eligen.

- **dry-run**: simular qué haría un script destructivo antes de ejecutarlo
  de verdad. Buena práctica antes de mover/borrar cosas.