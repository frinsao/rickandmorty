
![logo](https://m.media-amazon.com/images/I/91MteSqsrJL.jpg)

# Rick&Morty

¡Hola!

En este ejemplo, os presento una app de prueba utilizando una *arquitectura MVVM*, integrando *UserCase, Builder* y *Router*. 

En primera instancia, tenemos la pantalla inicial, donde visalizamos la lista de personajes. Además, integramos un campo de búsqueda de personajes por nombre.

En segundo lugar, accedemos a la pantalla de detalle, en la cual podemos ver todos los datos obtenidos de la *API* referente a ese personaje.

Por último, he añadido unos ejemplos de *Test Unitarios* del caso de uso utilizado.


### Arquitectura

**-ViewModel:** Utilizado para comunicar la información a la parte de *UI*, extraer la información de *UserCase* o decirle al *Router* que tiene que pasar a otra pantalla.

**- UserCase:** Define los casos de uso del dominio que se van a usar, tratando la información y mandándola al ViewModel si ha finalizado.

**- Router:** Empleado para la carga y la comunicación entre *vistas*.

**- Builder:** Instancia el *Controlador* y hace la *Inyección de Dependencias* necesaria.

**- DTO:** Es la *estructura* de datos tal y como se recibe del servidor.

**- DO:** Es la *entidad/clase* final de los datos tratados.

**- Repository:** Es donde se define el *Endpoint* de la *API REST* a la que hace la petición, y donde recibe la información de estado de estas peticiones.

#### Nota

- Se utiliza **async await** de forma 100% nativa.
- Para su total integración y facilitar los test unitarios próximos se emplean *Protocols*.


#### Datos de interés
 - [Api Rick&Morty](https://rickandmortyapi.com/)
 - [File Template](https://github.com/frinsao/swift-FileTemplates-MVVM)

 
