con la siguiente estructura:
{
   "_id": ObjectId("611d50c8f95ca2c67d6ab44c"),
   "idPaciente4": 10292,
   "edad4": 18,
   "genero4": "Masculino"
} 
crear una consulta que haga un count de todos los registros que cumplan que el campo "edad4"  sea menor a 18



# Bases de Datos 2 - Practica 2

| Integrantes                        | Carnet    |
| --------------------------------- | --------- |
| Sergio Ariel Ramirez Castro       | 201020252 |

## a. Pediátrico: menores de 18 años

#### * *filter*
{ edad4: { $lt:18
 } } 
#### * *project*
{_id: 0, idPaciente4:1, edad4:1,genero4:1}



## b. Mediana edad: entre 18 y 60 años
#### * *filter*
{ edad4: { $gte: 18, $lte: 60 } } 
#### * *project*
{_id: 0, idPaciente4:1, edad4:1,genero4:1}


## c. Geriátrico: mayores de 60 años
#### * *filter*
```json
{ edad4: { $gt: 60 } }
```
#### * *project*
```json
{_id: 0, idPaciente4:1, edad4:1,genero4:1}
```


## 2. Cantidad de pacientes que pasan por cada habitación
```json
//segundo documento
{
  _id: '$idHabitacion1',
  conteoPacientesXHabitacion: {
    '$sum': 1
  }
}

// tercer documento
{
  _id: '$idHabitacion2',
  conteoPacientesXHabitacion: {
    '$sum': 1
  }
}
```


## 3. Cantidad de pacientes que llegan a la clínica, agrupados por género

```json
{
  _id: '$genero4',
  total_genero: {
    '$sum': 1
  }
}
```


## 4. Top 5 edades más atendidas en la clínica

## 5. Top 5 edades menos atendidas en la clínica

## 6. Top 5 habitaciones más utilizadas

## 7. Top 5 habitaciones menos utilizadas

## 8. Día con más pacientes en la clínica