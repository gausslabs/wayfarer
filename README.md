Wayfarer
========

A hardware acceleration approach to search for equivalent circuit for a given circuit.

Architecture Overview
---------------------

### Mental Model

We are trying to break up the search space into smaller sections and have our search agents explore their sections of the search space to find the circuit. We should limit the overlap between the agents to improve the system's efficiency.

![Mental model](./Docs/Mental-Model.svg "Mental model")

### Highlevel architecture

The below diagram is an overview of all the elements and their inter-communication. The structure is of one master that generates expectations, which are then sent to the search agents, who try random combinations of gates and inputs to match the expectations of the desired circuit. 

![Highlevel architecture](./Docs/Architecture.svg "Highlevel architecture")

### Stream Interface

This the interface that is exposed to the other systems to initiate and get results from computations.

![Stream Interface](./Docs/StreamInterface.svg "Stream Interface")