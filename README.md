# Pokedex iOS Application
Displays original 151 pokemon along with statistics surrounding each of them, data is queried from https://pokeapi.co
## Protocol Oriented Programming (POP)
This app utilizes a data service protocol (interface), specifying the functionality of delegates pulling data from different sources. This allows for a production data service (pulling data from https://pokeapi.co REST api) and mock data service decoding from locally stored JSON files.
## MVVM Architecture
The following architectural pattern is used in this app. ViewModels for catalog view as well as detailed view were created following seperation of concerns.