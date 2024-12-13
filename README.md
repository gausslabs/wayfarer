Wayfarer
========

A hardware acceleration approach to search for equivalent circuit for a given circuit.

Architecture Overview
---------------------

### Highlevel architecture

The below diagram is an overview of all the elements and their inter-communication. The structure is of one master that generates expectations, which are then sent to the search agents, who try random combinations of gates and inputs to match the expectations of the desired circuit. 

![Highlevel architecture](./Docs/High-level-Architecture-Wayfarer%20Search%20Architecture.drawio.png "Highlevel architecture")

### Stream Interface

This the interface that is exposed to the other systems to initiate and get results from computations.

![Stream Interface](./Docs/High-level-Architecture-Stream%20Intreface%20to%20System.drawio.png "Stream Interface")